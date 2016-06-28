From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 10:29:36 +0200
Subject: [Buildroot] [git commit] xorriso: indentation cleanup
Message-ID: <20160628082959.57C04802FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af5503f24c224a6ed1d2c1abb47de3230234ac9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
