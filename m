From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:25:17 +0200
Subject: [Buildroot] [git commit] package/gmp: add hashes for license files
Message-ID: <20190602201236.B337081354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b5b082416de476679b47d21538bb1f7a6b9c844
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gmp/gmp.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gmp/gmp.hash b/package/gmp/gmp.hash
index f4793cd93c..417b9d17bf 100644
--- a/package/gmp/gmp.hash
+++ b/package/gmp/gmp.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
 sha256	87b565e89a9a684fe4ebeeddb8399dce2599f9c9049854ca8c0dfbdea0e21912	gmp-6.1.2.tar.xz
+
+# Locally calculated
+sha256	a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c	COPYING.LESSERv3
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYINGv2
