import 'package:codex_z/common/widgets/app_background.dart';
import 'package:codex_z/core/constants/app_sizes.dart';
import 'package:codex_z/core/extensions/context_extensions.dart';
import 'package:codex_z/features/home/presentation/widgets/dashboard_tab.dart';
import 'package:codex_z/features/home/presentation/widgets/home_sidebar.dart';
import 'package:codex_z/features/settings/presentation/widgets/settings_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    final colorScheme = Theme.of(context).colorScheme;
    final tabs = [
      HomeTabItem(
        icon: Icons.home_outlined,
        selectedIcon: Icons.home_rounded,
        label: context.l10n.home,
      ),
      HomeTabItem(
        icon: Icons.settings_outlined,
        selectedIcon: Icons.settings_rounded,
        label: context.l10n.settings,
      ),
    ];

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
                  tabs: tabs,
                  selectedIndex: selectedIndex.value,
                  onChanged: (index) {
                    selectedIndex.value = index;
                  },
                ),
                SizedBox(width: AppSizes.sectionGap),
                Expanded(
                  child: IndexedStack(
                    index: selectedIndex.value,
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
