From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 22 Jun 2017 15:39:30 +0300
Subject: [Buildroot] [PATCH 2/2] psmisc: update homepage link
In-Reply-To: <f47611d9867fd591625d0d90a9134c0221c3ce38.1498135170.git.baruch@tkos.co.il>
References: <f47611d9867fd591625d0d90a9134c0221c3ce38.1498135170.git.baruch@tkos.co.il>
Message-ID: <3474e14690f9a8f4a7bbd0e852257e797a3511f4.1498135170.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gitlab repo is much more informative and updated.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/psmisc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/psmisc/Config.in b/package/psmisc/Config.in
index 734542cc8a05..2b66bcfa9471 100644
--- a/package/psmisc/Config.in
+++ b/package/psmisc/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_PSMISC
 	help
 	  Helpful /proc related utilities such as pstree, fuser, and killall
 
-	  http://psmisc.sourceforge.net/
+	  https://gitlab.com/psmisc/psmisc
-- 
2.11.0
