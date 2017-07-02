From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jul 2017 15:26:30 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] package/rtl8821au: fix
	license file name
Message-ID: <20170702133106.D6D5981F61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=713302d5c42bd3b03f720a59b15b290a9a367557
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Fixes #9976.

Reported-by: Nick Wright <nwright98@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 54778b7d7e84863c4bc3036e69f959ed52b7953b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8821au/rtl8821au.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index 32b7bfd..b6ad431 100644
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
