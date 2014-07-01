From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Jul 2014 07:22:23 -0300
Subject: [Buildroot] [PATCH 1/2] fftw: bump to version 3.3.4
Message-ID: <1404210144-5425-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fftw/fftw.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index d0af752..3b302df 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFTW_VERSION = 3.3.3
+FFTW_VERSION = 3.3.4
 FFTW_SITE = http://www.fftw.org
 FFTW_INSTALL_STAGING = YES
 FFTW_LICENSE = GPLv2+
-- 
1.8.5.5
