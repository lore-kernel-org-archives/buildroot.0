From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Nov 2020 10:47:58 +0100
Subject: [Buildroot] [git commit] package/jpeg-turbo: fix license hash
Message-ID: <20201118093547.480BC842A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9ca2a596e5737cb4e67644d719b45dfec396593
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 105d61c85062b18bc9555011f909c8c8a5a33277 forgot to update hash of
LICENSE.md (update in year:
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/00607ec260efa4cfe10f9b36d6e3d3590ae92d79)

While at it, also update indentation in hash file (two spaces)

Fixes:
 - http://autobuild.buildroot.org/results/66fb5c0171af73d4c1c93241b285fac8f8f494f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg-turbo/jpeg-turbo.hash | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index abf129bd93..c4d4a0274f 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/libjpeg-turbo/files/2.0.5/
-sha1 9d4c565d402b2f5661be78d76098073ec7e30f10  libjpeg-turbo-2.0.5.tar.gz
-md5  3a7dc293918775fc933f81e2bce36464 libjpeg-turbo-2.0.5.tar.gz
+sha1  9d4c565d402b2f5661be78d76098073ec7e30f10  libjpeg-turbo-2.0.5.tar.gz
+md5  3a7dc293918775fc933f81e2bce36464  libjpeg-turbo-2.0.5.tar.gz
 # Locally computed
-sha256 16f8f6f2715b3a38ab562a84357c793dd56ae9899ce130563c72cd93d8357b5d  libjpeg-turbo-2.0.5.tar.gz
-sha256 69e570a251515ced17d4492256d57c89db77ed949652f88a44c80c1ca9607920  LICENSE.md
-sha256 82fece2bff2669c476495f0fe70096b154e8bc5b40916a64e99836d9a01c3110  README.ijg
+sha256  16f8f6f2715b3a38ab562a84357c793dd56ae9899ce130563c72cd93d8357b5d  libjpeg-turbo-2.0.5.tar.gz
+sha256  0b7a24c3906d26dfbe24e96e9415549b387c3227140dc6b7ab2fb924254e37a1  LICENSE.md
+sha256  82fece2bff2669c476495f0fe70096b154e8bc5b40916a64e99836d9a01c3110  README.ijg
