From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 08:19:26 +0200
Subject: [Buildroot] [git commit] package/xz: fix whitespace
Message-ID: <20190411061517.A5DBA813F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b25a4fbae048ced2dade6e567b783baab1752cad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A strange unicode character was used instead of a standard white space

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xz/xz.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 6d4e2a69d9..69d1db2f4d 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
 sha256 3313fd2a95f43d88e44264e6b015e7d03053e681860b0d5d3f9baca79c57b7bf  xz-5.2.4.tar.bz2
 
-#??Hash for license files
+# Hash for license files
 sha256 bcb02973ef6e87ea73d331b3a80df7748407f17efdb784b61b47e0e610d3bb5c  COPYING
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPLv3
