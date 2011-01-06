From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jan 2011 12:25:33 +0100
Subject: [Buildroot] [git commit master 1/1] barebox: bump version
Message-ID: <20110106123144.BE8C78A73E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=01e46f8379120cc52021ec25ae3d1d1753e0c1d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/barebox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 5bf272a..3df424c 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BAREBOX_VERSION:=2010.11.0
+BAREBOX_VERSION:=2011.01.0
 BAREBOX_SOURCE:=barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE:=http://www.barebox.org/download/
 BAREBOX_DIR:=$(BUILD_DIR)/barebox-$(BAREBOX_VERSION)
-- 
1.7.2.2
