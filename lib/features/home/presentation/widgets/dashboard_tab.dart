import 'package:shim/common/widgets/surface_card.dart';
import 'package:shim/common/widgets/workspace_surface.dart';
import 'package:shim/core/constants/app_sizes.dart';
import 'package:shim/core/extensions/context_extensions.dart';
import 'package:shim/features/home/presentation/providers/inject_action_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardTab extends ConsumerWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WorkspaceSurface(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.pagePadding),
        child: Align(
          alignment: Alignment.topLeft,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: SurfaceCard(
              padding: EdgeInsets.all(24.cw(min: 18, max: 28)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const InjectPanelHeader(),
                  SizedBox(height: AppSizes.sectionGap),
                  Text(
                    context.l10n.injectPanelDescription,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: AppSizes.sectionGap),
                  const InjectStatusStrip(),
                  SizedBox(height: AppSizes.sectionGap),
                  InjectButton(
                    onPressed: () {
                      ref.read(
                        injectScriptProvider(
                          debugPort: 9229,
                          script: "document.body.style.background='red'",
                        ).future,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InjectPanelHeader extends StatelessWidget {
  const InjectPanelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48.cr(min: 42, max: 54),
          height: 48.cr(min: 42, max: 54),
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(AppSizes.cardRadius + 4),
          ),
          child: Icon(
            Icons.input_rounded,
            color: colorScheme.primary,
            size: 26.cr(min: 22, max: 30),
          ),
        ),
        SizedBox(width: AppSizes.sectionGap),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.injectPanelTitle,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 4.ch(min: 3, max: 6)),
              Text(
                context.l10n.homeTitle,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InjectStatusStrip extends StatelessWidget {
  const InjectStatusStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.cw(min: 10, max: 14),
        vertical: 10.ch(min: 8, max: 12),
      ),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.18)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.radio_button_checked_rounded,
            color: colorScheme.primary,
            size: 16,
          ),
          SizedBox(width: AppSizes.itemGap),
          Expanded(
            child: Text(
              context.l10n.injectReadyStatus,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InjectButton extends StatelessWidget {
  const InjectButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 46.ch(min: 42, max: 50),
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.play_arrow_rounded),
        label: Text(context.l10n.inject),
      ),
    );
  }
}
