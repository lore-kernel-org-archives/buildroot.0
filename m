From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  6 Jan 2015 07:35:10 -0300
Subject: [Buildroot] [PATCH] msmtp: bump to version 1.6.1
Message-ID: <1420540510-11937-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/msmtp/msmtp.hash | 6 +++---
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index 2196afb..a522f9d 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/msmtp/files/msmtp/1.6.0/
-md5	1c166853b63c02ae2ab56b50f1aae57b	msmtp-1.6.0.tar.xz
-sha1	39e597619f797ec3550c0146cd3d9e55e85947eb	msmtp-1.6.0.tar.xz
+# From http://sourceforge.net/projects/msmtp/files/msmtp/1.6.1/
+md5	6ebba4809bbc665b8a665a018d1a5ee1	msmtp-1.6.1.tar.xz
+sha1	ac70151bcb53af5e192cbb147fd2b8139c637089	msmtp-1.6.1.tar.xz
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 1c6de16..aa75dd4 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.6.0
+MSMTP_VERSION = 1.6.1
 MSMTP_SITE = http://downloads.sourceforge.net/project/msmtp/msmtp/$(MSMTP_VERSION)
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
-- 
2.0.5
