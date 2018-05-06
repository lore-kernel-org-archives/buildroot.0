From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 May 2018 09:01:50 +0200
Subject: [Buildroot] [git commit] libmcrypt: add hash for license file
Message-ID: <20180506071548.128168641C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4f7d233390e10841eb18a9ef98a8b7cac5cf7f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmcrypt/libmcrypt.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmcrypt/libmcrypt.hash b/package/libmcrypt/libmcrypt.hash
index d0d3a9c977..30b57522b8 100644
--- a/package/libmcrypt/libmcrypt.hash
+++ b/package/libmcrypt/libmcrypt.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  e4eb6c074bbab168ac47b947c195ff8cef9d51a211cdd18ca9c9ef34d27a373e  libmcrypt-2.5.8.tar.gz
+sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
