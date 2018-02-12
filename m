From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 12 Feb 2018 12:27:48 -0500
Subject: [Buildroot] [PATCH 1/1] json for modern cpp: fix license hash
Message-ID: <20180212172748.13563-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/942/942485b94f21567c2f35a1a3cc62450f3461a4f9

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/json-for-modern-cpp/json-for-modern-cpp.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
index b2abe49700..04a520d7d7 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.hash
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256	b20be343922f73504baf8a01543c2a42d16e01f18bb231b324a8959416ccf4f8	json-v3.1.0.tar.gz
-sha256	6a6115fc4a7239a135f2dce8d33f94cb8a936b8f608ac0f6699fbac278b0dd5b	LICENSE.MIT
+sha256	7b875bb7a4e28abb7956ea821b4b7d88ff6a2a4fabf261c3993730a365ec56dd	LICENSE.MIT
-- 
2.14.3
