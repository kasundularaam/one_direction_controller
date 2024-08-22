// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:one_direction_controller/application/connect/connect_cubit.dart';
import 'package:one_direction_controller/application/connection/connection_cubit.dart'
    as connection_cubit;
import 'package:one_direction_controller/application/control_direction/control_direction_cubit.dart';
import 'package:one_direction_controller/domain/controlled_direction/controlled_direction.dart';
import 'package:one_direction_controller/domain/controlled_direction/enum.dart';
import 'package:one_direction_controller/injection.dart';
import 'package:one_direction_controller/presentation/widgets/text.dart';
import 'package:one_direction_controller/presentation/widgets/toast.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<connection_cubit.ConnectionCubit>()..watchConnections(),
      child: Scaffold(
          body: SafeArea(
              child: Column(
        children: [
          BlocBuilder<connection_cubit.ConnectionCubit,
              connection_cubit.ConnectionState>(
            builder: (context, state) {
              if (!state.controlledDirection) {
                return const NotConnectedBar();
              }
              return const ConnectedBar();
            },
          ),
          const Expanded(flex: 1, child: SizedBox()),
          const Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: ControlButton(
                          iconData: Icons.arrow_left_rounded,
                          direction: Direction.left)),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                            child: ControlButton(
                                iconData: Icons.arrow_drop_up,
                                direction: Direction.forward)),
                        Expanded(
                            child: ControlButton(
                                iconData: Icons.stop,
                                direction: Direction.stop)),
                        Expanded(
                            child: ControlButton(
                                iconData: Icons.arrow_drop_down,
                                direction: Direction.backward)),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ControlButton(
                          iconData: Icons.arrow_right,
                          direction: Direction.right)),
                ],
              )),
        ],
      ))),
    );
  }
}

class ControlButton extends StatelessWidget {
  final IconData iconData;
  final Direction direction;

  const ControlButton(
      {super.key, required this.iconData, required this.direction});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ControlDirectionCubit>(),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Material(
          color: Colors.orange,
          child: Builder(builder: (context) {
            return InkWell(
                onTap: () => context
                    .read<ControlDirectionCubit>()
                    .turn(ControlledDirection(direction: direction)),
                child: Center(
                    child: Icon(
                  iconData,
                  size: 100,
                )));
          }),
        ),
      ),
    );
  }
}

class ConnectedBar extends StatelessWidget {
  const ConnectedBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.green,
      child: const Center(
        child: TextRegular(
          "Connected",
          color: Colors.white,
        ),
      ),
    );
  }
}

class NotConnectedBar extends StatelessWidget {
  const NotConnectedBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<ConnectCubit>(),
        child: BlocConsumer<ConnectCubit, ConnectState>(
          listener: (context, state) {
            state.maybeWhen(
                failed: (failure) => showFailedToast(context, failure.message),
                orElse: () {});
          },
          builder: (context, state) {
            return state.maybeWhen(
                loading: () => const _StateView(isLoading: true),
                orElse: () => const _StateView());
          },
        ));
  }
}

class _StateView extends StatelessWidget {
  final bool isLoading;

  const _StateView({this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isLoading ? Colors.blue : Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextRegular(
              isLoading ? "Connecting..." : "Not Connected",
              color: Colors.white,
            ),
          ),
          isLoading
              ? const CircularProgressIndicator()
              : TextButton.icon(
                  onPressed: () => context.read<ConnectCubit>().connect(),
                  label: const Text("Connect"),
                  icon: const Icon(Icons.qr_code),
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                )
        ],
      ),
    );
  }
}
