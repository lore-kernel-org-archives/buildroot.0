From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 21:54:30 +0100
Subject: [Buildroot] [git commit] mksh: update to R54
Message-ID: <20161204205440.5FF1380E57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a982b45ca6c4f8ae9722c9bd1ac3a99a9647f5a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mksh/mksh.hash | 4 ++--
 package/mksh/mksh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mksh/mksh.hash b/package/mksh/mksh.hash
index d95001c..e92acd9 100644
--- a/package/mksh/mksh.hash
+++ b/package/mksh/mksh.hash
@@ -1,4 +1,4 @@
 # From http://www.mirbsd.org/mksh.htm#build
-md5	43fc3e32963cc1795a299bcec531d770	mksh-R53a.tgz
+md5	be0a6fb93b4a5f927bcc1893bb6692f8	mksh-R54.tgz
 # Calculated based on the hash above
-sha256	3bb2453c8cb65abbda24f9bdd8b8371e30a6e1c2f7a0d5474a3efae438639635	mksh-R53a.tgz
+sha256	8bce3837c386684aa7780f085f1a4dbd5e3e26fb5c528ee0d41ae29af7f39013	mksh-R54.tgz
diff --git a/package/mksh/mksh.mk b/package/mksh/mksh.mk
index 248b43f..4d91bfc 100644
--- a/package/mksh/mksh.mk
+++ b/package/mksh/mksh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MKSH_VERSION = R53a
+MKSH_VERSION = R54
 MKSH_SOURCE = mksh-$(MKSH_VERSION).tgz
 MKSH_SITE = https://www.mirbsd.org/MirOS/dist/mir/mksh
 # For MirOS License see https://www.mirbsd.org/TaC-mksh.txt
