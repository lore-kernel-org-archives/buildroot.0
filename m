From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Jun 2014 10:23:53 -0300
Subject: [Buildroot] [PATCH 2/2] alsa-utils: bump to version 1.0.28
In-Reply-To: <1404048233-6166-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404048233-6166-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1404048233-6166-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/alsa-utils/alsa-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 2083c97..4536b07 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.0.26
+ALSA_UTILS_VERSION = 1.0.28
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = http://alsa.cybermirror.org/utils
 ALSA_UTILS_LICENSE = GPLv2
-- 
1.8.5.5
