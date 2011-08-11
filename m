From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Thu, 11 Aug 2011 12:38:33 +0200
Subject: [Buildroot] [PATCH] leafpad: bump to 0.8.18
Message-ID: <20110811123833.0e98502a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frederic Bassaler <frederic.bassaler@gmail.com>
---
 package/leafpad/leafpad.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index 9964409..bc04249 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -3,7 +3,7 @@
 # leafpad
 #
 #############################################################
-LEAFPAD_VERSION = 0.8.14
+LEAFPAD_VERSION = 0.8.18
 LEAFPAD_SOURCE = leafpad-$(LEAFPAD_VERSION).tar.gz
 LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
 LEAFPAD_AUTORECONF = NO
-- 
1.7.2.3
