From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 17:12:18 +0200
Subject: [Buildroot] [git commit] libjpeg: bump to version 9a
Message-ID: <20140702151502.B1BA79D144@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5dd08573e059c112b351f0a83392ad809370f1b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libjpeg/libjpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index dc38a7c..33106fa 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJPEG_VERSION = 8d
+LIBJPEG_VERSION = 9a
 LIBJPEG_SITE = http://www.ijg.org/files/
 LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_LICENSE = jpeg-license (BSD-3c-like)
