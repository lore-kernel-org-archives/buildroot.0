From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 15 Feb 2015 10:51:03 +0200
Subject: [Buildroot] [PATCH] Config.in: remove text denoting central package
	infra
Message-ID: <25aff43a817e1156e747e778df58adf119fa367e.1423990263.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The central package infrastructure handles all packages for quite some time
now, so this note is no longer needed.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Config.in b/Config.in
index f5b6c7346b6a..ce239d668206 100644
--- a/Config.in
+++ b/Config.in
@@ -167,8 +167,6 @@ config BR2_PRIMARY_SITE
 	  default if the file is not found.
 	  Valid URIs are URIs recognized by $(WGET) and scp URIs of the form
 	  scp://[user@]host:path.
-	  NOTE: This works for all packages using the central package
-	  infrastructure (generic, autotools, cmake, ...)
 
 config BR2_PRIMARY_SITE_ONLY
 	bool "Only allow downloads from primary download site"
-- 
2.1.4
