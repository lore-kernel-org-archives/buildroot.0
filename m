From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 14:22:43 +0200
Subject: [Buildroot] [git commit] stunnel: bump to version 5.02
Message-ID: <20140618123420.7E9D89D041@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=143593b969c3f2308e68deddf6a06b7478e24491
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stunnel/stunnel.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index ec3af4b..aef67b9 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STUNNEL_VERSION = 5.01
+STUNNEL_VERSION = 5.02
 STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/archive/5.x/
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPT = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork
