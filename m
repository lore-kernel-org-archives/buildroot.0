From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:02 -0000
Subject: [Buildroot] [git commit branch/next] lighttpd: bump to version
	1.4.31
Message-ID: <20120802195237.9752296FE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e5dbbad7d1a4a2afc7e23630e3be0fe82c477bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...atch => lighttpd-Fix-default-config-file.patch} |    0
 package/lighttpd/lighttpd.mk                       |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)

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
