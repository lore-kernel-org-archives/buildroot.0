From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 16:08:53 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: add Masahiro Yamada as contact
 for arm_foundation_v8_defconfig
Message-ID: <20191231150327.C3EA78E94F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75628b19c7425b77b1db991f02860968803f65e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Masahiro is the last person who made significant changes to this
defconfig, so let's add him as a contact for it, so that he receives
notifications of build failures and gets Cc'ed on patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f867662d58..c69dc09d45 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1566,6 +1566,10 @@ F:	package/tslib/
 F:	package/x11r7/xdriver_xf86-input-tslib/
 F:	package/x11vnc/
 
+N:	Masahiro Yamada <yamada.masahiro@socionext.com>
+F:	board/arm/foundation-v8/
+F:	configs/arm_foundationv8_defconfig
+
 N:	Mathieu Audat <mathieuaudat@gmail.com>
 F:	board/technologic/ts4900/
 F:	configs/ts4900_defconfig
