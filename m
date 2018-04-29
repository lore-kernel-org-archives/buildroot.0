From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 16:54:46 +0200
Subject: [Buildroot] [PATCH 1/1] libee: add hash for license file
Message-ID: <20180429145446.4625-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libee/libee.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libee/libee.hash b/package/libee/libee.hash
index b70242aa29..5ad47e162c 100644
--- a/package/libee/libee.hash
+++ b/package/libee/libee.hash
@@ -1,2 +1,5 @@
 # From http://www.libee.org/download/libee-0-4-1/
 md5	7bbf4160876c12db6193c06e2badedb2	libee-0.4.1.tar.gz
+
+# Hash for license file:
+sha256	275fecbf835387e042ba96884f0f05356a485a6ea8449b2c5295cc11652ad439	COPYING
-- 
2.14.1
