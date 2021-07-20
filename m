From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 20 Jul 2021 22:42:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/network-manager: fix license hash
Message-ID: <20210720204212.79467-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For an unknown reason, commit 360d1aad84449c6a1993d8c7e469dc0cd35339a2
has set a wrong hash for CONTRIBUTING.md

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/network-manager/network-manager.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 6efd697af4..c9d4826a0b 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -3,4 +3,4 @@ sha256  701d511067f757d0f92f412c98cdb49a74a6ba69448aabb1beadacbc171e3873  Networ
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256  65fd94885d3a5f468755e7cbe1334e56ef3a32b8a73980967fa9839c10514aa9  CONTRIBUTING.md
+sha256  e70c2d84a038b972beff16d8662f35567709dff2d552220bd1af6014f6d2215d  CONTRIBUTING.md
-- 
2.30.2
