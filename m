From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 15 Sep 2016 16:03:54 +0530
Subject: [Buildroot] [PATCH 7/7] libcap-ng: annotate licenses with components
In-Reply-To: <1473935634-14150-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1473935634-14150-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1473935634-14150-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcap-ng.so library is released under LGPLv2.1+ and programs testcap,
filecap, netcap and pscap are released under GPLv2+.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
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
 
-- 
2.6.2
