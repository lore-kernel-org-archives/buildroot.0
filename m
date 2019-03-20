From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Mar 2019 21:21:03 +0100
Subject: [Buildroot] [git commit] gummiboot: use new official upstream git
 repository
Message-ID: <20190320203118.1B3AA82B3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ab992231d8128fdc20644f0c3fd8e7effefbda5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Esben Haabendal <esben@haabendal.dk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/gummiboot/gummiboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/gummiboot/gummiboot.mk b/boot/gummiboot/gummiboot.mk
index 85a5daaeab..0e67e5e8ce 100644
--- a/boot/gummiboot/gummiboot.mk
+++ b/boot/gummiboot/gummiboot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GUMMIBOOT_SITE = http://cgit.freedesktop.org/gummiboot
+GUMMIBOOT_SITE = https://gitlab.freedesktop.org/archived-projects/gummiboot.git
 GUMMIBOOT_SITE_METHOD = git
 GUMMIBOOT_VERSION = 43
 GUMMIBOOT_LICENSE = LGPL-2.1+
