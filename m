From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 16 Oct 2020 06:04:52 +0200
Subject: [Buildroot] [PATCH] mksh: update to R59b
Message-ID: <20201016040452.iiotvlpqpfisgycp@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/mksh/mksh.hash | 2 +-
 package/mksh/mksh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mksh/mksh.hash b/package/mksh/mksh.hash
index 4e71a42634..61a3acdc12 100644
--- a/package/mksh/mksh.hash
+++ b/package/mksh/mksh.hash
@@ -1,4 +1,4 @@
 # From http://www.mirbsd.org/mksh.htm#build
-sha256  3d101154182d52ae54ef26e1360c95bc89c929d28859d378cc1c84f3439dbe75  mksh-R57.tgz
+sha256  907ed1a9586e7f18bdefdd4a763aaa8397b755e15034aa54f4d753bfb272e0e6  mksh-R59b.tgz
 # Locally computed
 sha256  4655d87a53a703ead36a52f166f065c23cf58dd02d7b14abd2474f9f49383a16  mksh.1
diff --git a/package/mksh/mksh.mk b/package/mksh/mksh.mk
index 2aa8f70ff9..05ddc3f4c9 100644
--- a/package/mksh/mksh.mk
+++ b/package/mksh/mksh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MKSH_VERSION = 57
+MKSH_VERSION = 59b
 MKSH_SOURCE = mksh-R$(MKSH_VERSION).tgz
 MKSH_SITE = https://www.mirbsd.org/MirOS/dist/mir/mksh
 # For MirOS License see https://www.mirbsd.org/TaC-mksh.txt
-- 
2.11.0
