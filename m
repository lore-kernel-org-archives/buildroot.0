From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 23:13:45 +0200
Subject: [Buildroot] [git commit] package/opencv3: add .hash file
Message-ID: <20160618211721.87A1C805E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76acaafd41135ba8b051548d643d290834cb1383
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the opencv3 tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv3/opencv3.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
new file mode 100644
index 0000000..20859ea
--- /dev/null
+++ b/package/opencv3/opencv3.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 f00b3c4f42acda07d89031a2ebb5ebe390764a133502c03a511f67b78bbd4fbf  opencv3-3.1.0.tar.gz
