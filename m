From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:44:38 +0200
Subject: [Buildroot] [git commit] binutils: bump 2.25.x series to 2.25.1
Message-ID: <20150728204446.7709880411@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8fd20b5e6baa1c85766a737e194448ea4359899
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../binutils/{2.25 => 2.25.1}/120-sh-conf.patch    |    0
 .../300-001_ld_makefile_patch.patch                |    0
 .../300-012_check_ldrunpath_length.patch           |    0
 .../binutils/{2.25 => 2.25.1}/500-sysroot.patch    |    0
 .../600-poison-system-directories.patch            |    0
 ...ines-search-code-for-conditional-branches.patch |    0
 ...nsa-optimize-check_section_ebb_pcrels_fit.patch |    0
 .../907-xtensa-optimize-removed_by_actions.patch   |    0
 .../908-xtensa-optimize-find_removed_literal.patch |    0
 ...tensa-replace-action-list-with-splay-tree.patch |    0
 ...10-xtensa-optimize-trampolines-relaxation.patch |    0
 ...localized-symbol-refcounting-with-gc-sect.patch |    0
 ...x-gas-segfault-with-text-section-literals.patch |    0
 package/binutils/Config.in.host                    |    4 ++--
 package/binutils/binutils.hash                     |    2 +-
 15 files changed, 3 insertions(+), 3 deletions(-)

Patch is too large, so refusing to show it
