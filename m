From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 16:37:59 +0200
Subject: [Buildroot] [PATCH 1/1] libpciaccess: add hash for license file
Message-ID: <20180520143759.15003-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpciaccess/libpciaccess.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libpciaccess/libpciaccess.hash b/package/libpciaccess/libpciaccess.hash
index b73c27c290..651f0462b7 100644
--- a/package/libpciaccess/libpciaccess.hash
+++ b/package/libpciaccess/libpciaccess.hash
@@ -3,3 +3,6 @@ md5 8f436e151d5106a9cfaa71857a066d33  libpciaccess-0.14.tar.bz2
 sha1 f70a958bf4e744cb4ee93be64e9bc52ac05cdaeb  libpciaccess-0.14.tar.bz2
 sha256 3df543e12afd41fea8eac817e48cbfde5aed8817b81670a4e9e493bb2f5bf2a4  libpciaccess-0.14.tar.bz2
 sha512 bf40214dfd22f2a223f7c948566e6eaa4bfed60116e71b3eb19f6fe7ab2c4546649eb0416c06d5983e476ea5e27de036936646eb5f800ea97763b6d1f1976f4b  libpciaccess-0.14.tar.bz2
+
+# Hash for license file:
+sha256 47012fd746980d1712ac4f3841ab6164bda1d2b84880760e45dbe1e1dc07f608  COPYING
-- 
2.14.1
