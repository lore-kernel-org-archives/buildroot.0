From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:54:27 +0200
Subject: [Buildroot] [git commit] package/snappy: add .hash file
Message-ID: <20160618205843.662B47FCE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f928ec3f76561f4fa6abdc50f8c45c39d7ecc1cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the snappy tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snappy/snappy.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/snappy/snappy.hash b/package/snappy/snappy.hash
new file mode 100644
index 0000000..fc979ae
--- /dev/null
+++ b/package/snappy/snappy.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 d64e434e2ddfe9ae942708747003d489e27f2bfddaa5e9e070da98cb00f660f2  snappy-1ff9be9b8fafc8528ca9e055646f5932aa5db9c4.tar.gz
