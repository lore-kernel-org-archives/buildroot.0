From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 20 Sep 2019 10:56:23 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: install libssp.so from external
 toolchain
Message-ID: <20190920085623.8160-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index c3ddff263f..286913995a 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -112,7 +112,7 @@ endif
 # Definitions of the list of libraries that should be copied to the target.
 #
 
-TOOLCHAIN_EXTERNAL_LIBS += ld*.so* libgcc_s.so.* libatomic.so.*
+TOOLCHAIN_EXTERNAL_LIBS += ld*.so* libgcc_s.so.* libatomic.so.* libssp.so.*
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 TOOLCHAIN_EXTERNAL_LIBS += libc.so.* libcrypt.so.* libdl.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
-- 
2.23.0
