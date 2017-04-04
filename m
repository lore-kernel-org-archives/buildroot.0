From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue,  4 Apr 2017 19:50:16 -0300
Subject: [Buildroot] [PATCH 08/11] python-pylibftdi: use package name for
	.mk file
In-Reply-To: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
References: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
Message-ID: <20170404225019.27916-8-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Found using [1]:
check-package --include-only TypoInPackageVariable $(find * -type f)
and manually fixed.

[1] http://patchwork.ozlabs.org/patch/729672/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
From get-developers:
Cc: Christian Kellermann <christian.kellermann@solectrix.de>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pylibftdi/{python-libftdi.mk => python-pylibftdi.mk} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename package/python-pylibftdi/{python-libftdi.mk => python-pylibftdi.mk} (96%)

diff --git a/package/python-pylibftdi/python-libftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
similarity index 96%
rename from package/python-pylibftdi/python-libftdi.mk
rename to package/python-pylibftdi/python-pylibftdi.mk
index b375abb4e..0a5887b2e 100644
--- a/package/python-pylibftdi/python-libftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# python-libftdi
+# python-pylibftdi
 #
 ################################################################################
 
-- 
2.11.0
