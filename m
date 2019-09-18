From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Sep 2019 23:02:50 +0200
Subject: [Buildroot] [git commit] package/libglib2: remove empty consecutive
 lines
Message-ID: <20190918205828.3BE108EB5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ab72c73cc1cb29138e0fde45a80a22284158c29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following check-package warning:

package/libglib2/libglib2.mk:90: consecutive empty lines

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libglib2/libglib2.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 1d5562e017..73ea27f4d1 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -87,7 +87,6 @@ else
 LIBGLIB2_CONF_OPTS += -Dlibmount=false
 endif
 
-
 # Purge useless binaries from target
 define LIBGLIB2_REMOVE_DEV_FILES
 	rm -rf $(TARGET_DIR)/usr/lib/glib-2.0
