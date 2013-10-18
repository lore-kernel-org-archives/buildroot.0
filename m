From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 18 Oct 2013 22:31:24 +0200
Subject: [Buildroot] [pull request] Pull request for branch sma/doc-update
Message-ID: <cover.1382127504.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,


Another round for the manual update patch series.
This time, I also integrate the pending patches from Thomas DS.

BTW, can someone (who has enough patchwork privileges) mark the
following patch as superseded:
http://patchwork.ozlabs.org/patch/214943/


Yours,

--
Samuel


The following changes since commit f87f067c027261eb8c0ac8ad120fe845570aaae3:

  ngrep: add license information (2013-10-15 15:13:28 +0200)

are available in the git repository at:

  git at github.com:tSed/buildroot.git sma/doc-update

for you to fetch changes up to b67f14903e6e33f2790ff7ee8c82c658f8c12b01:

  board: add warning to readme files explaining how to flash the target (2013-10-18 21:34:54 +0200)

----------------------------------------------------------------
Samuel Martin (10):
      support: trivial fixes (typos and minor rewording) in gen-manual-lists.py
      manual: move the manual rsync directory under $(O)/build/
      manual: developer-guide.txt: cleanup non-existing source
      manual: introduction.txt: enhance Buildroot presentation
      manual: get-involved.txt: fix event order
      manual: update get-involved section
      manual: rework Deploying images chapter
      manual: customize-toolchain.txt: update internal backend section
      manual: faq-troubleshooting.txt: add tips to avoid toolchain build
      board: add warning to readme files explaining how to flash the target

Thomas De Schampheleire (2):
      manual generation: check dependencies first
      manual generation: rename manual-txt into manual-text

 Makefile                                    |   4 +-
 board/avnet/s6lx9_microboard/readme.txt     |  10 +
 board/freescale/mpc8315erdb/readme.txt      |   8 +
 board/freescale/p1010rdb/readme.txt         |   8 +
 board/telit/evk-pro3/readme.txt             |   9 +
 docs/manual/beyond-buildroot.txt            |  41 ----
 docs/manual/customize-toolchain.txt         |  13 +-
 docs/manual/deploying-images.txt            | 291 ++++++++++++++++++++++++++++
 docs/manual/developer-guide.txt             |   2 -
 docs/manual/faq-troubleshooting.txt         |  67 +++++++
 docs/manual/get-involved.txt                | 164 +++++++++++++++-
 docs/manual/introduction.txt                |  45 +++++
 docs/manual/make-tips.txt                   |   3 +-
 docs/manual/manual.mk                       |  47 ++++-
 docs/manual/manual.txt                      |   4 +-
 docs/manual/prerequisite.txt                |   5 +-
 docs/manual/using.txt                       |   3 +-
 support/dependencies/check-host-asciidoc.sh |  36 ++++
 support/scripts/gen-manual-lists.py         |   9 +-
 19 files changed, 691 insertions(+), 78 deletions(-)
 delete mode 100644 docs/manual/beyond-buildroot.txt
 create mode 100644 docs/manual/deploying-images.txt
 create mode 100755 support/dependencies/check-host-asciidoc.sh
