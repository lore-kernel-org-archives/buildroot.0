From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 May 2013 09:40:32 +0300
Subject: [Buildroot] [PATCH] gitignore: remove the stale /dl entry
Message-ID: <1369032032-3799-1-git-send-email-baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .gitignore |    1 -
 1 file changed, 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index bb02d9f..1c1f60e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,5 +1,4 @@
 /output
-/dl
 /.auto.deps
 /.config.cmd
 /.config.old
-- 
1.7.10.4
