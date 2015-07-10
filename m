From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 10 Jul 2015 14:40:07 -0300
Subject: [Buildroot] [PATCH 2/4] libunistring: bump to version 0.9.6
In-Reply-To: <1436550009-30590-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436550009-30590-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436550009-30590-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libunistring/libunistring.hash | 2 +-
 package/libunistring/libunistring.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libunistring/libunistring.hash b/package/libunistring/libunistring.hash
index e272997..ba4b642 100644
--- a/package/libunistring/libunistring.hash
+++ b/package/libunistring/libunistring.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	0b3f4dbea5124f56639a701376ed78e5f595e7b720cfbb0cf1f81f375894c77b	libunistring-0.9.5.tar.xz
+sha256	2df42eae46743e3f91201bf5c100041540a7704e8b9abfd57c972b2d544de41b	libunistring-0.9.6.tar.xz
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index 0060518..bb1641e 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNISTRING_VERSION = 0.9.5
+LIBUNISTRING_VERSION = 0.9.6
 LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
 LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
-- 
2.3.6
