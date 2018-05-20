From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 10:44:52 +0200
Subject: [Buildroot] [PATCH 1/1] libnfc: add hash for license file
Message-ID: <20180520084452.9227-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnfc/libnfc.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libnfc/libnfc.hash b/package/libnfc/libnfc.hash
index 307e04929a..32decf2d03 100644
--- a/package/libnfc/libnfc.hash
+++ b/package/libnfc/libnfc.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256 945e74d8e27683f9b8a6f6e529557b305d120df347a960a6a7ead6cb388f4072  libnfc-1.7.1.tar.bz2
+sha256 9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING
-- 
2.14.1
