From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Dec 2014 00:45:34 +0100
Subject: [Buildroot] [git commit] stunnel: bump to version 5.08
Message-ID: <20141215234642.4CFCF80412@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48a9e431d8815f988ffc558894b2374e028c096f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stunnel/stunnel.hash |    4 ++--
 package/stunnel/stunnel.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 2745a81..337d26b 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,2 +1,2 @@
-# From http://www.stunnel.org/pipermail/stunnel-announce/2014-November/000085.html
-sha256	505c6c63c4a20fc0cce8c35ef1ab7626c7b01071e3fca4ac6ea417afe8065309	stunnel-5.07.tar.gz
+# From http://www.stunnel.org/pipermail/stunnel-announce/2014-December/000088.html
+sha256	830b21d24cd237e96f4d7993be43553d4eba4d3cfa2660faa78dec8d41d314fc	stunnel-5.08.tar.gz
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 3d0596d..eb24781 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STUNNEL_VERSION = 5.07
+STUNNEL_VERSION = 5.08
 STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/archive/5.x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
