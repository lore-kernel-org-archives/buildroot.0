From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Jun 2016 20:09:12 -0300
Subject: [Buildroot] [PATCH] msmtp: bump to version 1.6.5
Message-ID: <1465254552-28684-1-git-send-email-gustavo@zacarias.com.ar>
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
index fb03e05..d0de8e0 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/msmtp/files/msmtp/1.6.2/
-md5	3baca93c7e5f1aa9d36a2e5b38739ab9	msmtp-1.6.2.tar.xz
-sha1	2d2272d04851b9bc806a77f47344e61840185329	msmtp-1.6.2.tar.xz
+# From http://sourceforge.net/projects/msmtp/files/msmtp/1.6.5/
+md5	50a8c9bb72f8222779db6b4aae2965e0	msmtp-1.6.5.tar.xz
+sha1	27d1fc609cd453a7e4c55c4ec55d455949bc53f1	msmtp-1.6.5.tar.xz
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 7c8261e..7ede66c 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.6.2
+MSMTP_VERSION = 1.6.5
 MSMTP_SITE = http://downloads.sourceforge.net/project/msmtp/msmtp/$(MSMTP_VERSION)
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
-- 
2.7.3
