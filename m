From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 29 Mar 2013 08:19:53 -0300
Subject: [Buildroot] [PATCH 4/6] genimage: needs host-pkgconf
In-Reply-To: <1364555995-32259-1-git-send-email-gustavo@zacarias.com.ar>
References: <1364555995-32259-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1364555995-32259-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/1561c26e45d0604f058eb0c7a8bebf08d4abe756/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/genimage/genimage.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 6ed44a4..2c45a8d 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -7,7 +7,7 @@
 GENIMAGE_VERSION        = 4
 GENIMAGE_SOURCE         = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE           = http://www.pengutronix.de/software/genimage/download/
-GENIMAGE_DEPENDENCIES   = libconfuse
+GENIMAGE_DEPENDENCIES   = host-pkgconf libconfuse
 GENIMAGE_LICENSE        = GPLv2
 
 $(eval $(host-autotools-package))
-- 
1.8.1.5
