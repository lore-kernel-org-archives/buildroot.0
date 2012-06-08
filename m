From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Jun 2012 12:30:45 -0300
Subject: [Buildroot] [PATCH 6/7] lighttpd: bump to version 1.4.31
In-Reply-To: <1339169446-26972-1-git-send-email-gustavo@zacarias.com.ar>
References: <1339169446-26972-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1339169446-26972-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...atch => lighttpd-Fix-default-config-file.patch} |    0
 package/lighttpd/lighttpd.mk                       |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename package/lighttpd/{lighttpd-1.4.30-Fix-default-config-file.patch => lighttpd-Fix-default-config-file.patch} (100%)

diff --git a/package/lighttpd/lighttpd-1.4.30-Fix-default-config-file.patch b/package/lighttpd/lighttpd-Fix-default-config-file.patch
similarity index 100%
rename from package/lighttpd/lighttpd-1.4.30-Fix-default-config-file.patch
rename to package/lighttpd/lighttpd-Fix-default-config-file.patch
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 8d1f212..c7fae32 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIGHTTPD_VERSION = 1.4.30
+LIGHTTPD_VERSION = 1.4.31
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-1.4.x
 LIGHTTPD_DEPENDENCIES = host-pkg-config
 LIGHTTPD_CONF_OPT = \
-- 
1.7.3.4
