From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2019 08:59:00 +0100
Subject: [Buildroot] [git commit] package/libscrypt: add hash for license
 file
Message-ID: <20191215075136.B45288B4D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ebf93b4f946d2e55749963f87f095b480584615
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libscrypt/libscrypt.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libscrypt/libscrypt.hash b/package/libscrypt/libscrypt.hash
index 4e35489492..fda63d1c0d 100644
--- a/package/libscrypt/libscrypt.hash
+++ b/package/libscrypt/libscrypt.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	68e377e79745c10d489b759b970e52d819dbb80dd8ca61f8c975185df3f457d3	libscrypt-1.21.tar.gz
+sha256	aacbfd9e19e5b38ea09616cebf0751ef0cc7b6a19ea0fd78f4b0598b2c503394	LICENSE
