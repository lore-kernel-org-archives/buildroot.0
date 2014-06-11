From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Jun 2014 09:55:56 -0300
Subject: [Buildroot] [PATCH] libcap-ng: security bump to version 0.7.4
Message-ID: <1402491356-2889-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-3215.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcap-ng/libcap-ng.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 53c7ee7..bdcb418 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCAP_NG_VERSION = 0.7.3
-LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng/
+LIBCAP_NG_VERSION = 0.7.4
+LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
 LIBCAP_NG_LICENSE = GPLv2+ LGPLv2.1+
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
 LIBCAP_NG_INSTALL_STAGING = YES
-- 
1.8.5.5
