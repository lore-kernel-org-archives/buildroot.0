From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue,  7 May 2013 14:29:21 -0700
Subject: [Buildroot] [PATCH] msmtp: bump to version 1.4.31
Message-ID: <1367962161-18531-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also added license information

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/msmtp/msmtp.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 87a2fbb..e99ab3d 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-MSMTP_VERSION = 1.4.27
+MSMTP_VERSION = 1.4.31
 MSMTP_SITE = http://downloads.sourceforge.net/project/msmtp/msmtp/$(MSMTP_VERSION)
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.bz2
+MSMTP_LICENSE = GPLv3+
+MSMTP_LICENSE_FILES = COPYING
 
 MSMTP_DEPENDENCIES += host-pkgconf
 
-- 
1.7.4.1
