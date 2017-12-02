From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  2 Dec 2017 16:36:20 +0100
Subject: [Buildroot] [PATCH 1/1] hiredis: add hash for license file
Message-ID: <20171202153620.27513-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hiredis/hiredis.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/hiredis/hiredis.hash b/package/hiredis/hiredis.hash
index 2c788a677..682ec6d2b 100644
--- a/package/hiredis/hiredis.hash
+++ b/package/hiredis/hiredis.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256	717e6fc8dc2819bef522deaca516de9e51b9dfa68fe393b7db5c3b6079196f78	hiredis-v0.13.3.tar.gz
+sha256	dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb	COPYING
-- 
2.14.1
