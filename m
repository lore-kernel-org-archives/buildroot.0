From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Apr 2014 21:54:07 +0200
Subject: [Buildroot] [git commit] stunnel: bump to version 5.01
Message-ID: <20140410204503.C43889C483@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22fe313dcc11233fb91e46b4dbcde36c7bb36d5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-0016.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stunnel/stunnel.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index fbe7b94..ec3af4b 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-STUNNEL_VERSION = 4.56
-STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/archive/4.x/
+STUNNEL_VERSION = 5.01
+STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/archive/5.x/
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPT = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork
 STUNNEL_LICENSE = GPLv2+
