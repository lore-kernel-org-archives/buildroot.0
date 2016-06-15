From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 22:56:19 +0200
Subject: [Buildroot] [git commit] dawgdic: add .hash file
Message-ID: <20160615205732.2550C819A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0044cf60e8d93501ff269b7c1f442a5ae54fd3b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/66b/66b2989c9441f7fab446d2cc60f047fbed954f25/
http://autobuild.buildroot.org/results/fd6/fd69070ad15792d5a2eea62da6bf22cef78d6f30/

Similar to jquery-keyboard, it seems the dawdgic tarball on the autobuilder
is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dawgdic/dawgdic.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dawgdic/dawgdic.hash b/package/dawgdic/dawgdic.hash
new file mode 100644
index 0000000..da03f0b
--- /dev/null
+++ b/package/dawgdic/dawgdic.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 54622a3e79ff3ad2c01a830ec52b997b42ead468b18af5acebab3a4ff32a5ad6  dawgdic-16ac537ba9883ff01b63b6d1fdc3072150c68fee.tar.gz
