From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 22:45:25 +0200
Subject: [Buildroot] [git commit] package/network-manager: fix license hash
Message-ID: <20210720201141.2CF6588617@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=e7b68ebd2bc171fed054d4dfc550c48fe1712735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For an unknown reason, commit 360d1aad84449c6a1993d8c7e469dc0cd35339a2
has set a wrong hash for CONTRIBUTING.md

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
