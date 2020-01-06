From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  6 Jan 2020 23:01:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: fix hash of license
 file
Message-ID: <20200106220151.3380004-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 0161899ae56d2c886df890ae352665bb07c88869 forgot to update hash of
license file (update in year):
https://github.com/docker/engine/commit/68906e6dcdd115be8b12913a7d1c4d9c4db6c495

Fixes:
 - http://autobuild.buildroot.org/results/3d1ccae5f3e4eeed9a3bf2eb29fd194b868bc0a7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 59c9204285..1f1643d377 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256	bc5d1ac503e44593be8003ed0ad9c75bf0da535db19837a9338429c438bd4637  docker-engine-19.03.5.tar.gz
-sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
+sha256	7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
-- 
2.24.1
