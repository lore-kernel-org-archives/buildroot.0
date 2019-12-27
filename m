From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 27 Dec 2019 15:43:22 +0100
Subject: [Buildroot] [PATCH 1/3] package/libnspr: allow building for Arc
 Architecture
In-Reply-To: <20191227144324.84759-1-giulio.benetti@benettiengineering.com>
References: <20191227144324.84759-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191227144324.84759-2-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arc architecture is now supported by NSPR so let's allow to build for
it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnspr/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index 1d95155248..57fcbdf6be 100644
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	def_bool y
-	depends on !BR2_arc && !BR2_xtensa
+	depends on !BR2_xtensa
 
 if BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 
-- 
2.20.1
