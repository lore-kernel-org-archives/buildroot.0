From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Wed, 28 Sep 2016 22:13:58 -0300
Subject: [Buildroot] [PATCH] libtasn1: clarify licensing info
Message-ID: <1475111638-24640-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

The library is LGPLv2.1+, the tests and tools are GPLv3+ so clarify to
avoid confusion.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/libtasn1/libtasn1.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index 6b7e6b3..79223a4 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -7,7 +7,7 @@
 LIBTASN1_VERSION = 4.9
 LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison
-LIBTASN1_LICENSE = GPLv3+, LGPLv2.1+
+LIBTASN1_LICENSE = GPLv3+ (tests, tools), LGPLv2.1+ (library)
 LIBTASN1_LICENSE_FILES = COPYING COPYING.LIB
 LIBTASN1_INSTALL_STAGING = YES
 # 'missing' fallback logic botched so disable it completely
-- 
2.7.3
