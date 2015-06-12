From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 21:28:39 +0200
Subject: [Buildroot] [git commit] stunnel: bump to version 5.18
Message-ID: <20150612201536.5965181E67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b5962523bb47c551c24c386460ca0043f821ba4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/stunnel/stunnel.hash |    4 ++--
 package/stunnel/stunnel.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index e45e691..91b297c 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,2 +1,2 @@
-# From https://www.stunnel.org/pipermail/stunnel-announce/2015-April/000100.html
-sha256	c3e79e582621a0827125e35e1c00450190104fc02dc3c5274cb02b05859fd472	stunnel-5.17.tar.gz
+# From http://www.stunnel.org/pipermail/stunnel-users/2015-June/005094.html
+sha256	0532c0a2f8de3da1ab625e384146501ce5936fac63d01561c3a9bf652b692317	stunnel-5.18.tar.gz
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 3f5b9aa..4674694 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).17
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).18
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
