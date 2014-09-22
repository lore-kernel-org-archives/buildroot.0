From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 22 Sep 2014 20:38:23 +0200
Subject: [Buildroot] [PATCH] slang: bump to 2.3.0
Message-ID: <1411411103-4625-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version and change download location.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/slang/slang.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 529f4e5..4726ba1 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-SLANG_VERSION_MAJOR = 2.2
-SLANG_VERSION = $(SLANG_VERSION_MAJOR).4
-SLANG_SOURCE = slang-$(SLANG_VERSION).tar.bz2
-SLANG_SITE = ftp://ftp.fu-berlin.de/pub/unix/misc/slang/v$(SLANG_VERSION_MAJOR)
+SLANG_VERSION = 2.3.0
+SLANG_SITE = http://www.jedsoft.org/releases/slang/
 SLANG_LICENSE = GPLv2+
 SLANG_LICENSE_FILES = COPYING
 SLANG_INSTALL_STAGING = YES
-- 
1.8.3.2
