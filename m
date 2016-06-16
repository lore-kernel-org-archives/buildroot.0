From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 22:40:39 +0200
Subject: [Buildroot] [git commit] libdri2: add .hash file
Message-ID: <20160616204147.B166281E96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e91093b132e1e30ce5198f5551f34bdf7ef12837
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/be2/be2d170dd74f6839fc15b625ee7a24acc74116f6/
http://autobuild.buildroot.org/results/98f/98f9efc226743100ac0411d797bbc59f42f345d0/

Similar to jquery-keyboard, it seems the libdri2 tarball on the autobuilder
is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdri2/libdri2.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libdri2/libdri2.hash b/package/libdri2/libdri2.hash
new file mode 100644
index 0000000..03a37ad
--- /dev/null
+++ b/package/libdri2/libdri2.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 7c427f5c3fbda3d1df1dc77129e87605f4af1f3ad2adf2653c560d1703aa4395  libdri2-4f1eef3183df2b270c3d5cbef07343ee5127a6a4.tar.gz
