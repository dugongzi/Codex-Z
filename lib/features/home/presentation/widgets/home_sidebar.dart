import 'dart:async';

import 'package:shim/core/constants/app_sizes.dart';
import 'package:shim/core/extensions/context_extensions.dart';
import 'package:shim/features/home/presentation/providers/inject_action_provider.dart';
import 'package:shim/features/home/presentation/widgets/inject_button.dart';
import 'package:shim/features/home/presentation/widgets/open_inspector_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeSidebar extends StatelessWidget {
  const HomeSidebar({super.key, required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: AppSizes.sidebarWidth,
      child: Container(
        padding: EdgeInsets.all(AppSizes.itemGap),
        decoration: BoxDecoration(
          color: colorScheme.surface.withValues(
            alpha: context.isDark ? 0.68 : 0.76,
          ),
          borderRadius: BorderRadius.circular(AppSizes.cardRadius + 4),
          border: Border.all(
            color: colorScheme.outlineVariant.withValues(
              alpha: context.isDark ? 0.18 : 0.42,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: context.isDark ? 0.18 : 0.06,
              ),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SidebarBrand(title: title),
            SizedBox(height: AppSizes.sectionGap),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: children.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSizes.itemGap),
                itemBuilder: (context, index) => children[index],
              ),
            ),
            const OpenInspectorButton(debugPort: 9229),
            SizedBox(height: AppSizes.itemGap),
            const InjectButton(debugPort: 9229),
            SizedBox(height: AppSizes.itemGap),
            const SidebarStatus(),
          ],
        ),
      ),
    );
  }
}

class SidebarBrand extends StatelessWidget {
  const SidebarBrand({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.itemGap,
        vertical: AppSizes.itemGap,
      ),
      child: Row(
        children: [
          Container(
            width: 34.cr(min: 30, max: 38),
            height: 34.cr(min: 30, max: 38),
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(10.cr(min: 8, max: 12)),
            ),
            child: Icon(
              Icons.terminal_rounded,
              color: colorScheme.onPrimary,
              size: 18.cr(min: 16, max: 20),
            ),
          ),
          SizedBox(width: 10.cw(min: 8, max: 12)),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarStatus extends HookConsumerWidget {
  const SidebarStatus({super.key, this.debugPort = 9229});

  final int debugPort;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final asyncStatus =
        ref.watch(isDebugPortAliveProvider(debugPort: debugPort));

    final pollInterval = asyncStatus.isLoading
        ? const Duration(seconds: 1)
        : asyncStatus.value == true
            ? const Duration(seconds: 10)
            : const Duration(seconds: 2);

    useEffect(() {
      final timer = Timer.periodic(pollInterval, (_) {
        ref.invalidate(isDebugPortAliveProvider(debugPort: debugPort));
      });
      return timer.cancel;
    }, [debugPort, pollInterval]);

    final Color dotColor;
    final String text;
    if (asyncStatus.isLoading) {
      dotColor = colorScheme.onSurfaceVariant;
      text = context.l10n.checkingStatus;
    } else if (asyncStatus.value == true) {
      dotColor = Colors.green;
      text = context.l10n.codexConnected;
    } else {
      dotColor = Colors.red;
      text = context.l10n.codexDisconnected;
    }

    return Container(
      padding: EdgeInsets.all(10.cw(min: 8, max: 12)),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(
          alpha: context.isDark ? 0.10 : 0.42,
        ),
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.22),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: AppSizes.itemGap),
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          IconButton(
            tooltip: context.l10n.refresh,
            visualDensity: VisualDensity.compact,
            iconSize: 16,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () => ref.invalidate(
              isDebugPortAliveProvider(debugPort: debugPort),
            ),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
    );
  }
}
