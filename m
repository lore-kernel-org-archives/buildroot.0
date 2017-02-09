From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 21:35:52 +0100
Subject: [Buildroot] [git commit] lzip: use the more informative homepage
	link
Message-ID: <20170209203618.BA51381938@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4939bd71e3aef2a0097b0a39440cba8c69ec8a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lzip/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lzip/Config.in b/package/lzip/Config.in
index f20d0e5..821cd26 100644
--- a/package/lzip/Config.in
+++ b/package/lzip/Config.in
@@ -11,4 +11,4 @@ config BR2_PACKAGE_LZIP
 	  bzip2, and is better than both from a data recovery perspective.
 	  Lzip is a clean implementation of the LZMA algorithm.
 
-	  http://savannah.nongnu.org/projects/lzip
+	  http://www.nongnu.org/lzip/lzip.html
