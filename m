From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 22:26:26 +0200
Subject: [Buildroot] [git commit branch/next] lrandom: add hash file
Message-ID: <20150808105643.6B2127FD83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d13b1d66e47b524d1bba35f6a2ca19fd6b47db15
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lrandom/lrandom.hash |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/lrandom/lrandom.hash b/package/lrandom/lrandom.hash
new file mode 100644
index 0000000..3f60133
--- /dev/null
+++ b/package/lrandom/lrandom.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	96fbc56beb0efca20253301915e14ba25150e2b09541ea7a3570e0def624b196  lrandom-20120430.51-1.src.rock
+sha256	480a6cf11caaba99290ff30cd6e854ac9dce61e38b9d9caf5498165f7fb93454  lrandom-20120430.52-1.src.rock
