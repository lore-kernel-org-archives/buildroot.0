From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 15 Jul 2019 18:38:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/xscreensaver: fix hash
Message-ID: <20190715163833.2128-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When bumping to version 5.43, an incorrect hash was set

Fixes:
 - http://autobuild.buildroot.org/results/029ab289021edaf9820b47846e5d107cab6f3e28

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.20.1
