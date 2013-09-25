From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Sep 2013 10:14:11 +0200
Subject: [Buildroot] [git commit] linux-pam: bump to version 1.1.8
Message-ID: <20130925092155.DB9C79B463@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b74f81d56c5f9b46b4ba2db56edabbbbcad13cf8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump version to fix compile error with 1.1.7.

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
