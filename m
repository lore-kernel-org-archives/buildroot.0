From: Anthony Viallard <viallard@syscom-instruments.com>
Date: Thu, 13 Aug 2015 11:59:36 +0200
Subject: [Buildroot] [PATCH 1/1] msmtp: bump to version 1.6.2
Message-ID: <1439459976-17749-1-git-send-email-viallard@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
---
 package/msmtp/msmtp.hash | 6 +++---
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index a522f9d..fb03e05 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/msmtp/files/msmtp/1.6.1/
-md5	6ebba4809bbc665b8a665a018d1a5ee1	msmtp-1.6.1.tar.xz
-sha1	ac70151bcb53af5e192cbb147fd2b8139c637089	msmtp-1.6.1.tar.xz
+# From http://sourceforge.net/projects/msmtp/files/msmtp/1.6.2/
+md5	3baca93c7e5f1aa9d36a2e5b38739ab9	msmtp-1.6.2.tar.xz
+sha1	2d2272d04851b9bc806a77f47344e61840185329	msmtp-1.6.2.tar.xz
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index aa75dd4..bff2620 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.6.1
+MSMTP_VERSION = 1.6.2
 MSMTP_SITE = http://downloads.sourceforge.net/project/msmtp/msmtp/$(MSMTP_VERSION)
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
-- 
2.4.6
