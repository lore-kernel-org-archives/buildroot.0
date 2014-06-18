From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 14:11:14 +0200
Subject: [Buildroot] [git commit] netatalk: bump to version 3.1.2
Message-ID: <20140618123420.4060A9D041@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51275918423f5069f07af9fc0daa946f4f952b14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netatalk/netatalk.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index e5e5c6b..1285af2 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETATALK_VERSION = 3.0.8
+NETATALK_VERSION = 3.1.2
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 NETATALK_AUTORECONF = YES
@@ -27,7 +27,8 @@ NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 	--without-kerberos \
 	--without-pam \
 	--with-libevent=no \
-	--with-dtrace=no
+	--with-dtrace=no \
+	--with-mysql-config=no
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
 	NETATALK_DEPENDENCIES += cups
