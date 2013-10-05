From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  5 Oct 2013 21:49:05 +0200
Subject: [Buildroot] [pull request] Pull request for branch sma/doc-update
Message-ID: <cover.1381002281.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,


Here is a couple of fixes (patches 1 to 3, 5 and 7) and
enhancements (patches 4, 6, 8 and 9) for the maunal.


Yours,

Samuel


The following changes since commit 8a67c54c77782936b69fd062d49aa590f4f97bb3:

  netatalk: disable dtrace (2013-10-05 21:12:44 +0200)

are available in the git repository at:

  git at github.com:tSed/buildroot.git sma/doc-update

for you to fetch changes up to a2cb1b7caaa580f341abbb3788d18323c3e2e7c3:

  manual: rework Deploying images chapter (2013-10-05 21:35:55 +0200)

----------------------------------------------------------------
Samuel Martin (9):
      manual: minor update in manual generation
      manual: developer-guide.txt: cleanup non-existing source
      manual: update dependency list to build the documentation
      manual: add information about buildroot toolchain not being relocable and put some hints to use it
      manual: configure: add deprecation warning for Crosstool-NG toolchain backend
      manual: introduction.txt: enhance Buildroot presentation
      manual: get-involved.txt: fix event order
      manual: update get-involved section
      manual: rework Deploying images chapter

 docs/manual/beyond-buildroot.txt    |  41 -----
 docs/manual/configure.txt           |   9 ++
 docs/manual/customize-toolchain.txt |  72 +++++++--
 docs/manual/deploying-images.txt    | 290 ++++++++++++++++++++++++++++++++++++
 docs/manual/developer-guide.txt     |   2 -
 docs/manual/get-involved.txt        | 147 ++++++++++++++++--
 docs/manual/introduction.txt        |  40 +++++
 docs/manual/manual.mk               |  13 +-
 docs/manual/manual.txt              |   4 +-
 docs/manual/prerequisite.txt        |   5 +-
 docs/manual/using.txt               |   3 +-
 support/scripts/gen-manual-lists.py |   9 +-
 12 files changed, 552 insertions(+), 83 deletions(-)
 delete mode 100644 docs/manual/beyond-buildroot.txt
 create mode 100644 docs/manual/deploying-images.txt
