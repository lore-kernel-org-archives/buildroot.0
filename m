From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 12 May 2013 10:53:51 -0300
Subject: [Buildroot] [PATCH 3/4] fftw: bump to version 3.3.3
In-Reply-To: <1368366832-30354-1-git-send-email-gustavo@zacarias.com.ar>
References: <1368366832-30354-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1368366832-30354-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fftw/fftw.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 74a5e11..d0af752 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-FFTW_VERSION = 3.3.2
+FFTW_VERSION = 3.3.3
 FFTW_SITE = http://www.fftw.org
 FFTW_INSTALL_STAGING = YES
+FFTW_LICENSE = GPLv2+
+FFTW_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.1.5
