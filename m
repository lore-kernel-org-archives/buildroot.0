From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 21:32:07 +0200
Subject: [Buildroot] [git commit] package/avrdude: bump version
Message-ID: <20160605200529.DDDF97FB44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b30cecbde9346cb6d49a8deb49e28035cf8895b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avrdude/avrdude.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 1811893..327618a 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AVRDUDE_VERSION = eabe067c4527bc2eedc5db9288ef5cf1818ec720
+AVRDUDE_VERSION = ad04c429a90f4c34f000ea4ae11db2705915a31f
 AVRDUDE_SITE = $(call github,kcuzner,avrdude,$(AVRDUDE_VERSION))
 AVRDUDE_LICENSE = GPLv2+
 AVRDUDR_LICENSE_FILES = avrdude/COPYING
