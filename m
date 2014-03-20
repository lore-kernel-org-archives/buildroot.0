From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 20 Mar 2014 23:07:30 +0100
Subject: [Buildroot] [PATCH 6/6] manual/adding-packages-tips.txt: reword
	part about package name
In-Reply-To: <1395353250-9475-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1395353250-9475-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1395353250-9475-7-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 docs/manual/adding-packages-tips.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 73c25be..ceaba8e 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -31,7 +31,7 @@ using the following rules:
   +BR2_PACKAGE_FOO_BAR_BOO+);
 
 * the +*.mk+ file variable prefix is the upper case _package name_
-  `.` and `-` characters substituted with `_` (e.g.:
+  with `.` and `-` characters substituted with `_` (e.g.:
   +FOO_BAR_BOO_VERSION+).
 
 
-- 
1.7.9.5
