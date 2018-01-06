From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  5 Jan 2018 20:37:12 -0600
Subject: [Buildroot] [PATCH] libzip: update legal hash for 1.4.0
Message-ID: <1515206232-52330-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The copyright was updated in the LICENSES file

Fixes (one of many):
http://autobuild.buildroot.net/results/a64/a64ddf630aa44c7b0353f5a6818beffd20712615/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/libzip/libzip.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libzip/libzip.hash b/package/libzip/libzip.hash
index abfd20f..0eeb313 100644
--- a/package/libzip/libzip.hash
+++ b/package/libzip/libzip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256	e508aba025f5f94b267d5120fc33761bcd98440ebe49dbfe2ed3df3afeacc7b1  libzip-1.4.0.tar.xz
-sha256  d159ae325ca0b8236c44dfd980ca99810dbcfc057b077c50dbbda1131cbd263a  LICENSE
+sha256  3c964a7eb1abeb6bd6f40035ed3a014728ff8c5437f107dcf24fbbfab16e227e  LICENSE
-- 
1.9.1
