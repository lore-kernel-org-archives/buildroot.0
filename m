From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  5 Mar 2013 22:35:26 +0100
Subject: [Buildroot] [pull request v3] Pull request for branch for-master/doc
Message-ID: <cover.1362518799.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!


Here is the remaining part of the doc series.

Nothing scary for this 3rd round, but some cleanup and updates.


The following changes since commit 83287ee571db6ffd876c90b6db12fa59be87ae67:

  htop: needs MMU (2013-03-05 15:51:01 +0100)

are available in the git repository at:

  git://github.com/tSed/buildroot.git for-master/doc

for you to fetch changes up to e6dec8955255699c4cb7d57fda85768c9e0582f5:

  manual: update generated lists (2013-03-05 22:25:16 +0100)

----------------------------------------------------------------
Samuel Martin (6):
      support: add kconfiglib python module
      support/scripts: add gen-manual-lists.py
      manual: add a make target 'manual-update-lists'
      manual: cleanup appendix.txt
      Makefile: add to the release target a warning about the manual updates.
      manual: update generated lists

 Makefile                            |    2 +
 docs/manual/appendix.txt            |   29 +-
 docs/manual/deprecated-list.txt     |   79 +-
 docs/manual/host-package-list.txt   |   19 +
 docs/manual/manual.mk               |    8 +-
 docs/manual/package-list.txt        |  936 +++++++++
 docs/manual/pkg-list.txt            |  870 --------
 support/scripts/gen-manual-lists.py |  336 ++++
 support/scripts/kconfiglib.py       | 3772 +++++++++++++++++++++++++++++++++++
 support/scripts/readme              |   11 +
 10 files changed, 5139 insertions(+), 923 deletions(-)
 create mode 100644 docs/manual/host-package-list.txt
 create mode 100644 docs/manual/package-list.txt
 delete mode 100644 docs/manual/pkg-list.txt
 create mode 100755 support/scripts/gen-manual-lists.py
 create mode 100644 support/scripts/kconfiglib.py
 create mode 100644 support/scripts/readme

Yours,
Samuel

--
