From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 14:10:48 +0100
Subject: [Buildroot] [git commit] package/open2300: add hash file
Message-ID: <20191222130148.901BE8D5A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=988de63be3ada9ed428fcc60750bc7114fd9c0fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add sha245 hashes for the source taball and the license file.

Note: the upstream subversion tree for open2300 is off-line (and the
package is no longer maintained), so the tarball is retrieved from
sources.buildroot.org, which makes it a stable (reproducible) tarball,
when our svn backend is in fact not stable.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998 at free.fr:
  - add the comment in the .hash file
  - update the commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/open2300/open2300.hash | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/open2300/open2300.hash b/package/open2300/open2300.hash
new file mode 100644
index 0000000000..414041b923
--- /dev/null
+++ b/package/open2300/open2300.hash
@@ -0,0 +1,6 @@
+# Localy computed
+# Note: open2300's upstream svn tree is off-line, so this tarball is
+# served from s.b.o. instead, which actually makes it stable.
+sha256	f4239d2f16d52156586d06be38f06a3eb58168377e243a8de8720b66e33ddb8f  open2300-12.tar.gz
+
+sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
