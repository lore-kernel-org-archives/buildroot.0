From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 19:32:26 +0200
Subject: [Buildroot] [PATCH 04/11] package/mtdev2tuio: add .hash file
In-Reply-To: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
References: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466271153-18961-4-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the mtdev2tuio tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/mtdev2tuio/mtdev2tuio.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/mtdev2tuio/mtdev2tuio.hash

diff --git a/package/mtdev2tuio/mtdev2tuio.hash b/package/mtdev2tuio/mtdev2tuio.hash
new file mode 100644
index 0000000..b0d159c
--- /dev/null
+++ b/package/mtdev2tuio/mtdev2tuio.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 4a6aa319c44478dceaf01a24603690767e56c029a1f0380da0f31eac5a02e10f  mtdev2tuio-e1e7378d86abe751158e743586133022f32fa4d1.tar.gz
-- 
2.5.5
