From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon,  8 Apr 2019 21:17:48 +0200
Subject: [Buildroot] [PATCH 1/1] boot/barebox.hash: add missing newline at
 EOF
Message-ID: <20190408191748.17472-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
   boot/barebox/barebox.hash:5: missing newline at end of file

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 boot/barebox/barebox.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index 348b23d47c..dfbd94fca8 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -2,4 +2,4 @@
 md5 2d9619dfe6aaaf3b10d6327486e18571 barebox-2019.04.0.tar.bz2
 
 # Locally calculated
-sha256 d2834b612228b82bbaa713b26dec1fa770123bb02727400e4c56f6f2bffb01cc barebox-2019.04.0.tar.bz2
\ No newline at end of file
+sha256 d2834b612228b82bbaa713b26dec1fa770123bb02727400e4c56f6f2bffb01cc barebox-2019.04.0.tar.bz2
-- 
2.21.0
