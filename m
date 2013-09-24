From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Tue, 24 Sep 2013 15:50:53 -0500
Subject: [Buildroot] linux-pam: bump to version 1.1.8
Message-ID: <1380055853-7849-1-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version to fix compile error with 1.1.7.

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/linux-pam/linux-pam.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 6d57593..7d2cbd3 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -4,7 +4,7 @@
 # 
 ################################################################################
 
-LINUX_PAM_VERSION = 1.1.7
+LINUX_PAM_VERSION = 1.1.8
 LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
 LINUX_PAM_SITE = http://linux-pam.org/library/
 LINUX_PAM_INSTALL_STAGING = YES
-- 
1.7.1
