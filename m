From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  2 May 2018 18:28:47 +0200
Subject: [Buildroot] [PATCH 1/1] libjson: add hash for license file
Message-ID: <20180502162847.10490-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libjson/libjson.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libjson/libjson.hash b/package/libjson/libjson.hash
index f3447ee73d..3d9b26a53d 100644
--- a/package/libjson/libjson.hash
+++ b/package/libjson/libjson.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  07267a3951038ee2e02d26cc41bf8e275668c38f751240d3e78dc979182e7376  libjson_7.6.1.zip
+sha256  bd62d605bef39ab7ae39f6fa333ba513edb93cfcd56c9c966f1d34e31ff7c69b  License.txt
-- 
2.14.1
