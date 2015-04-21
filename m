From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Apr 2015 22:54:14 +0200
Subject: [Buildroot] [git commit] rtai: bump to version 4.0.1
Message-ID: <20150421211249.3E935819D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03ff39c1eba8eab13d1484a3db13c22cfa3691d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Bastian <Matthew.Bastian@nrc-cnrc.gc.ca>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rtai/rtai.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index 6f94121..dfd8e0c 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTAI_VERSION = 3.8.1
+RTAI_VERSION = 4.0.1
 RTAI_SOURCE = rtai-$(RTAI_VERSION).tar.bz2
 RTAI_SITE = https://www.rtai.org/userfiles/downloads/RTAI
 RTAI_INSTALL_STAGING = YES
@@ -22,6 +22,8 @@ RTAI_CONF_OPTS = \
 	--includedir=/usr/include/rtai \
 	--with-linux-dir=$(LINUX_DIR) 	\
 	--disable-leds		      	\
+	--enable-usi			\
+	--enable-align-priority		\
 	--disable-rtailab		\
 	--with-module-dir=/lib/modules/$(LINUX_VERSION_PROBED)/rtai
 
