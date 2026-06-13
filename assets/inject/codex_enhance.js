// ==Shim==
// @name        Shim Injected Badge + Menu
// @description 在 Codex 工具栏「请求批准」按钮右侧显示已注入徽章，并在设置菜单顶部插入 Shim 菜单项
// @version     1.0.0
// @author      shim
// ==/Shim==
(() => {
  const BADGE_ID = '__shim_injected_badge__';
  const MENU_ITEM_ID = '__shim_menu_item__';
  const POPOVER_ID = '__shim_popover__';

  const BADGE_ANCHOR_SVG_D_PREFIX = 'M12.6683 4.16699C12.6683 3.84391';
  const SETTINGS_ANCHOR_SVG_D_PREFIX = 'M9.99944 7.24939';

  const SHIM_ICON_SVG = `
    <svg viewBox="0 0 1210 1024" width="20" height="20" xmlns="http://www.w3.org/2000/svg" class="icon-xs shrink-0 opacity-75 group-focus:opacity-100 group-hover:opacity-100">
      <path d="M929.170154 428.766111a24.122983 24.122983 0 0 1 24.205717 24.169078v108.663343a29.35416 29.35416 0 0 0 29.237151 29.350614h214.831653c14.863823 0 17.889538 21.483756 3.44175 25.411276L768.803729 740.837852a23.561571 23.561571 0 0 1-29.311611-15.998467 20.064271 20.064271 0 0 1-0.945536-6.694393v-113.582493a10.712921 10.712921 0 0 0-10.55218-10.590002H254.267944a10.657371 10.657371 0 0 1-10.55218-10.438716V455.959722a32.661172 32.661172 0 0 0-31.960294-32.787638l-201.635518-3.517393c-11.838109-0.491679-14.031752-17.137837-2.609679-20.57486l441.769711-127.540966a10.503721 10.503721 0 0 1 12.821466 7.37518 11.305063 11.305063 0 0 1 0.340393 2.685321v123.111131a24.320364 24.320364 0 0 0 24.169078 24.093435zM443.152911 135.94548c15.393324-2.609679 18.910717 17.549145 18.910717 17.549145s1.248107 47.769653 0 67.474619c-1.361572 19.667146-19.326753 18.910717-19.326752 18.910717H267.429803s-15.885002-5.711036-18.003003-26.3249c-2.685322-20.57486 21.89861-32.073758 21.89861-32.073757s156.54646-42.928509 171.714037-45.538188z m296.791882-55.674333s-2.269286-23.260182 23.756588-33.284043C789.526329 37.342638 928.489368 1.411094 928.489368 1.411094s25.833221-10.098323 27.573007 23.756588c1.77288 33.700079 0 311.543423 0 311.543423s0.907714 22.730682-23.638396 24.509471c-24.622935 1.77288-162.632165 0-162.632165 0s-29.842293 2.685322-29.842293-21.028717z m3.933429 722.785327c1.248107-19.704967 19.326753-18.910717 18.910717-19.364574h175.23143s15.393324 5.711036 18.003003 26.3249c2.685322 20.57486-21.974253 32.030027-21.974253 32.030027s-156.432996 42.928509-171.751858 45.503912c-15.393324 3.139179-18.419038-17.095288-18.419039-17.095288s-1.248107-47.656188 0-67.361155z m-278.259379 140.699279s2.571857 23.260182-23.756588 33.284044c-25.871043 9.57355-164.791532 45.538188-164.791532 45.538188s-25.908864 10.136144-27.563552-23.715221c-1.77288-33.700079 0-311.543423 0-311.543423s-0.907714-22.730682 23.638396-24.509471 162.632165 0 162.632165 0 26.665293-2.685322 29.842293 21.028717c2.987893 23.185721 0 39.830697 0 39.830698z" fill="currentColor"></path>
    </svg>
  `;

  // ========== 徽章 ==========

  function buildBadge(inline) {
    const badge = document.createElement('span');
    badge.id = BADGE_ID;
    Object.assign(badge.style, {
      display: 'inline-flex',
      alignItems: 'center',
      gap: '6px',
      padding: '4px 10px',
      background: 'rgba(0, 0, 0, 0.72)',
      color: '#fff',
      fontFamily: 'system-ui, -apple-system, sans-serif',
      fontSize: '12px',
      fontWeight: '600',
      borderRadius: '999px',
      boxShadow: '0 2px 6px rgba(0, 0, 0, 0.15)',
      pointerEvents: 'none',
      userSelect: 'none',
      whiteSpace: 'nowrap',
    });
    if (!inline) {
      Object.assign(badge.style, {
        position: 'fixed',
        right: '16px',
        bottom: '16px',
        zIndex: '2147483647',
      });
    }

    const dot = document.createElement('span');
    Object.assign(dot.style, {
      width: '8px',
      height: '8px',
      borderRadius: '50%',
      background: '#22c55e',
      boxShadow: '0 0 6px rgba(34, 197, 94, 0.8)',
    });

    const text = document.createElement('span');
    text.textContent = 'Shim Injected';

    badge.appendChild(dot);
    badge.appendChild(text);
    return badge;
  }

  function findBadgeAnchor() {
    const paths = document.querySelectorAll('svg path');
    for (const path of paths) {
      const d = path.getAttribute('d');
      if (d && d.startsWith(BADGE_ANCHOR_SVG_D_PREFIX)) {
        const button = path.closest('button');
        if (!button) continue;
        return button.parentElement?.parentElement ?? button.parentElement;
      }
    }
    return null;
  }

  function ensureBadge() {
    const existing = document.getElementById(BADGE_ID);
    const anchor = findBadgeAnchor();
    if (anchor) {
      if (existing && existing.parentElement === anchor) return;
      existing?.remove();
      anchor.appendChild(buildBadge(true));
      return;
    }
    if (existing) return;
    (document.body || document.documentElement).appendChild(buildBadge(false));
  }

  // ========== Shim 菜单项（插入到 Codex 设置菜单顶部） ==========

  function findSettingsMenuList() {
    const paths = document.querySelectorAll('svg path');
    for (const path of paths) {
      const d = path.getAttribute('d');
      if (!d || !d.startsWith(SETTINGS_ANCHOR_SVG_D_PREFIX)) continue;
      const menuItem = path.closest('[role="menuitem"]');
      if (!menuItem) continue;
      const list = menuItem.parentElement;
      if (!list) continue;
      const menu = list.closest('[role="menu"]');
      if (!menu) continue;
      return list;
    }
    return null;
  }

  function buildShimMenuItem() {
    const item = document.createElement('div');
    item.id = MENU_ITEM_ID;
    item.setAttribute('role', 'menuitem');
    item.setAttribute('tabindex', '-1');
    item.setAttribute('data-orientation', 'vertical');
    item.className =
      'no-drag text-token-foreground outline-hidden rounded-lg px-[var(--padding-row-x)] py-[var(--padding-row-y)] text-sm group hover:bg-token-list-hover-background focus:bg-token-list-hover-background cursor-interaction flex flex-col';

    const row = document.createElement('div');
    row.className = 'flex w-full items-center gap-1.5';

    const iconWrap = document.createElement('span');
    iconWrap.style.display = 'inline-flex';
    iconWrap.style.color = '#1296db';
    iconWrap.innerHTML = SHIM_ICON_SVG;

    const label = document.createElement('span');
    label.className = 'flex-1 min-w-0 truncate';
    label.textContent = 'Shim';

    row.appendChild(iconWrap);
    row.appendChild(label);
    item.appendChild(row);

    item.addEventListener('click', (event) => {
      event.preventDefault();
      event.stopPropagation();
      togglePopover(item);
    });
    item.addEventListener('mouseenter', () => {
      item.setAttribute('data-highlighted', '');
    });
    item.addEventListener('mouseleave', () => {
      item.removeAttribute('data-highlighted');
    });

    return item;
  }

  function ensureShimMenuItem() {
    const list = findSettingsMenuList();
    if (!list) return;
    if (document.getElementById(MENU_ITEM_ID)?.parentElement === list) return;
    document.getElementById(MENU_ITEM_ID)?.remove();
    const item = buildShimMenuItem();
    list.insertBefore(item, list.firstChild);
  }

  // ========== 浮层 ==========

  function buildPopover() {
    const popover = document.createElement('div');
    popover.id = POPOVER_ID;
    Object.assign(popover.style, {
      position: 'fixed',
      zIndex: '2147483647',
      padding: '14px 16px',
      minWidth: '180px',
      background: 'rgba(20, 20, 20, 0.92)',
      color: '#fff',
      borderRadius: '12px',
      boxShadow: '0 12px 32px rgba(0, 0, 0, 0.35)',
      backdropFilter: 'blur(8px)',
      fontFamily: 'system-ui, -apple-system, sans-serif',
      fontSize: '13px',
      lineHeight: '1.5',
      userSelect: 'none',
    });

    const titleRow = document.createElement('div');
    Object.assign(titleRow.style, {
      display: 'flex',
      alignItems: 'center',
      gap: '8px',
      fontWeight: '700',
      fontSize: '14px',
      marginBottom: '6px',
    });
    const dot = document.createElement('span');
    Object.assign(dot.style, {
      width: '8px',
      height: '8px',
      borderRadius: '50%',
      background: '#22c55e',
      boxShadow: '0 0 6px rgba(34, 197, 94, 0.8)',
    });
    const titleText = document.createElement('span');
    titleText.textContent = 'Shim Injected';
    titleRow.appendChild(dot);
    titleRow.appendChild(titleText);

    const version = document.createElement('div');
    version.textContent = 'v0.1.0';
    Object.assign(version.style, {
      color: 'rgba(255, 255, 255, 0.6)',
      fontSize: '12px',
    });

    popover.appendChild(titleRow);
    popover.appendChild(version);
    return popover;
  }

  function positionPopover(popover, anchor) {
    const rect = anchor.getBoundingClientRect();
    const popRect = popover.getBoundingClientRect();
    const gap = 8;
    let left = rect.right + gap;
    let top = rect.top;
    if (left + popRect.width > window.innerWidth - 8) {
      left = rect.left - popRect.width - gap;
    }
    if (left < 8) left = 8;
    if (top + popRect.height > window.innerHeight - 8) {
      top = window.innerHeight - popRect.height - 8;
    }
    if (top < 8) top = 8;
    popover.style.left = `${left}px`;
    popover.style.top = `${top}px`;
  }

  function dismissPopover() {
    document.getElementById(POPOVER_ID)?.remove();
    document.removeEventListener('mousedown', onPopoverOutside, true);
    document.removeEventListener('keydown', onPopoverKey, true);
  }

  function onPopoverOutside(event) {
    const popover = document.getElementById(POPOVER_ID);
    const item = document.getElementById(MENU_ITEM_ID);
    if (!popover) return;
    if (popover.contains(event.target)) return;
    if (item && item.contains(event.target)) return;
    dismissPopover();
  }

  function onPopoverKey(event) {
    if (event.key === 'Escape') dismissPopover();
  }

  function togglePopover(anchor) {
    if (document.getElementById(POPOVER_ID)) {
      dismissPopover();
      return;
    }
    const popover = buildPopover();
    document.body.appendChild(popover);
    positionPopover(popover, anchor);
    document.addEventListener('mousedown', onPopoverOutside, true);
    document.addEventListener('keydown', onPopoverKey, true);
  }

  // ========== 总调度 ==========

  function ensureAll() {
    ensureBadge();
    ensureShimMenuItem();
  }

  ensureAll();

  let scheduled = false;
  const observer = new MutationObserver(() => {
    if (scheduled) return;
    scheduled = true;
    setTimeout(() => {
      scheduled = false;
      ensureAll();
    }, 200);
  });
  observer.observe(document.documentElement, {
    childList: true,
    subtree: true,
  });

  console.log('[shim] inject script loaded');
})();
