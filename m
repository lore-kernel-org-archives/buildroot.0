From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 13 Feb 2013 23:59:01 +0100
Subject: [Buildroot] [pull request] Pull request for branch for-master/doc
Message-ID: <cover.1360795941.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


Here is some updates and fixes in the manual.

The following changes since commit 6056de8971bf25c9853c38583dc50b5abcb982de:

  rpi-userland: update to fix no-longer applying patch (2013-02-10 13:58:51 +0100)

are available in the git repository at:

  git at github.com:tSed/buildroot.git for-master/doc

for you to fetch changes up to 73205fcda9f19a8e4717799831d0eb41a376da27:

  Makefile: add to the release target a warning about the manual updates. (2013-02-13 23:49:12 +0100)

----------------------------------------------------------------
Samuel Martin (9):
      manual: cleanup and update editor tags
      manual: fix cross-refs
      manual: sprinkle with some calls to MESSAGE
      manual: faq: add entry about the relocatable toolchain
      manual: faq: add workaround to avoid rebuilding the buildroot toolchain after
      manual: minor fix in patch-policy.txt
      manual: misc. post-{build,image} scripts fixes
      manual: update {deprecated,package}-list.txt
      Makefile: add to the release target a warning about the manual updates.

 Makefile                                   |   2 +
 docs/manual/adding-packages-autotools.txt  |   1 +
 docs/manual/adding-packages-cmake.txt      |   1 +
 docs/manual/adding-packages-conclusion.txt |   1 +
 docs/manual/adding-packages-directory.txt  |   1 +
 docs/manual/adding-packages-generic.txt    |   1 +
 docs/manual/adding-packages-gettext.txt    |   1 +
 docs/manual/adding-packages-tips.txt       |   1 +
 docs/manual/adding-packages.txt            |   3 +-
 docs/manual/advanced.txt                   |   1 +
 docs/manual/appendix.txt                   |  14 +-
 docs/manual/beyond-buildroot.txt           |   1 +
 docs/manual/ccache-support.txt             |   3 +-
 docs/manual/common-usage.txt               |   2 +
 docs/manual/configure.txt                  |   6 +-
 docs/manual/contribute.txt                 |   1 +
 docs/manual/customize-busybox-config.txt   |   3 +-
 docs/manual/customize-kernel-config.txt    |   3 +-
 docs/manual/customize-rootfs.txt           |  33 +-
 docs/manual/customize-store.txt            |  10 +-
 docs/manual/customize-toolchain.txt        |   5 +-
 docs/manual/customize-uclibc-config.txt    |   3 +-
 docs/manual/customize.txt                  |   1 +
 docs/manual/deprecated-list.txt            |  81 ++-
 docs/manual/developer-guide.txt            |   1 +
 docs/manual/download-infra.txt             |   3 +-
 docs/manual/download-location.txt          |   1 +
 docs/manual/eclipse-integration.txt        |   1 +
 docs/manual/faq-troubleshooting.txt        |  56 ++
 docs/manual/get-involved.txt               |   1 +
 docs/manual/getting.txt                    |   3 +-
 docs/manual/going-further.txt              |   1 +
 docs/manual/how-buildroot-works.txt        |   1 +
 docs/manual/introduction.txt               |   1 +
 docs/manual/legal-notice.txt               |   1 +
 docs/manual/make-tips.txt                  |   3 +-
 docs/manual/makedev-syntax.txt             |   3 +-
 docs/manual/manual.mk                      |   9 +-
 docs/manual/manual.txt                     |   1 +
 docs/manual/package-list.txt               | 948 +++++++++++++++++++++++++++++
 docs/manual/package-make-target.txt        |   1 +
 docs/manual/patch-policy.txt               |   7 +-
 docs/manual/pkg-list.txt                   | 870 --------------------------
 docs/manual/prerequisite.txt               |   3 +-
 docs/manual/rebuilding-packages.txt        |   3 +-
 docs/manual/starting-up.txt                |   1 +
 docs/manual/using-buildroot-toolchain.txt  |   1 +
 docs/manual/using.txt                      |   1 +
 docs/manual/working-with.txt               |   4 +-
 docs/manual/writing-rules.txt              |   1 +
 support/scripts/gen-manual-lists.py        | 237 ++++++++
 51 files changed, 1383 insertions(+), 959 deletions(-)
 create mode 100644 docs/manual/package-list.txt
 delete mode 100644 docs/manual/pkg-list.txt
 create mode 100755 support/scripts/gen-manual-lists.py

Yours,

--

Samuel
