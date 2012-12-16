From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 16 Dec 2012 08:52:15 -0300
Subject: [Buildroot] [PATCH 1/3] libxml2: bump to version 2.9.0
Message-ID: <1355658737-29879-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libxml2/libxml2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 0c84652..0394e29 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBXML2_VERSION = 2.8.0
+LIBXML2_VERSION = 2.9.0
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_AUTORECONF = YES
-- 
1.7.8.6
