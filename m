From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 13:31:54 +0200
Subject: [Buildroot] [PATCH 2/2] package/alsa-lib: Switch ALSA_LIB_SITE to
	official site
In-Reply-To: <1413718314-15535-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413718314-15535-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413718314-15535-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/alsa-lib/alsa-lib.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 1f2b60c..0b329cd 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -6,7 +6,7 @@
 
 ALSA_LIB_VERSION = 1.0.28
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
-ALSA_LIB_SITE = http://alsa.cybermirror.org/lib
+ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_LICENSE = LGPLv2.1+
 ALSA_LIB_LICENSE_FILES = COPYING
 ALSA_LIB_INSTALL_STAGING = YES
-- 
1.7.10.4
