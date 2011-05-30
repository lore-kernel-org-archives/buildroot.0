From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 May 2011 23:57:01 +0200
Subject: [Buildroot] [PATCH 6/8] Remove unused variable definitions
In-Reply-To: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
References: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
Message-ID: <154d5c5752e6e7140ce244b6099b1bf6a2b6ffe0.1306792524.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |   10 ----------
 1 files changed, 0 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 9be7f1c..3119f5e 100644
--- a/Makefile
+++ b/Makefile
@@ -223,16 +223,6 @@ HOST_LIBEXT:=.lib
 HOST_SHREXT:=.dll
 endif
 
-# The preferred type of libs we build for the target
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
-LIBTGTEXT=.a
-#PREFERRED_LIB_FLAGS:=--disable-shared --enable-static
-else
-LIBTGTEXT=.so
-#PREFERRED_LIB_FLAGS:=--disable-static --enable-shared
-endif
-PREFERRED_LIB_FLAGS:=--enable-static --enable-shared
-
 ##############################################################
 #
 # The list of stuff to build for the target toolchain
-- 
1.7.1
