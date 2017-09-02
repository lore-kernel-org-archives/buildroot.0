From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 02 Sep 2017 13:13:47 -0000
Subject: [Buildroot] [git commit] package/mksh: bump version to R55
Message-ID: <20170902130616.BD185818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9aca89e35f61318fb6e651b1b2187feb230ffb67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mksh/mksh.hash | 4 ++--
 package/mksh/mksh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mksh/mksh.hash b/package/mksh/mksh.hash
index e92acd9..411baa8 100644
--- a/package/mksh/mksh.hash
+++ b/package/mksh/mksh.hash
@@ -1,4 +1,4 @@
 # From http://www.mirbsd.org/mksh.htm#build
-md5	be0a6fb93b4a5f927bcc1893bb6692f8	mksh-R54.tgz
+md5 718c44251b52c48e7312903273e263f4  mksh-R55.tgz
 # Calculated based on the hash above
-sha256	8bce3837c386684aa7780f085f1a4dbd5e3e26fb5c528ee0d41ae29af7f39013	mksh-R54.tgz
+sha256 ced42cb4a181d97d52d98009eed753bd553f7c34e6991d404f9a8dcb45c35a57  mksh-R55.tgz
diff --git a/package/mksh/mksh.mk b/package/mksh/mksh.mk
index 4d91bfc..b5706db 100644
--- a/package/mksh/mksh.mk
+++ b/package/mksh/mksh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MKSH_VERSION = R54
+MKSH_VERSION = R55
 MKSH_SOURCE = mksh-$(MKSH_VERSION).tgz
 MKSH_SITE = https://www.mirbsd.org/MirOS/dist/mir/mksh
 # For MirOS License see https://www.mirbsd.org/TaC-mksh.txt
