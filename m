From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 May 2018 22:43:42 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] ebtables: drop obsolete
 comment
Message-ID: <20180524210451.18B5A8197A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4d489e36275ed320471d23a8849060125728abb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Commit 30c4b5843f (ebtables: enable for musl) enabled musl build, but
forgot to remove the comment text. Fix that.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ca2a6f04edebb5cd333c39fe15d3b498e4458411)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ebtables/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
index 2fdac06cd1..3f7566a607 100644
--- a/package/ebtables/Config.in
+++ b/package/ebtables/Config.in
@@ -5,6 +5,3 @@ config BR2_PACKAGE_EBTABLES
 	  Ethernet bridge frame table administration
 
 	  http://ebtables.netfilter.org/
-
-comment "ebtables needs a glibc or uClibc toolchain"
-	depends on BR2_USE_MMU
