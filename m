From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:15 -0300
Subject: [Buildroot] [PATCH 47/53] sysklogd: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-47-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sysklogd/sysklogd.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 886e471..37293da 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -5,9 +5,11 @@
 ################################################################################
 
 SYSKLOGD_VERSION = 1.5
-SYSKLOGD_SOURCE  = sysklogd_$(SYSKLOGD_VERSION).orig.tar.gz
-SYSKLOGD_PATCH   = sysklogd_$(SYSKLOGD_VERSION)-6.diff.gz
-SYSKLOGD_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysklogd
+SYSKLOGD_SOURCE = sysklogd_$(SYSKLOGD_VERSION).orig.tar.gz
+SYSKLOGD_PATCH = sysklogd_$(SYSKLOGD_VERSION)-6.diff.gz
+SYSKLOGD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysklogd
+SYSKLOGD_LICENSE = GPLv2+
+SYSKLOGD_LICENSE_FILES = COPYING
 
 # Override BusyBox implementations if BusyBox is enabled.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
1.8.5.5
