From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Mar 2015 19:40:47 -0300
Subject: [Buildroot] [PATCH 2/2] alsa-utils: bump to version 1.0.29
In-Reply-To: <1425336047-7409-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425336047-7409-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1425336047-7409-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/alsa-utils/alsa-utils.hash | 2 ++
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/alsa-utils/alsa-utils.hash

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
new file mode 100644
index 0000000..ba5061b
--- /dev/null
+++ b/package/alsa-utils/alsa-utils.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	5160058f3e14483ced5de919dd473f93932059454530a9b7ef97dcabd6833e9b	alsa-utils-1.0.29.tar.bz2
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index f95e7a8..65702b7 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.0.28
+ALSA_UTILS_VERSION = 1.0.29
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = ftp://ftp.alsa-project.org/pub/utils
 ALSA_UTILS_LICENSE = GPLv2
-- 
2.0.5
