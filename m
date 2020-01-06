From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Mon,  6 Jan 2020 11:20:42 +0100
Subject: [Buildroot] [PATCH] package/mksh: update to version 57
Message-ID: <20200106102042.12392-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Pascal de Bruijn <pmjdebruijn@pcode.nl>

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/mksh/mksh.hash | 4 +---
 package/mksh/mksh.mk   | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/mksh/mksh.hash b/package/mksh/mksh.hash
index 411baa8..872d042 100644
--- a/package/mksh/mksh.hash
+++ b/package/mksh/mksh.hash
@@ -1,4 +1,2 @@
 # From http://www.mirbsd.org/mksh.htm#build
-md5 718c44251b52c48e7312903273e263f4  mksh-R55.tgz
-# Calculated based on the hash above
-sha256 ced42cb4a181d97d52d98009eed753bd553f7c34e6991d404f9a8dcb45c35a57  mksh-R55.tgz
+sha256 3d101154182d52ae54ef26e1360c95bc89c929d28859d378cc1c84f3439dbe75  mksh-R57.tgz
diff --git a/package/mksh/mksh.mk b/package/mksh/mksh.mk
index 3347dd6..2aa8f70 100644
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
-- 
2.7.4
