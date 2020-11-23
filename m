From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 23 Nov 2020 17:30:35 +0100
Subject: [Buildroot] [PATCH] mksh: update to 59c
Message-ID: <20201123163035.GA29492@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/mksh/mksh.hash | 4 ++--
 package/mksh/mksh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mksh/mksh.hash b/package/mksh/mksh.hash
index 7fc34fa3e3..d81deccb39 100644
--- a/package/mksh/mksh.hash
+++ b/package/mksh/mksh.hash
@@ -1,4 +1,4 @@
 # From http://www.mirbsd.org/mksh.htm#build
-sha256  907ed1a9586e7f18bdefdd4a763aaa8397b755e15034aa54f4d753bfb272e0e6  mksh-R59b.tgz
+sha256  77ae1665a337f1c48c61d6b961db3e52119b38e58884d1c89684af31f87bc506  mksh-R59c.tgz
 # Locally computed
-sha256  fb1e64c95ded58058c7f0cf5269236bc83c3cbda089cbb025b03e08f189bf47e  mksh.1
+sha256  abf44a61ec777c98f8ae7e08e4fe25fe258e0c470215e2eeb22816f6bae72c80  mksh.1
diff --git a/package/mksh/mksh.mk b/package/mksh/mksh.mk
index 05ddc3f4c9..386b1bd016 100644
--- a/package/mksh/mksh.mk
+++ b/package/mksh/mksh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MKSH_VERSION = 59b
+MKSH_VERSION = 59c
 MKSH_SOURCE = mksh-R$(MKSH_VERSION).tgz
 MKSH_SITE = https://www.mirbsd.org/MirOS/dist/mir/mksh
 # For MirOS License see https://www.mirbsd.org/TaC-mksh.txt
-- 
2.20.1
