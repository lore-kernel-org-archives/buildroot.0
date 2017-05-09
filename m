From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  9 May 2017 09:57:22 +0300
Subject: [Buildroot] [PATCH] .gitignore: add vim temporary files
Message-ID: <fec91e1a48d4dd8d7fc7d019329ee4c3cf5c0c79.1494313042.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index bb02d9f57270..393eae97135d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -12,4 +12,5 @@
 *.orig
 *.rej
 *~
+.*.swp
 *.pyc
-- 
2.11.0
