From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  4 Dec 2016 21:58:44 +0100
Subject: [Buildroot] [PATCH 1/3] package/aubio: add upstream hash link
Message-ID: <1480885126-517-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul Brossier, the aubio maintainer, added a sha256 hash for the
Buildroot package. Thanks !

https://github.com/aubio/aubio/issues/77

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/aubio/aubio.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/aubio/aubio.hash b/package/aubio/aubio.hash
index f4de92a..e447847 100644
--- a/package/aubio/aubio.hash
+++ b/package/aubio/aubio.hash
@@ -1,2 +1,2 @@
-# Locally computed
+# From https://aubio.org/pub/aubio-0.4.3.tar.bz2.sha256
 sha256 b62cdb073c0c64ae301917fa162969d42cba45e478bdf1e74490bd87e9cceaab  aubio-0.4.3.tar.bz2
-- 
2.5.5
