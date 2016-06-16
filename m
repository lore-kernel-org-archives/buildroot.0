From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 22:42:32 +0200
Subject: [Buildroot] [git commit] package/bullet: add .hash file
Message-ID: <20160616204324.BB2EA81D49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2a53e7bb1fad6be6964687b4d704e85c180b1d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the bullet tarball on the autobuilder
is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Fixes:
http://autobuild.buildroot.net/results/39b/39bb344e3631e5f8872336cef981db5c6ec382c1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bullet/bullet.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bullet/bullet.hash b/package/bullet/bullet.hash
new file mode 100644
index 0000000..5b5360c
--- /dev/null
+++ b/package/bullet/bullet.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 c26ac96b487d7e44136ff4406dbbfe5a4d7d254ed1a2c09122c464803e7d1314  bullet-19f999ac087e68ffc2551ffb73e35e60271a0d27.tar.gz
