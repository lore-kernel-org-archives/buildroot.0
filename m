From: Nigel Kukard <nkukard@lbsd.net>
Date: Mon, 21 Dec 2009 07:19:51 +0000
Subject: [Buildroot] [pull request] Pull request for branch xfsprogs-update
Message-ID: <cover.1261379989.git.nkukard@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 14aa5ee54f33d05a0bd01f21635e095ba07f83ec:
  Peter Korsgaard (1):
        mtd-utils: move phony dependencies to toplevel mtd-host target

are available in the git repository at:

  git://git.busybox.net/~nkukard/git/buildroot xfsprogs-update

Nigel Kukard (1):
      Update xfsprogs

 package/xfsprogs/Config.in      |   10 +++---
 package/xfsprogs/xfsprogs.mk    |    9 ++---
 package/xfsprogs/xfsprogs.patch |   59 ---------------------------------------
 3 files changed, 9 insertions(+), 69 deletions(-)
 delete mode 100644 package/xfsprogs/xfsprogs.patch

Thanks,
-- 
Nigel Kukard
