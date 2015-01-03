From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jan 2015 21:39:47 +0100
Subject: [Buildroot] [git commit] stunnel: bump to version 5.09
Message-ID: <20150103204009.6ED33803E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=616c878ce5ecfef1fc69fe6d87e135b326d63a37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change to usenix.org.uk mirror since nluug.nl doesn't seem to mirror
files as quickly and is down at the moment.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/stunnel/stunnel.hash |    4 ++--
 package/stunnel/stunnel.mk   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 337d26b..7f28905 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,2 +1,2 @@
-# From http://www.stunnel.org/pipermail/stunnel-announce/2014-December/000088.html
-sha256	830b21d24cd237e96f4d7993be43553d4eba4d3cfa2660faa78dec8d41d314fc	stunnel-5.08.tar.gz
+# From http://www.stunnel.org/pipermail/stunnel-announce/2015-January/000090.html
+sha256	87b34a74061861d1edd2ab238c73eb989b3d0a17e44574b7b6ead1a16aae38c8	stunnel-5.09.tar.gz
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index eb24781..f7099e8 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-STUNNEL_VERSION = 5.08
-STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/archive/5.x
+STUNNEL_VERSION = 5.09
+STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/5.x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
 	--disable-libwrap
