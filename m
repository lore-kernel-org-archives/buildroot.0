From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed,  8 May 2013 10:40:07 +0100
Subject: [Buildroot] [PATCH] patch: fix license information
Message-ID: <1368006007-23708-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/patch/patch.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index badc431..5a421c7 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -7,6 +7,6 @@
 PATCH_VERSION = 2.7.1
 PATCH_SITE = $(BR2_GNU_MIRROR)/patch
 PATCH_LICENSE = GPLv3+
-PATCH_LICENSE_FILE = COPYING
+PATCH_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.1.2
