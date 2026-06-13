import 'package:codex_z/core/constants/app_sizes.dart';
import 'package:codex_z/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class HomeTabItem extends StatelessWidget {
  const HomeTabItem({
    super.key,
    required this.leading,
    required this.selectedLeading,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  final IconData leading;
  final IconData selectedLeading;
  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final foreground = selected
        ? colorScheme.onPrimary
        : colorScheme.onSurface.withValues(alpha: 0.78);
    final background = selected
        ? colorScheme.primary
        : colorScheme.surface.withValues(alpha: context.isDark ? 0.04 : 0.26);

    return Tooltip(
      message: title,
      waitDuration: const Duration(milliseconds: 500),
      child: Material(
        color: background,
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
        child: ListTile(
          selected: selected,
          onTap: onTap,
          dense: true,
          minTileHeight: AppSizes.tabHeight,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppSizes.itemGap + 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.cardRadius),
            side: BorderSide(
              color: selected
                  ? colorScheme.primary.withValues(alpha: 0.18)
                  : colorScheme.outlineVariant.withValues(alpha: 0.20),
            ),
          ),
          leading: Icon(
            selected ? selectedLeading : leading,
            size: AppSizes.tabIconSize,
            color: foreground,
          ),
          title: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: foreground,
              fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
