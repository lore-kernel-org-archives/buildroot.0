From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 23:14:38 +0200
Subject: [Buildroot] [git commit] support/kconfig: bump to kconfig from
 Linux 4.17-rc2
Message-ID: <20180920211848.A415E8877D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6eacea5ae05e11bfc7b6557850ef7e4a0ba60bd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile                                           |   10 +-
 support/kconfig/Makefile                           |  220 +--
 support/kconfig/README.buildroot                   |    6 +-
 support/kconfig/check.sh                           |    2 +-
 support/kconfig/conf.c                             |  127 +-
 support/kconfig/confdata.c                         |   40 +-
 support/kconfig/expr.c                             |  479 ++++--
 support/kconfig/expr.h                             |  107 +-
 support/kconfig/gconf.c                            |   33 +-
 support/kconfig/kconf_id.c                         |   53 +
 support/kconfig/kxgettext.c                        |    2 +-
 support/kconfig/list.h                             |    7 +-
 support/kconfig/lkc.h                              |   21 +-
 support/kconfig/lkc_proto.h                        |   86 +-
 support/kconfig/lxdialog/check-lxdialog.sh         |    4 +-
 support/kconfig/lxdialog/checklist.c               |    4 +-
 support/kconfig/lxdialog/dialog.h                  |    2 +-
 support/kconfig/lxdialog/inputbox.c                |    2 +-
 support/kconfig/lxdialog/menubox.c                 |    4 +-
 support/kconfig/lxdialog/util.c                    |    2 +-
 support/kconfig/mconf.c                            |   40 +-
 support/kconfig/menu.c                             |  261 ++-
 support/kconfig/merge_config.sh                    |   62 +-
 support/kconfig/nconf.c                            |   20 +-
 support/kconfig/nconf.gui.c                        |   22 +-
 support/kconfig/nconf.h                            |    4 +-
 .../patches/01-kconfig-kernel-to-buildroot.patch   |   66 +-
 .../patches/06-br-build-system-integration.patch   |   87 +-
 support/kconfig/patches/10-br-build-system.patch   |    8 +-
 .../patches/11-use-mktemp-for-lxdialog.patch       |    8 +-
 .../kconfig/patches/12-fix-glade-file-path.patch   |    8 +-
 .../patches/14-support-out-of-tree-config.patch    |   42 +-
 .../kconfig/patches/15-fix-qconf-moc-rule.patch    |   24 -
 .../16-fix-space-to-de-select-options.patch        |    8 +-
 ...dialog-get-ncurses-CFLAGS-with-pkg-config.patch |   50 -
 ...onfig-nconfig-fix-multi-byte-UTF-handling.patch |   45 -
 support/kconfig/patches/series                     |    4 +-
 support/kconfig/qconf.cc                           |  708 ++++----
 support/kconfig/qconf.h                            |  150 +-
 support/kconfig/streamline_config.pl               |   58 +-
 support/kconfig/symbol.c                           |  167 +-
 support/kconfig/util.c                             |   34 +-
 support/kconfig/zconf.gperf                        |   47 -
 support/kconfig/zconf.hash.c_shipped               |  286 ----
 support/kconfig/zconf.l                            |  103 +-
 support/kconfig/zconf.lex.c_shipped                | 1136 +++++++------
 support/kconfig/zconf.tab.c_shipped                | 1756 ++++++++++----------
 support/kconfig/zconf.y                            |  149 +-
 48 files changed, 3460 insertions(+), 3104 deletions(-)

Patch is too large, so refusing to show it
