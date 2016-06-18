From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:54:49 +0200
Subject: [Buildroot] [git commit] package/libndp: add .hash file
Message-ID: <20160618205843.796787FCE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c8ed53d886596e8a54a22e586b0e6e48ed837f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the libndp tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libndp/libndp.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libndp/libndp.hash b/package/libndp/libndp.hash
new file mode 100644
index 0000000..51e312d
--- /dev/null
+++ b/package/libndp/libndp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 42c0a8938d4302c72a42e2d954deef7e4903bb3974da6804a929a3cd0b5b6aa7  libndp-v1.5.tar.gz
