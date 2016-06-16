From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 08:54:03 +0200
Subject: [Buildroot] [git commit] fcgiwrap: add .hash file
Message-ID: <20160616065506.B53C980745@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e19e6d98f463e6a7b4077c83a21eb44cbaa7752
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/b62/b6200a14da6445eb68915d52211035e326ec82f0/

Similar to jquery-keyboard, it seems the fcgiwrap tarball on the autobuilder
is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fcgiwrap/fcgiwrap.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fcgiwrap/fcgiwrap.hash b/package/fcgiwrap/fcgiwrap.hash
new file mode 100644
index 0000000..510e1ff
--- /dev/null
+++ b/package/fcgiwrap/fcgiwrap.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 4c7de0db2634c38297d5fcef61ab4a3e21856dd7247d49c33d9b19542bd1c61f  fcgiwrap-1.1.0.tar.gz
