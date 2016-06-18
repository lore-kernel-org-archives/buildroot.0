From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 23:14:36 +0200
Subject: [Buildroot] [git commit] package/pifmrds: add .hash file
Message-ID: <20160618211721.9747E805E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c75b304ef6df684f9aee20dbc9c378d492ef857c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the pifmrds tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pifmrds/pifmrds.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pifmrds/pifmrds.hash b/package/pifmrds/pifmrds.hash
new file mode 100644
index 0000000..0c91d3d
--- /dev/null
+++ b/package/pifmrds/pifmrds.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 2afc9f3c9fc206ba32865d7dd77f3a97d7d86dcfc9b44eeb5665e8fddaafcf44  pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2.tar.gz
