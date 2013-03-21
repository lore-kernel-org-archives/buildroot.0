From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 21 Mar 2013 22:04:31 +0100
Subject: [Buildroot] [pull request v5] Pull request for branch for-master/doc
Message-ID: <cover.1363899518.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!


Another (and hopefully the last) round of the doc series...

Changes v4 -> v5:
  - Kconfiglib python module eventually gets embedded in the BR source tree;
  - Manual generation date now appears in the manual.


The following changes since commit 1f721a2f009393c29c6554f643f15f80a8dc5443:

  xinetd: follow the convention for patch location (2013-03-20 23:28:27 +0100)

are available in the git repository at:

  git://github.com/tSed/buildroot.git for-master/doc

for you to fetch changes up to 8be5fe492147513305626d9665d4119c548be11e:

  manual: update generated lists (2013-03-21 21:33:12 +0100)

----------------------------------------------------------------
Samuel Martin (7):
      manual: add manual generation date/git revision in the manual text
      support: add kconfiglib python module
      support/scripts: add gen-manual-lists.py
      manual: cleanup appendix.txt
      manual: add a make target 'manual-update-lists'
      Makefile: add to the release target a warning about the manual updates.
      manual: update generated lists

 Makefile                            |    2 +
 docs/manual/appendix.txt            |   29 +-
 docs/manual/deprecated-list.txt     |   77 +-
 docs/manual/host-package-list.txt   |   22 +
 docs/manual/manual.mk               |   10 +-
 docs/manual/manual.txt              |    3 +
 docs/manual/package-list.txt        |  950 +++++++++
 docs/manual/pkg-list.txt            |  870 --------
 support/scripts/gen-manual-lists.py |  348 ++++
 support/scripts/kconfiglib.py       | 3772 +++++++++++++++++++++++++++++++++++
 support/scripts/readme              |   30 +
 11 files changed, 5189 insertions(+), 924 deletions(-)
 create mode 100644 docs/manual/host-package-list.txt
 create mode 100644 docs/manual/package-list.txt
 delete mode 100644 docs/manual/pkg-list.txt
 create mode 100755 support/scripts/gen-manual-lists.py
 create mode 100644 support/scripts/kconfiglib.py
 create mode 100644 support/scripts/readme

Yours,
Samuel

--
