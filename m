From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 14:02:35 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] libesmtp: update/fix site
 URL
Message-ID: <20181005120142.24AF38D2C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6242d6787085febea0b6165b9fecbdab895c55a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

The old URL was not working for quite some time.

Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 43e7667fc82d55d0a9fdfad91375a0621efb7576)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libesmtp/Config.in   | 2 +-
 package/libesmtp/libesmtp.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libesmtp/Config.in b/package/libesmtp/Config.in
index ba9d52751c..f3ed521d22 100644
--- a/package/libesmtp/Config.in
+++ b/package/libesmtp/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBESMTP
 	help
 	  Library for sending emails through SMTP.
 
-	  http://www.stafford.uklinux.net/libesmtp
+	  http://brianstafford.info/libesmtp
 
 comment "libesmtp needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index b0f88c7a3b..9c336793a4 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -6,7 +6,7 @@
 
 LIBESMTP_VERSION = 1.0.6
 LIBESMTP_SOURCE = libesmtp-$(LIBESMTP_VERSION).tar.bz2
-LIBESMTP_SITE = http://www.stafford.uklinux.net/libesmtp
+LIBESMTP_SITE = http://brianstafford.info/libesmtp
 LIBESMTP_INSTALL_STAGING = YES
 LIBESMTP_CONFIG_SCRIPTS = libesmtp-config
 LIBESMTP_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
