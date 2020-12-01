From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Dec 2020 23:41:34 +0100
Subject: [Buildroot] [git commit] package/mksh: update to 59c
Message-ID: <20201203092229.AD3B6811FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c26200cb9ad56564d3f0f832aad0cd274c9a330
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
