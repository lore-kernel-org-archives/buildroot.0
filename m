From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu,  2 Aug 2012 08:18:21 +0100
Subject: [Buildroot] [PATCH] empty: add license information
Message-ID: <1343891901-8678-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/empty/empty.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/empty/empty.mk b/package/empty/empty.mk
index 97b1e7e..005f880 100644
--- a/package/empty/empty.mk
+++ b/package/empty/empty.mk
@@ -6,6 +6,8 @@
 EMPTY_VERSION = 0.6.18b
 EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
 EMPTY_SITE = http://downloads.sourceforge.net/project/empty/empty/empty-$(EMPTY_VERSION)
+EMPTY_LICENSE = BSD-3c
+EMPTY_LICENSE_FILES = COPYRIGHT
 
 define EMPTY_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
-- 
1.7.9.5
