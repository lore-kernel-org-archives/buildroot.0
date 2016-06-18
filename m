From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:18 +0200
Subject: [Buildroot] [PATCH 18/19] package/ljsyscall: add .hash file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466268199-5417-18-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the ljsyscall tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/ljsyscall/ljsyscall.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ljsyscall/ljsyscall.hash

diff --git a/package/ljsyscall/ljsyscall.hash b/package/ljsyscall/ljsyscall.hash
new file mode 100644
index 0000000..2d67907
--- /dev/null
+++ b/package/ljsyscall/ljsyscall.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 9b5ba2b5798c5bc33aa2158f3b44f730de12497c195764aa1bc3d3f1244df198  ljsyscall-v0.10.tar.gz
-- 
2.5.5
