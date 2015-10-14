From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 14 Oct 2015 09:40:30 +0200
Subject: [Buildroot] [PATCH 1/1] squeezelite: fix license typo
Message-ID: <1444808430-11567-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/squeezelite/squeezelite.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squeezelite/squeezelite.mk b/package/squeezelite/squeezelite.mk
index b9dfa7f..7a82f4a 100644
--- a/package/squeezelite/squeezelite.mk
+++ b/package/squeezelite/squeezelite.mk
@@ -7,7 +7,7 @@
 SQUEEZELITE_VERSION = v1.8
 SQUEEZELITE_SITE = $(call github,robadenshi,squeezelite,$(SQUEEZELITE_VERSION))
 SQUEEZELITE_LICENSE = GPLv3
-SQUEEZELITE_LICENSE_FILE = LICENSE.txt
+SQUEEZELITE_LICENSE_FILES = LICENSE.txt
 SQUEEZELITE_DEPENDENCIES = alsa-lib flac libmad libvorbis faad2 mpg123
 SQUEEZELITE_MAKE_OPTS = -DLINKALL
 
-- 
1.9.1
