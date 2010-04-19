From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Apr 2010 22:53:49 +0200
Subject: [Buildroot] [pull request] Pull request for branch makedevs-cleanup
Message-ID: <cover.1271710428.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 7b3a6f0aab19c147ad28f74e3b410c4a8bb2f38f:
  Peter Korsgaard (1):
        python: needs WCHAR support in toolchain

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot makedevs-cleanup

Thomas Petazzoni (2):
      makedevs: move to package/
      makedevs: convert to a more normal way of building packages

 fs/common.mk                            |    2 +-
 package/Config.in                       |    1 +
 package/makedevs/Config.in              |    5 ++++
 {target => package}/makedevs/makedevs.c |    0
 package/makedevs/makedevs.mk            |   35 +++++++++++++++++++++++++++++++
 target/makedevs/makedevs.mk             |   30 --------------------------
 6 files changed, 42 insertions(+), 31 deletions(-)
 create mode 100644 package/makedevs/Config.in
 rename {target => package}/makedevs/makedevs.c (100%)
 create mode 100644 package/makedevs/makedevs.mk
 delete mode 100644 target/makedevs/makedevs.mk

Thanks,
-- 
Thomas Petazzoni
