From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 20:40:47 +0200
Subject: [Buildroot] [git commit] jquery-mobile : bump to version 1.4.3
Message-ID: <20140717184100.EE7AF9D26A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31d8a19a9071592311c0d51ea851a044bd06b06f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jquery-mobile/jquery-mobile.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/jquery-mobile/jquery-mobile.mk b/package/jquery-mobile/jquery-mobile.mk
index 6d17188..3a634ed 100644
--- a/package/jquery-mobile/jquery-mobile.mk
+++ b/package/jquery-mobile/jquery-mobile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQUERY_MOBILE_VERSION = 1.4.2
+JQUERY_MOBILE_VERSION = 1.4.3
 JQUERY_MOBILE_SITE = http://jquerymobile.com/resources/download
 JQUERY_MOBILE_SOURCE = jquery.mobile-$(JQUERY_MOBILE_VERSION).zip
 JQUERY_MOBILE_LICENSE = MIT
