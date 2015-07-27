From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 22:29:51 +0200
Subject: [Buildroot] [git commit] luasec: add hash file
Message-ID: <20150727203134.D76037FA29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c9894e2e4156dfd7423b4a76979716fe87fe352
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luasec/luasec.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/luasec/luasec.hash b/package/luasec/luasec.hash
new file mode 100644
index 0000000..1e9f70a
--- /dev/null
+++ b/package/luasec/luasec.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	d2198cc39b3fa55bd5020046742b34093b6efcb619cf4032948b8c8556202a32  luasec-0.5-2.src.rock
