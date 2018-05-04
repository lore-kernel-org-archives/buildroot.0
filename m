From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  4 May 2018 12:31:44 +0300
Subject: [Buildroot] [PATCH] ebtables: drop obsolete comment
Message-ID: <ea16299ab7bb09bf405c84c93b4f5e276246cb35.1525426304.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 30c4b5843f (ebtables: enable for musl) enabled musl build, but
forgot to remove the comment text. Fix that.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ebtables/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
index 2fdac06cd17d..3f7566a60729 100644
--- a/package/ebtables/Config.in
+++ b/package/ebtables/Config.in
@@ -5,6 +5,3 @@ config BR2_PACKAGE_EBTABLES
 	  Ethernet bridge frame table administration
 
 	  http://ebtables.netfilter.org/
-
-comment "ebtables needs a glibc or uClibc toolchain"
-	depends on BR2_USE_MMU
-- 
2.17.0
