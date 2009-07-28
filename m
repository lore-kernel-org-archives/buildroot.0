From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2009 16:18:10 +0200
Subject: [Buildroot] [git commit] xorg: update CHANGES after bug fix
Message-ID: <20090729054333.CC4757644E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7a1a334c4216e2d105ceb6b2eceaa8986627ae67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index cf764e8..77c4398 100644
--- a/CHANGES
+++ b/CHANGES
@@ -16,6 +16,7 @@
 
 	#83: liblockfile fails to compile due to eaccess redefinition
 	#163: Xtensa architecture port
+	#171: xorg-server / kernel headers 2.6.26 - vm86.c compilation issue
 	#241: device mapper + lvm2: build together
 	#243: ctorrent: new package
 	#271: Library 'libgcc_s.so.1' not installed in search path
-- 
1.6.3.3
