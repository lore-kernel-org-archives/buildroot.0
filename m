From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 5 Nov 2017 17:45:08 +0100
Subject: [Buildroot] [git commit] package/zlib: add license hash
Message-ID: <20171105163754.070087FF69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cf490f81844cb58196d66d003e18abdbfe4cff1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/zlib/zlib.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/zlib/zlib.hash b/package/zlib/zlib.hash
index 81cb64e..e3736b1 100644
--- a/package/zlib/zlib.hash
+++ b/package/zlib/zlib.hash
@@ -1,2 +1,4 @@
 # From http://www.zlib.net/
 sha256 4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066  zlib-1.2.11.tar.xz
+# License files, locally calculated
+sha256 7960b6b1cc63e619abb77acaea5427159605afee8c8b362664f4effc7d7f7d15  README
