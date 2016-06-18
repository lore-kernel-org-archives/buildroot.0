From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 23:07:37 +0200
Subject: [Buildroot] [git commit] package/mtdev2tuio: add .hash file
Message-ID: <20160618211721.546F281963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9aa977a9aad330f4687c5fc71113923f0d9a2208
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the mtdev2tuio tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtdev2tuio/mtdev2tuio.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mtdev2tuio/mtdev2tuio.hash b/package/mtdev2tuio/mtdev2tuio.hash
new file mode 100644
index 0000000..b0d159c
--- /dev/null
+++ b/package/mtdev2tuio/mtdev2tuio.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 4a6aa319c44478dceaf01a24603690767e56c029a1f0380da0f31eac5a02e10f  mtdev2tuio-e1e7378d86abe751158e743586133022f32fa4d1.tar.gz
