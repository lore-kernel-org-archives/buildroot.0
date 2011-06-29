From: Will Newton <will.newton@gmail.com>
Date: Wed, 29 Jun 2011 17:13:15 +0100
Subject: [Buildroot] [pull request] libnspr, libnss, and orc packages
Message-ID: <BANLkTikhBBip+ogOg4hET8UR=SptAiMbYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A few patches adding some new packages that I have been sitting on for a while.

The following changes since commit c80224a3a05e41af5a32e1c663fd3853f313382b:

  toolchain/gcc: bump 4.6.x version to 4.6.1 (2011-06-28 15:19:13 +0200)

are available in the git repository at:
  git://github.com/willnewton/buildroot.git for-upstream

Paul Burton (1):
      orc: New package for the Oil Runtime Compiler

Will Newton (2):
      libnspr: New package.
      libnss: Add new package.

 package/Config.in                  |    3 ++
 package/libnspr/Config.in          |   13 +++++++
 package/libnspr/libnspr.mk         |   17 ++++++++++
 package/libnss/Config.in           |   13 +++++++
 package/libnss/libnss-cross.patch  |   24 ++++++++++++++
 package/libnss/libnss-uclibc.patch |   14 ++++++++
 package/libnss/libnss.mk           |   62 ++++++++++++++++++++++++++++++++++++
 package/orc/Config.in              |    7 ++++
 package/orc/orc.mk                 |   49 ++++++++++++++++++++++++++++
 9 files changed, 202 insertions(+), 0 deletions(-)
 create mode 100644 package/libnspr/Config.in
 create mode 100644 package/libnspr/libnspr.mk
 create mode 100644 package/libnss/Config.in
 create mode 100644 package/libnss/libnss-cross.patch
 create mode 100644 package/libnss/libnss-uclibc.patch
 create mode 100644 package/libnss/libnss.mk
 create mode 100644 package/orc/Config.in
 create mode 100644 package/orc/orc.mk
