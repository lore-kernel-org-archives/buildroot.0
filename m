From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 23:06:03 +0200
Subject: [Buildroot] [git commit] package/mraa: add .hash file
Message-ID: <20160618211721.25BAA805E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=739b5908f0c6e4d1d21ccea0d0824abc14e0f9a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the mraa tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mraa/mraa.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mraa/mraa.hash b/package/mraa/mraa.hash
new file mode 100644
index 0000000..cbd70a4
--- /dev/null
+++ b/package/mraa/mraa.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 e4501e6936afb426c75b7d406c1a7a27b514297f640e887de4d88a2d9687f37b  mraa-v0.9.1.tar.gz
