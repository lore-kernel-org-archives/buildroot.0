From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 28 Mar 2014 22:24:44 +0100
Subject: [Buildroot] [PATCH 3/9] manual/make-tips.txt: fix typo
In-Reply-To: <1396041895-29533-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1396041895-29533-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1396041895-29533-4-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 docs/manual/make-tips.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index faf59f2..81edae3 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -32,7 +32,7 @@ The result of the search shows the help message of the matching items.
 Not all targets are always available,
 some settings in the +.config+ file may hide some targets:
 
-* +busybox-menuconfig+ and +busybox-savedefconfig+ ony work when
+* +busybox-menuconfig+ and +busybox-savedefconfig+ only work when
   +busybox+ is enabled;
 * +linux-menuconfig+ and +linux-savedefconfig+ only work when
   +linux+ is enabled;
-- 
1.7.9.5
