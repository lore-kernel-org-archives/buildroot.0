From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:49:32 +0200
Subject: [Buildroot] [git commit] package/civetweb: add .hash file
Message-ID: <20160618205842.9EEC87F98D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a9b918ebda2daba47b91c8335af49f70b9b8f55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the civetweb tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/civetweb/civetweb.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/civetweb/civetweb.hash b/package/civetweb/civetweb.hash
new file mode 100644
index 0000000..745f4a8
--- /dev/null
+++ b/package/civetweb/civetweb.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 79a852a26068eb6d2f8de5ee72e021f0d2c8bd176eb81f41909a876b736815d9  civetweb-v1.5.tar.gz
