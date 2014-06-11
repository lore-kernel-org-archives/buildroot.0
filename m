From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jun 2014 15:18:07 +0200
Subject: [Buildroot] [git commit] libcap-ng: security bump to version 0.7.4
Message-ID: <20140611131923.CEB629CFA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0da839ff84aea159ec557958a72b208a5e94651
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-3215.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcap-ng/libcap-ng.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
