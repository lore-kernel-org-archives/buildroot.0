From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Apr 2019 22:38:10 +0200
Subject: [Buildroot] [git commit] boot/barebox: add missing newline at EOF
 in hash file
Message-ID: <20190408203431.6FE9D8E16E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94fb4aa357406e7278a080485fc1b7a14c5288eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following check-package warning:

   boot/barebox/barebox.hash:5: missing newline at end of file

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
