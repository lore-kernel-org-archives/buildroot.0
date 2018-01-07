From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun,  7 Jan 2018 17:29:06 -0600
Subject: [Buildroot] [PATCH] execline: fix hash "sha" type spelling
Message-ID: <1515367746-46395-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sah256 -> sha256

Fixes:
http://autobuild.buildroot.net/results/9d0/9d054a26d7833353efbe49c984a7cb66d77b1d0c/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/execline/execline.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index 0e64ed9..afead5c 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,3 +1,3 @@
 # Locally generated
 sha256 e4bb8fc8f20cca96f4bac9f0f74ebce5081b4b687bb11c79c843faf12507a64b  execline-2.3.0.4.tar.gz
-sah256 6ee77e7199d69b707ab864ea7a838f9562717aaa41c89413bdb2cf835f95052f  COPYING
+sha256 6ee77e7199d69b707ab864ea7a838f9562717aaa41c89413bdb2cf835f95052f  COPYING
-- 
1.9.1
