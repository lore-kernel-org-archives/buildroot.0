From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 14:31:04 -0300
Subject: [Buildroot] [PATCH] crda: bump to version 3.13
Message-ID: <1403631064-8891-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/crda/crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/crda/crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch b/package/crda/crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch
index 453fce3..ab25b38 100644
--- a/package/crda/crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch
+++ b/package/crda/crda-0002-Add-DESTDIR-support-in-install-libreg-rules.patch
@@ -6,7 +6,6 @@ Subject: [PATCH 1/4] crda: Add DESTDIR support in install-libreg* rules in
 
 Signed-off-by: John W. Linville <linville@tuxdriver.com>
 Signed-off-by: Luis R. Rodriguez <mcgrof@do-not-panic.com>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
  Makefile | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
-- 
1.8.5.5
