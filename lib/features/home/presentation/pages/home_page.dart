import 'package:codex_z/common/widgets/app_background.dart';
import 'package:codex_z/core/constants/app_sizes.dart';
import 'package:codex_z/core/extensions/context_extensions.dart';
import 'package:codex_z/features/home/presentation/widgets/dashboard_tab.dart';
import 'package:codex_z/features/home/presentation/widgets/home_sidebar.dart';
import 'package:codex_z/features/home/presentation/widgets/home_tab_item.dart';
import 'package:codex_z/features/settings/presentation/widgets/settings_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum HomeTab { home, settings }

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = useState(HomeTab.home);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.pagePadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HomeSidebar(
                  title: context.l10n.homeTitle,
                  children: [
                    HomeTabItem(
                      leading: Icons.home_outlined,
                      selectedLeading: Icons.home_rounded,
                      title: context.l10n.home,
                      selected: selectedTab.value == HomeTab.home,
                      onTap: () => selectedTab.value = HomeTab.home,
                    ),
                    HomeTabItem(
                      leading: Icons.settings_outlined,
                      selectedLeading: Icons.settings_rounded,
                      title: context.l10n.settings,
                      selected: selectedTab.value == HomeTab.settings,
                      onTap: () => selectedTab.value = HomeTab.settings,
                    ),
                  ],
                ),
                SizedBox(width: AppSizes.sectionGap),
                Expanded(
                  child: IndexedStack(
                    index: selectedTab.value.index,
                    children: const [DashboardTab(), SettingsTab()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
