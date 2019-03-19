From: Esben Haabendal <esben.haabendal@gmail.com>
Date: Tue, 19 Mar 2019 12:28:51 +0100
Subject: [Buildroot] [PATCH 2/3] gummiboot: upgrade to last commit before
 being removed
In-Reply-To: <20190319112852.9592-1-esben.haabendal@gmail.com>
References: <20190319112852.9592-1-esben.haabendal@gmail.com>
Message-ID: <20190319112852.9592-3-esben.haabendal@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Esben Haabendal <esben@haabendal.dk>

This upgrades to version 48 plus the last commits done after that.
Note, that after that, gummiboot is officially dead, so there will
be no more upstream commits after this.

For various reasons, there are still users of gummiboot, so let's base our
work on the latest gummiboot "version".

Signed-off-by: Esben Haabendal <esben@haabendal.dk>
---
 boot/gummiboot/gummiboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/gummiboot/gummiboot.mk b/boot/gummiboot/gummiboot.mk
index 0e67e5e8ce0e..748e87030e7b 100644
--- a/boot/gummiboot/gummiboot.mk
+++ b/boot/gummiboot/gummiboot.mk
@@ -6,7 +6,7 @@
 
 GUMMIBOOT_SITE = https://gitlab.freedesktop.org/archived-projects/gummiboot.git
 GUMMIBOOT_SITE_METHOD = git
-GUMMIBOOT_VERSION = 43
+GUMMIBOOT_VERSION = 2bcd919c681c952eb867ef1bdb458f1bc49c2d55
 GUMMIBOOT_LICENSE = LGPL-2.1+
 GUMMIBOOT_LICENSE_FILES = LICENSE
 
-- 
2.21.0
