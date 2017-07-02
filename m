From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jul 2017 15:30:14 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/rtl8821au: fix
	license file name
Message-ID: <20170702132804.1A94181E43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0156e0541c6fb2a657314d1034520e436cc9ba50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

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
index 9ba43ef..36454dc 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -7,7 +7,7 @@
 RTL8821AU_VERSION = c33ddb05a77741d2a9c9b974ad0cf0fa26d17b6e
 RTL8821AU_SITE = $(call github,abperiasamy,rtl8812AU_8821AU_linux,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPLv2
-RTL8821AU_LICENSE_FILES = COPYING
+RTL8821AU_LICENSE_FILES = LICENSE
 
 RTL8821AU_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8812AU_8821AU=m \
