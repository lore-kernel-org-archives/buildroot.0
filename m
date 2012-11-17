From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 17 Nov 2012 09:28:01 -0300
Subject: [Buildroot] [PATCH 2/2] alsa-utils: bump to version 1.0.26
In-Reply-To: <1353155281-15122-1-git-send-email-gustavo@zacarias.com.ar>
References: <1353155281-15122-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1353155281-15122-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/alsa-utils/alsa-utils.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index 7043837..6228574 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-ALSA_UTILS_VERSION = 1.0.25
+ALSA_UTILS_VERSION = 1.0.26
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
-ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
+ALSA_UTILS_SITE = http://alsa.cybermirror.org/utils
 ALSA_UTILS_LICENSE = GPLv2
 ALSA_UTILS_LICENSE_FILES = COPYING
 ALSA_UTILS_INSTALL_STAGING = YES
-- 
1.7.8.6
