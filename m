From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Oct 2011 23:23:15 +0200
Subject: [Buildroot] [git commit] stunnel: bump to version 4.44
Message-ID: <20111015213701.E38898E24C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5222067783a0b4f20f5a68e6aa57817cca5c35a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/stunnel/stunnel.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 1f40397..6088e58 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,10 +4,9 @@
 #
 #############################################################
 
-STUNNEL_VERSION = 4.36
-STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/obsolete/4.x/
+STUNNEL_VERSION = 4.44
+STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel
 STUNNEL_DEPENDENCIES = openssl
-
 STUNNEL_CONF_OPT += \
 	--with-ssl=$(STAGING_DIR)/usr \
 	--with-threads=fork
