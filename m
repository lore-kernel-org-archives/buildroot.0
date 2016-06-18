From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:57:14 +0200
Subject: [Buildroot] [git commit] package/ljsyscall: add .hash file
Message-ID: <20160618205843.D87CF7FCE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e36d9a2fa7b9d2aa3aea92fba414de5b9b537407
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the ljsyscall tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ljsyscall/ljsyscall.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ljsyscall/ljsyscall.hash b/package/ljsyscall/ljsyscall.hash
new file mode 100644
index 0000000..2d67907
--- /dev/null
+++ b/package/ljsyscall/ljsyscall.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 9b5ba2b5798c5bc33aa2158f3b44f730de12497c195764aa1bc3d3f1244df198  ljsyscall-v0.10.tar.gz
