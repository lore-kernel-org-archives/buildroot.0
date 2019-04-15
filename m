From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 21:30:52 +0200
Subject: [Buildroot] [git commit] package/tar: add hash for license files
Message-ID: <20190415193031.4B85E8160A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5eabc084fb2a7dbe08d22b93c01ccdf8b5a86999
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tar/tar.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tar/tar.hash b/package/tar/tar.hash
index e5634566e0..60309bab8f 100644
--- a/package/tar/tar.hash
+++ b/package/tar/tar.hash
@@ -1,3 +1,4 @@
 # Locally calculated after checking signature
 sha256	402dcfd0022fd7a1f2c5611f5c61af1cd84910a760a44a688e18ddbff4e9f024	tar-1.29.tar.xz
 sha256	9173f222464dd3676118408840da5990527062b5c7daf6487bed7c396c45bfb1	tar-1.29.cpio.gz
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
