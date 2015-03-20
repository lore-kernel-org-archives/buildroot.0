From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 14:31:08 +0100
Subject: [Buildroot] [git commit] dvdrw-tools: delete explicit default for
	backend
Message-ID: <20150320152859.7FBDB8186A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c6bc6f2cdce3eaf51d6529dd7b493857b4b20e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Steve Kenton <skenton@ou.edu>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Acked-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dvdrw-tools/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/dvdrw-tools/Config.in b/package/dvdrw-tools/Config.in
index 6787b66..47835d8 100644
--- a/package/dvdrw-tools/Config.in
+++ b/package/dvdrw-tools/Config.in
@@ -35,7 +35,6 @@ config BR2_PACKAGE_DVDRW_TOOLS
 if BR2_PACKAGE_DVDRW_TOOLS
 choice
 	prompt "Media Backend"
-	default BR2_PACKAGE_DVDRW_CDRKIT_BACKEND
 	help
 	  Choose which media backend program to use.
 
