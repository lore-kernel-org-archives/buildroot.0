From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 17 Nov 2012 09:28:00 -0300
Subject: [Buildroot] [PATCH 1/2] alsa-lib: bump to version 1.0.26
Message-ID: <1353155281-15122-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/alsa-lib/alsa-lib.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 8ed1339..daa551d 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-ALSA_LIB_VERSION = 1.0.25
+ALSA_LIB_VERSION = 1.0.26
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
-ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
+ALSA_LIB_SITE = http://alsa.cybermirror.org/lib
 ALSA_LIB_LICENSE = LGPLv2.1+
 ALSA_LIB_LICENSE_FILES = COPYING
 ALSA_LIB_INSTALL_STAGING = YES
-- 
1.7.8.6
