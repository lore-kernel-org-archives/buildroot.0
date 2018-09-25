From: Marcel Patzlaff <m.patzlaff@pilz.de>
Date: Tue, 25 Sep 2018 16:48:48 +0200
Subject: [Buildroot] [PATCH v2 1/1] libesmtp: update/fix site URL
Message-ID: <20180925144848.5965-1-m.patzlaff@pilz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old URL was not working for quite some time.

Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>

---
Changes v1 -> v2:
  - also changed URL in Config.in
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
-- 
2.17.1

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
