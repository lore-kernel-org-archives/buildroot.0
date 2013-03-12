From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 12 Mar 2013 05:47:13 +0100
Subject: [Buildroot] [pull request v4] Pull request for branch for-master/doc
Message-ID: <cover.1363063387.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!


No big changes in this 4th revision of the series.

Changes v3 -> v4:
  - Do not embed Kconfiglib python module (because of licensing incertainty,
  the whole discussion is available online on github);
  - Usual list updates.


The following changes since commit 1ca9e06f1c9a5ef12feb63711a48379c0eae7e42:

  package/tzdata: new package (2013-03-10 23:37:04 +0100)

are available in the git repository at:

  git://github.com/tSed/buildroot.git for-master/doc

for you to fetch changes up to 942902bac4f98be7c13942d93f1a1ba46fc171d7:

  manual: update generated lists (2013-03-12 05:42:27 +0100)

----------------------------------------------------------------
Samuel Martin (5):
      support/scripts: add gen-manual-lists.py
      manual: add a make target 'manual-update-lists'
      manual: cleanup appendix.txt
      Makefile: add to the release target a warning about the manual updates.
      manual: update generated lists

 Makefile                            |   2 +
 docs/manual/appendix.txt            |  29 +-
 docs/manual/deprecated-list.txt     |  79 ++-
 docs/manual/host-package-list.txt   |  19 +
 docs/manual/manual.mk               |   8 +-
 docs/manual/package-list.txt        | 941 ++++++++++++++++++++++++++++++++++++
 docs/manual/pkg-list.txt            | 870 ---------------------------------
 support/scripts/gen-manual-lists.py | 354 ++++++++++++++
 8 files changed, 1379 insertions(+), 923 deletions(-)
 create mode 100644 docs/manual/host-package-list.txt
 create mode 100644 docs/manual/package-list.txt
 delete mode 100644 docs/manual/pkg-list.txt
 create mode 100755 support/scripts/gen-manual-lists.py

Yours,
Samuel

--
