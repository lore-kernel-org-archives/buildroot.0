From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 21 Jan 2013 20:45:33 +0000
Subject: [Buildroot] [PATCH] neardal: bump version to 0.8
Message-ID: <1358801133-31458-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/neardal/neardal.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index 66b729d..9625f0e 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -3,7 +3,8 @@
 # neardal
 #
 #############################################################
-NEARDAL_VERSION = 0.7
+
+NEARDAL_VERSION = 0.8
 NEARDAL_SITE = http://github.com/connectivity/neardal/tarball/$(NEARDAL_VERSION)
 NEARDAL_SOURCE = connectivity-neardal-$(NEARDAL_VERSION).tar.gz
 NEARDAL_INSTALL_STAGING = YES
-- 
1.7.10.4
