From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Mar 2019 21:21:49 +0100
Subject: [Buildroot] [git commit] gummiboot: upgrade to last commit before
 being removed
Message-ID: <20190320203118.2413882B3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74d99ad941677db785b5175a938c8cdce7707543
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This upgrades to version 48 plus the last commits done after that.
Note, that after that, gummiboot is officially dead, so there will
be no more upstream commits after this.

For various reasons, there are still users of gummiboot, so let's base our
work on the latest gummiboot "version".

Signed-off-by: Esben Haabendal <esben@haabendal.dk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/gummiboot/gummiboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/gummiboot/gummiboot.mk b/boot/gummiboot/gummiboot.mk
index 0e67e5e8ce..748e87030e 100644
--- a/boot/gummiboot/gummiboot.mk
+++ b/boot/gummiboot/gummiboot.mk
@@ -6,7 +6,7 @@
 
 GUMMIBOOT_SITE = https://gitlab.freedesktop.org/archived-projects/gummiboot.git
 GUMMIBOOT_SITE_METHOD = git
-GUMMIBOOT_VERSION = 43
+GUMMIBOOT_VERSION = 2bcd919c681c952eb867ef1bdb458f1bc49c2d55
 GUMMIBOOT_LICENSE = LGPL-2.1+
 GUMMIBOOT_LICENSE_FILES = LICENSE
 
