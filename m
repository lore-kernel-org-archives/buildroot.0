From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 17:20:34 +0200
Subject: [Buildroot] [PATCH 1/1] libexif: add hash for license file
Message-ID: <20180429152034.12719-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libexif/libexif.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libexif/libexif.hash b/package/libexif/libexif.hash
index cf1b4d7c45..aa9fcc8d89 100644
--- a/package/libexif/libexif.hash
+++ b/package/libexif/libexif.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  16cdaeb62eb3e6dfab2435f7d7bccd2f37438d21c5218ec4e58efa9157d4d41a  libexif-0.6.21.tar.bz2
+sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
-- 
2.14.1
