From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 Jun 2017 17:17:56 +0200
Subject: [Buildroot] [PATCH] package/rtl8821au: fix license file name
Message-ID: <20170628151756.763-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes #9976.

Reported-by: Nick Wright <nwright98@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rtl8821au/rtl8821au.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index 32b7bfd089..b6ad431b8b 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -7,7 +7,7 @@
 RTL8821AU_VERSION = b018b446fb0729fa659e7eead475d6c13f192642
 RTL8821AU_SITE = $(call github,abperiasamy,rtl8812AU_8821AU_linux,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPL-2.0
-RTL8821AU_LICENSE_FILES = COPYING
+RTL8821AU_LICENSE_FILES = LICENSE
 
 RTL8821AU_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8812AU_8821AU=m \
-- 
2.11.0
