From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Dec 2015 21:47:26 +0100
Subject: [Buildroot] [git commit] stunnel: bump to version 5.27
Message-ID: <20151203211258.DEA5D80ADB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=182a18f8faeef7d57fb98b4a79d0c0f54ab1be05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stunnel/stunnel.hash | 4 ++--
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index bae02ac..eab2035 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,2 +1,2 @@
-# From http://www.stunnel.org/pipermail/stunnel-users/2015-November/005281.html
-sha256	1fb2209f1e006cc01813e1688599c4d0fb0adde4434c31ab95745b1db97484b7	stunnel-5.25.tar.gz
+# From https://www.stunnel.org/pipermail/stunnel-announce/2015-December/000113.html
+sha256	7474e986710e88a5cc3330b6b1762f9449f01eccf826fa0f97e56d064c05ead3	stunnel-5.27.tar.gz
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index f43a7cb..20a0c95 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).25
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).27
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
