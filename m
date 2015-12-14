From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:11:15 -0300
Subject: [Buildroot] [PATCH 36/45] vde2: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-37-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vde2/vde2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index f4a8c84..bad758d 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -7,7 +7,7 @@
 VDE2_VERSION = 2.3.2
 VDE2_SOURCE = vde2-$(VDE2_VERSION).tar.bz2
 VDE2_SITE = http://downloads.sourceforge.net/project/vde/vde2/$(VDE2_VERSION)
-VDE2_LICENSE = GPLv2+ LGPLv2.1+ BSD-3c
+VDE2_LICENSE = GPLv2+, LGPLv2.1+, BSD-3c
 VDE2_LICENSE_FILES = COPYING COPYING.libvdeplug COPYING.slirpvde
 VDE2_INSTALL_STAGING = YES
 
-- 
2.4.10
