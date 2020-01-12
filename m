From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2020 09:51:11 +0100
Subject: [Buildroot] [git commit] package/scons: fix hash of license file
Message-ID: <20200112084140.28A158B447@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bb074ab4f55ee985dcdebdaaa3d376f3ea81bde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d4716b1e33057f9fc016debc4d35e2cad198a068 forgot to update hash of
license file. This file was updated with a "MIT License" line:
https://github.com/SCons/scons/commit/3243305c08dd93b16ae0024780a38ad51dacd5e1

Fixes:
 - http://autobuild.buildroot.org/results/43547a6015cbd0db7a9e8e7bbe7c60029db20511

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/scons/scons.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/scons/scons.hash b/package/scons/scons.hash
index bbeda86b11..a72fbaee5a 100644
--- a/package/scons/scons.hash
+++ b/package/scons/scons.hash
@@ -1,3 +1,3 @@
 # Locally computed:
 sha256  7801f3f62f654528e272df780be10c0e9337e897650b62ddcee9f39fde13f8fb  scons-3.1.2.tar.gz
-sha256  c4248451b6a4cd09870de4fb82a857feb9f98174167b07500c19ed0263fd4db7  LICENSE.txt
+sha256  72ed889165fb28378cadac14552be4a959f1ebab6b148abb5dd2b49712c3c6f6  LICENSE.txt
