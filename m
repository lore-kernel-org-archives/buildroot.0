From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 18:46:08 +0200
Subject: [Buildroot] [git commit] libcap-ng: annotate licenses with
	components
Message-ID: <20160916164630.BC1A881D5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b0dc3515a7f15656f532e3e7df9acb347c8f4bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcap-ng.so library is released under LGPLv2.1+ and programs testcap,
filecap, netcap and pscap are released under GPLv2+.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcap-ng/libcap-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 34e0f2c..19cc27d 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -6,7 +6,7 @@
 
 LIBCAP_NG_VERSION = 0.7.8
 LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
-LIBCAP_NG_LICENSE = GPLv2+ LGPLv2.1+
+LIBCAP_NG_LICENSE = GPLv2+ (programs), LGPLv2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
 LIBCAP_NG_INSTALL_STAGING = YES
 
