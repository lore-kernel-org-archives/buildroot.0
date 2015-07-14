From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Jul 2015 18:49:18 +0300
Subject: [Buildroot] [PATCH] docs/manual: relax python version requirement
Message-ID: <380d3364a889b4c7b3af710576c53e0100fe31b7.1436888958.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot should now work with host installed python version 3. Update the
manual accordingly.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 docs/manual/prerequisite.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 6ee01b4a747e..7edad1f6db3e 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -32,7 +32,7 @@ between distributions).
 ** +perl+ (version 5.8.7 or any later)
 ** +tar+
 ** +cpio+
-** +python+ (version 2.6 or 2.7)
+** +python+ (version 2.6 or any later)
 ** +unzip+
 ** +rsync+
 
-- 
2.1.4
