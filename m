From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:55:13 +0200
Subject: [Buildroot] [git commit] package/libopenh264: add .hash file
Message-ID: <20160618205843.884617FCE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ccfcd4f3e7dc73a4cc39fbc53029a6570e532e7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the libopenh264 tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenh264/libopenh264.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libopenh264/libopenh264.hash b/package/libopenh264/libopenh264.hash
new file mode 100644
index 0000000..cb87188
--- /dev/null
+++ b/package/libopenh264/libopenh264.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 a1b9a7a7f1ee204793c613789a505f0971bc2b03b3dbd8f05d9c4a3f3b900a22  libopenh264-v1.4.0.tar.gz
