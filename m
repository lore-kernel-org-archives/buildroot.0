From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:43:21 +0100
Subject: [Buildroot] [PATCH 31/32] package/y*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-32-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/yaffs2utils/yaffs2utils.hash | 1 +
 package/yajl/yajl.hash               | 3 ++-
 package/yasm/yasm.hash               | 7 ++++++-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/yaffs2utils/yaffs2utils.hash b/package/yaffs2utils/yaffs2utils.hash
index 4e5846e065..547b55c540 100644
--- a/package/yaffs2utils/yaffs2utils.hash
+++ b/package/yaffs2utils/yaffs2utils.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  9b0912bf683eb839b6e57c9255c83894c3b700d16489a49d319c54c1abf8f6d7  0.2.9.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/yajl/yajl.hash b/package/yajl/yajl.hash
index ed4a0502fe..47b0986cd3 100644
--- a/package/yajl/yajl.hash
+++ b/package/yajl/yajl.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	3fb73364a5a30efe615046d07e6db9d09fd2b41c763c5f7d3bfb121cd5c5ac5a  yajl-2.1.0.tar.gz
+sha256  3fb73364a5a30efe615046d07e6db9d09fd2b41c763c5f7d3bfb121cd5c5ac5a  yajl-2.1.0.tar.gz
+sha256  054bf2c11686c5442850b1da58ad592e3d1d2a236a362e67279b957f8e662f5a  COPYING
diff --git a/package/yasm/yasm.hash b/package/yasm/yasm.hash
index 016c15b90a..c343d32d03 100644
--- a/package/yasm/yasm.hash
+++ b/package/yasm/yasm.hash
@@ -1,2 +1,7 @@
 # Locally computed:
-sha256	3dce6601b495f5b3d45b59f7d2492a340ee7e84b5beca17e48f862502bd5603f	yasm-1.3.0.tar.gz
+sha256  3dce6601b495f5b3d45b59f7d2492a340ee7e84b5beca17e48f862502bd5603f  yasm-1.3.0.tar.gz
+sha256  795f8d76eade6130129b680ac72ea81cb3e143467a65ea1f5f64946151d7fa20  COPYING
+sha256  a84b45f23040624681ca6974ff48d8ef6b477a1cb51e4a1c842e49d00c231e0d  BSD.txt
+sha256  b7fd9b73ea99602016a326e0b62e6646060d18febdd065ceca8bb482208c3d88  Artistic.txt
+sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  GNU_GPL-2.0
+sha256  1faefae1fe8838a2e48864df7d1376e421a50c551c5ae2f60c9f2093206e18a9  GNU_LGPL-2.0
-- 
2.20.1
