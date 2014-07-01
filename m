From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 12:55:12 +0200
Subject: [Buildroot] [git commit] fftw: bump to version 3.3.4
Message-ID: <20140701113220.D41FD9D128@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c142bc4e9bad498a0879c97291c4e0704c50b205
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fftw/fftw.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
