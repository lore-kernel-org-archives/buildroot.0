From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Jul 2013 14:04:45 +0200
Subject: [Buildroot] [git commit] jquery-sparkline: bump to version 2.1.2
Message-ID: <20130711131227.1D6B19A0E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6c6dd25c98a4a7bd5e5791a1d1d7dc65cf7b4e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jquery-sparkline/jquery-sparkline.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/jquery-sparkline/jquery-sparkline.mk b/package/jquery-sparkline/jquery-sparkline.mk
index af05045..a81ce01 100644
--- a/package/jquery-sparkline/jquery-sparkline.mk
+++ b/package/jquery-sparkline/jquery-sparkline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQUERY_SPARKLINE_VERSION = 2.1.1
+JQUERY_SPARKLINE_VERSION = 2.1.2
 JQUERY_SPARKLINE_SITE = http://www.omnipotent.net/jquery.sparkline/$(JQUERY_SPARKLINE_VERSION)
 JQUERY_SPARKLINE_SOURCE = jquery.sparkline.min.js
 JQUERY_SPARKLINE_LICENSE = BSD-3c
