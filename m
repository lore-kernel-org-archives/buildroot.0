From: Esben Haabendal <esben.haabendal@gmail.com>
Date: Tue, 19 Mar 2019 12:28:50 +0100
Subject: [Buildroot] [PATCH 1/3] gummiboot: use new official upstream git
 repository
In-Reply-To: <20190319112852.9592-1-esben.haabendal@gmail.com>
References: <20190319112852.9592-1-esben.haabendal@gmail.com>
Message-ID: <20190319112852.9592-2-esben.haabendal@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Esben Haabendal <esben@haabendal.dk>

Signed-off-by: Esben Haabendal <esben@haabendal.dk>
---
 boot/gummiboot/gummiboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/gummiboot/gummiboot.mk b/boot/gummiboot/gummiboot.mk
index 85a5daaeab69..0e67e5e8ce0e 100644
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
-- 
2.21.0
