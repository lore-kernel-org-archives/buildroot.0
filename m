From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 23:15:18 +0200
Subject: [Buildroot] [git commit] package/qlibc: add .hash file
Message-ID: <20160618211721.D4B9681963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34c2a65191210dd877a72d54ac76cdbd1130e0b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the qlibc tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qlibc/qlibc.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qlibc/qlibc.hash b/package/qlibc/qlibc.hash
new file mode 100644
index 0000000..6b8e4d8
--- /dev/null
+++ b/package/qlibc/qlibc.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 1f9aa5eefd28c45d409130a35104816d41405da64fe900f70a1c41150891501a  qlibc-v2.4.1.tar.gz
