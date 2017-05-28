From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 16:10:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/font-awesome: bump version to 4.7.0
Message-ID: <20170528141005.17239-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/font-awesome/font-awesome.hash | 2 +-
 package/font-awesome/font-awesome.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/font-awesome/font-awesome.hash b/package/font-awesome/font-awesome.hash
index 9f3715e5b..e266168ac 100644
--- a/package/font-awesome/font-awesome.hash
+++ b/package/font-awesome/font-awesome.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  7813f416057da622b16229b10fef550e1dc64c5bb59871cd38fa86e76dfdbae8  font-awesome-v4.5.0.tar.gz
+sha256 de512ba0e1dead382bbfce372cde74b3f18971d876fffb635ee9333f0db05d43  font-awesome-v4.7.0.tar.gz
diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
index 893378327..f39401041 100644
--- a/package/font-awesome/font-awesome.mk
+++ b/package/font-awesome/font-awesome.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FONT_AWESOME_VERSION = v4.5.0
+FONT_AWESOME_VERSION = v4.7.0
 FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
 FONT_AWESOME_LICENSE = OFL-1.1 (font), MIT (CSS, LESS and Sass files)
 FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
-- 
2.11.0
