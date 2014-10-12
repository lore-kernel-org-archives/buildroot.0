From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Oct 2014 18:27:30 +0200
Subject: [Buildroot] [PATCH] mongrel2: Use github call
Message-ID: <1413131250-5929-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/mongrel2/mongrel2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
index 14e3a80..74383c4 100644
--- a/package/mongrel2/mongrel2.mk
+++ b/package/mongrel2/mongrel2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MONGREL2_VERSION = v1.9.1
-MONGREL2_SITE = https://github.com/zedshaw/mongrel2/releases/download/$(MONGREL2_VERSION)
+MONGREL2_SITE = $(call github,zedshaw,mongrel2,$(MONGREL2_VERSION))
 MONGREL2_LICENSE = BSD-3c
 MONGREL2_LICENSE_FILES = LICENSE
 MONGREL2_DEPENDENCIES = sqlite zeromq
-- 
2.1.1
