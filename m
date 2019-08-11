From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:07:36 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Masahiro Yamada as contact for
 arm_foundation_v8_defconfig
Message-ID: <20190811120739.26539-15-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Masahiro is the last person who made significant changes to this
defconfig, so let's add him as a contact for it, so that he receives
notifications of build failures and gets Cc'ed on patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
---
Masahiro, could you reply with a Acked-by if you're willing to
maintain this defconfig in Buildroot? Thanks!
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 409a0364c2..35e8d871bc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1499,6 +1499,10 @@ F:	package/tslib/
 F:	package/x11r7/xdriver_xf86-input-tslib/
 F:	package/x11vnc/
 
+N:	Masahiro Yamada <yamada.masahiro@socionext.com>
+F:	board/arm/foundation-v8/
+F:	configs/arm_foundationv8_defconfig
+
 N:	Mathieu Audat <mathieu.audat@savoirfairelinux.com>
 F:	board/technologic/ts4900/
 F:	configs/ts4900_defconfig
-- 
2.21.0
