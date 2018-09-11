From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Sep 2018 10:19:15 +0200
Subject: [Buildroot] [git commit] python-numpy: correct LICENSE.txt hash
 value
Message-ID: <20180911081818.6DDF083D78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a73fca22bda82fc849ce8cfaf3f76288eefa47b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE.txt sha256 is wrong. After version bumping from 1.13.3 to 1.15.1
LICENSE.txt sha256 has not be re-calculated.

New LICENSE.txt lists licenses for bundled libraries:
- Numpydoc -> 2-clause BSD
- scipy-sphinx-theme -> 3-clause BSD, PSF and Apache 2.0
- lapack-lite -> 3-clause BSD
- tempita -> BSD derived
- dragon4 -> specific to library, need to refer to dragon4.c file

Update sha256 recalculating it locally.

Fixes:
http://autobuild.buildroot.net/results/08e/08e1121af151c65b2333e06839256eb13f4ad800//
http://autobuild.buildroot.net/results/9d0/9d0e557c5946b76aa4c8c87b7616433c16b61e20//

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-numpy/python-numpy.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index 055eb29f6f..7c7f446118 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,4 +1,4 @@
 # Copied from https://github.com/numpy/numpy/releases/tag/v1.15.1
 sha256	3c1ccce5d935ef8df16ae0595b459ef08a5cdb05aee195ebc04b9d89a72be7fa	numpy-1.15.1.tar.gz
 # License files, locally calculated
-sha256	94eebc7c8f86a287c1e9146ed52ebcde88183806d848d8c66e0e52d1aebf3b13	LICENSE.txt
+sha256	9e85ee1c3f11444243c9b7667721592a01f1cd90cb28ad937ac99f6241d6b685	LICENSE.txt
