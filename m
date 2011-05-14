From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 May 2011 00:09:52 +0200
Subject: [Buildroot] [git commit] barebox: bump version
Message-ID: <20110515075736.E1BD983521@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=80eff666607300578090b8eee5dcd33d947dec82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/barebox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 7a2e02e..f3e769f 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BAREBOX_VERSION:=2011.04.0
+BAREBOX_VERSION:=2011.05.0
 BAREBOX_SOURCE:=barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE:=http://www.barebox.org/download/
 BAREBOX_DIR:=$(BUILD_DIR)/barebox-$(BAREBOX_VERSION)
-- 
1.7.3.4
