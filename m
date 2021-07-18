From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Jul 2021 21:24:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/civetweb: fix license hash
Message-ID: <20210718192428.2931594-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit b5ba0119e858f0bdc2683f15dd7758eb08ed1f6a forgot to update hash of
LICENSE.md (update of LuaFileSystem and year with
https://github.com/civetweb/civetweb/commit/1178ea98ccbf2247c35e33aa1e89e445a651fa01
https://github.com/civetweb/civetweb/commit/a9fb075fd807bf359e749b4d5928aceda65efbd0)

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/civetweb/civetweb.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/civetweb/civetweb.hash b/package/civetweb/civetweb.hash
index 96e4aa105b..0295e74da6 100644
--- a/package/civetweb/civetweb.hash
+++ b/package/civetweb/civetweb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  d02d7ab091c8b4edf21fc13a03c6db08a8a8b8605e35e0073251b9d88443c653  civetweb-1.14.tar.gz
-sha256  291622dfbbf4fb35829726fbe97177b7227c0d4d6392b350660af73af4f86df8  LICENSE.md
+sha256  24d3d2aee56ae3cddcdf3392c1250877818108314233cf15f2bc9eb3ac298934  LICENSE.md
-- 
2.30.2
