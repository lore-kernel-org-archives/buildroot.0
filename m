From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  2 Dec 2017 17:03:46 +0100
Subject: [Buildroot] [PATCH 1/1] cjson: add hash for license file
Message-ID: <20171202160346.31545-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cjson/cjson.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index e71b25700..cd513693c 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256 3d6277179282b00af232d9f97c9e0049ff212636d2a84791b03439c81d1f7b1e  cjson-v1.6.0.tar.gz
+sha256 f6f207863675ca5a5128fd120b9aef4f4bbab73ffa57e5f771ccffc8e3cc56b7  LICENSE
-- 
2.14.1
