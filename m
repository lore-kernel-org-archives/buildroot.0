From: Nigel Kukard <nkukard@lbsd.net>
Date: Tue, 22 Dec 2009 06:46:34 +0000
Subject: [Buildroot] [pull request] Pull request for branch xfsprogs-update2
Message-ID: <cover.1261464378.git.nkukard@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit f31bbf9e681f17d3baf4c23b2696d1d04513a603:
  Peter Korsgaard (1):
        qt: add selection for keyboard drivers

are available in the git repository at:

  git://git.busybox.net/~nkukard/git/buildroot xfsprogs-update2

Nigel Kukard (1):
      Updated xfsprogs

 package/xfsprogs/Config.in      |   11 ++++---
 package/xfsprogs/xfsprogs.mk    |    9 ++---
 package/xfsprogs/xfsprogs.patch |   59 ---------------------------------------
 3 files changed, 10 insertions(+), 69 deletions(-)
 delete mode 100644 package/xfsprogs/xfsprogs.patch

Thanks,
-- 
Nigel Kukard
