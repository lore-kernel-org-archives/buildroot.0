From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:30:14 +0200
Subject: [Buildroot] [git commit] package/parted: add hash for license file
Message-ID: <20190602201236.D82168EDA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=820c6dc348bc5840eaba9d5aa302a2d5664b1921
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/parted/parted.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/parted/parted.hash b/package/parted/parted.hash
index e31ae3c4ce..7b04128bea 100644
--- a/package/parted/parted.hash
+++ b/package/parted/parted.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
 sha256	858b589c22297cacdf437f3baff6f04b333087521ab274f7ab677cb8c6bb78e4  parted-3.2.tar.xz
+
+# Locally calculated
+sha256	0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING
