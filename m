From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 15:55:52 +0100
Subject: [Buildroot] [git commit] package/tvheadend: Needs python2 host
	package
Message-ID: <20141101145603.3BA92B2A6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d03ecb772c5e06e9c7ca3842ab674ad4687a61a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/3aa/3aaa28eb4fd04a5b578c5128b57ce89165e473be/
http://autobuild.buildroot.net/results/467/467df0fde737de0ec89fe023b2ce33546543d335/
http://autobuild.buildroot.net/results/f5a/f5aa44e0a96820fb8edd47e8096131b68f64f6a7/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index f3d7863..857f6e6 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -42,7 +42,7 @@ define TVHEADEND_CONFIGURE_CMDS
 	 --prefix=/usr				\
 	 --arch="$(ARCH)"			\
 	 --cpu="$(BR2_GCC_TARGET_CPU)"		\
-	 --python="$(HOST_DIR)/usr/bin/python"	\
+	 --python="$(HOST_DIR)/usr/bin/python2"	\
 	 --disable-dvbscan			\
 	 --enable-bundle			\
 	 --disable-libffmpeg_static		\
