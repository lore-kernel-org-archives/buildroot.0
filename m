From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 07:26:39 +0200
Subject: [Buildroot] [git commit] package/xscreensaver: fix hash
Message-ID: <20190717052621.222B483940@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2959e20f288f3b582f38de16dddb2c47d94b802b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When bumping to version 5.43, an incorrect hash was set

Fixes:
 - http://autobuild.buildroot.org/results/029ab289021edaf9820b47846e5d107cab6f3e28

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xscreensaver/xscreensaver.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xscreensaver/xscreensaver.hash b/package/xscreensaver/xscreensaver.hash
index c1198b7558..e33413c76a 100644
--- a/package/xscreensaver/xscreensaver.hash
+++ b/package/xscreensaver/xscreensaver.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 17eab67f3554e21c23b1526ec48a06a9ec8605baffee48f91f603f7599b383d4  xscreensaver-5.43.tar.gz
+sha256 158f381d687e8360a6debb0d3af0148d279e853666244f02d628a5a482bce194  xscreensaver-5.43.tar.gz
 sha256 8a03451ba5c4c9af669b53e47e50c38c149b9e152d3d627809b962da7b760bbd  hacks/screenhack.h
 sha256 56db580415bb313a4a82c5e08f106304904d15d42faf8e6ab14b34e14e2087a5  hacks/glx/chessmodels.h
