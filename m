From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:56:34 +0200
Subject: [Buildroot] [git commit] package/libucl: add .hash file
Message-ID: <20160618205843.B99BF7FCE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f6e927ce3d99e6919f40bb9bb62fdb819756d54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the libucl tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libucl/libucl.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libucl/libucl.hash b/package/libucl/libucl.hash
new file mode 100644
index 0000000..bd2ca13
--- /dev/null
+++ b/package/libucl/libucl.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 2f69995c7f8320350f56c1183c395cc4a2a958331f22d60b7839a117c9c601e1  libucl-0.7.3.tar.gz
