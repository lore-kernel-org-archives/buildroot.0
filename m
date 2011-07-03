From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 3 Jul 2011 22:41:20 +0200
Subject: [Buildroot] [git commit] lighttpd: bump version
Message-ID: <20110703204137.EDAC589038@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=90cdd7d925553c63fff3e208e8fd4a4e178603cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lighttpd/lighttpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 332afe7..45941eb 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIGHTTPD_VERSION = 1.4.28
+LIGHTTPD_VERSION = 1.4.29
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-1.4.x
 LIGHTTPD_DEPENDENCIES = host-pkg-config
 LIGHTTPD_CONF_OPT = \
-- 
1.7.3.4
