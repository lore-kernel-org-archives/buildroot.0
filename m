From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 28 Jun 2016 06:56:24 +0200
Subject: [Buildroot] [PATCH 2/2] xorriso: indentation cleanup
In-Reply-To: <1467089784-18030-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1467089784-18030-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1467089784-18030-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/xorriso/xorriso.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index 57537e8..396eeae 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -12,12 +12,12 @@ HOST_XORRISO_DEPENDENCIES =
 # Disable everything until we actually need those feature, and add the correct
 # host-libraries
 HOST_XORRISO_CONF_OPTS = \
-        --disable-zlib \
-        --disable-bzip2 \
-        --disable-libcdio \
-        --disable-libreadline \
-        --disable-libedit \
-        --disable-libacl
+	--disable-zlib \
+	--disable-bzip2 \
+	--disable-libcdio \
+	--disable-libreadline \
+	--disable-libedit \
+	--disable-libacl
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 XORRISO_DEPENDENCIES += libiconv
-- 
1.9.1
