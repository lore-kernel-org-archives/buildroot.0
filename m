From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 23:06:43 +0200
Subject: [Buildroot] [git commit] package/mrouted: add .hash file
Message-ID: <20160618211721.3F597805E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2d163a160dd7efc4c40a46dd533e11f61c5b591
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the mrouted tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mrouted/mrouted.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mrouted/mrouted.hash b/package/mrouted/mrouted.hash
new file mode 100644
index 0000000..d5069e5
--- /dev/null
+++ b/package/mrouted/mrouted.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 181908f7025c5a2dee2e50d86888780469eaa9e1bd42d3eca9dfed8274aecd3d  mrouted-3.9.7.tar.gz
