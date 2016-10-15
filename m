From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 23:14:44 +0200
Subject: [Buildroot] [git commit] binutils: remove deprecated 2.24.X
Message-ID: <20161015211550.0B5BF80262@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8878112ad3df2a3d9468cf40a2401b581e7e432
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We will remove BR2_DEPRECATED, so remove this deprecated option.

[Peter: drop binutils patches]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |   8 +
 .../001-fix-enable-install-libiberty-flag.patch    |  46 --
 ...ont-segv-on-initial-instructions-overflow.patch |  66 --
 package/binutils/2.24/120-sh-conf.patch            |  29 -
 .../binutils/2.24/300-001_ld_makefile_patch.patch  |  24 -
 .../2.24/300-012_check_ldrunpath_length.patch      |  21 -
 package/binutils/2.24/500-sysroot.patch            |  37 -
 .../2.24/600-poison-system-directories.patch       | 279 -------
 package/binutils/2.24/900-xtensa-trampolines.patch | 846 ---------------------
 .../2.24/901-xtensa-gas-first-frag-alignment.patch |  51 --
 .../902-xtensa-gas-ld-diff-relocation-signed.patch | 133 ----
 ...ix-ld-segfault-when-linking-linux-modules.patch |  47 --
 ...-target-out-of-range-xtensa-ld-relaxation.patch |  79 --
 ...ines-search-code-for-conditional-branches.patch |  90 ---
 ...nsa-optimize-check_section_ebb_pcrels_fit.patch | 502 ------------
 .../907-xtensa-optimize-removed_by_actions.patch   | 356 ---------
 .../908-xtensa-optimize-find_removed_literal.patch | 146 ----
 ...tensa-replace-action-list-with-splay-tree.patch | 826 --------------------
 ...10-xtensa-optimize-trampolines-relaxation.patch | 345 ---------
 ...localized-symbol-refcounting-with-gc-sect.patch |  57 --
 ...x-gas-segfault-with-text-section-literals.patch |  56 --
 .../2.24/913-xtensa-add-auto-litpools-option.patch | 698 -----------------
 ...-xtensa-fix-signedness-of-gas-relocations.patch |  99 ---
 ...15-xtensa-fix-.init-.fini-literals-moving.patch | 149 ----
 package/binutils/Config.in.host                    |  11 -
 25 files changed, 8 insertions(+), 4993 deletions(-)

Patch is too large, so refusing to show it
