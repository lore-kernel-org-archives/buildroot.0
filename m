From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 23:32:06 +0100
Subject: [Buildroot] [git commit] package/mksh: update to version 57
Message-ID: <20200106222235.9554F82AC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40a992a1107ee8fe79c5cf7628be6c5789218b1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mksh/mksh.hash | 4 +---
 package/mksh/mksh.mk   | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/mksh/mksh.hash b/package/mksh/mksh.hash
index 411baa8624..872d042cab 100644
--- a/package/mksh/mksh.hash
+++ b/package/mksh/mksh.hash
@@ -1,4 +1,2 @@
 # From http://www.mirbsd.org/mksh.htm#build
-md5 718c44251b52c48e7312903273e263f4  mksh-R55.tgz
-# Calculated based on the hash above
-sha256 ced42cb4a181d97d52d98009eed753bd553f7c34e6991d404f9a8dcb45c35a57  mksh-R55.tgz
+sha256 3d101154182d52ae54ef26e1360c95bc89c929d28859d378cc1c84f3439dbe75  mksh-R57.tgz
diff --git a/package/mksh/mksh.mk b/package/mksh/mksh.mk
index 3347dd66cb..2aa8f70ff9 100644
--- a/package/mksh/mksh.mk
+++ b/package/mksh/mksh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MKSH_VERSION = 55
+MKSH_VERSION = 57
 MKSH_SOURCE = mksh-R$(MKSH_VERSION).tgz
 MKSH_SITE = https://www.mirbsd.org/MirOS/dist/mir/mksh
 # For MirOS License see https://www.mirbsd.org/TaC-mksh.txt
