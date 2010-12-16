From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Dec 2010 10:47:33 +0100
Subject: [Buildroot] [pull request] Pull request for branch cloop-fix
Message-ID: <cover.1292492846.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 767dce8cee8b295ce91bc0ac1d71287eef4be08a:
  Martin Banky (1):
        l2tp: convert to gentargets and change to xl2tp

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot cloop-fix

Thomas Petazzoni (1):
      cloop: bump and fix package

 package/cloop/cloop-2.634-1-cflags.patch |   30 ++++++++++++++++++++++++++++++
 package/cloop/cloop.mk                   |    5 ++---
 2 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 package/cloop/cloop-2.634-1-cflags.patch

Thanks,
-- 
Thomas Petazzoni
