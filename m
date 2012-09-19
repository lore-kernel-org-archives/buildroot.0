From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Sep 2012 22:28:10 +0200
Subject: [Buildroot] [PATCH] leafpad: needs host-intltool
Message-ID: <1348086490-13121-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/d313a67b3deca262844d1043eafa5f6c5b6b7cad/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/leafpad/leafpad.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index ede8c58..b06e655 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -6,7 +6,7 @@
 LEAFPAD_VERSION = 0.8.18
 LEAFPAD_SOURCE = leafpad-$(LEAFPAD_VERSION).tar.gz
 LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
-LEAFPAD_DEPENDENCIES = libgtk2
+LEAFPAD_DEPENDENCIES = libgtk2 host-intltool
 
 $(eval $(autotools-package))
 
-- 
1.7.9.5
