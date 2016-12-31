From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 31 Dec 2016 17:00:39 -0200
Subject: [Buildroot] [PATCH] udoo: mx6qdl: Use the preferred form for
	disabling a symbol
Message-ID: <1483210839-23311-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though 'CONFIG_USB=n' does the job, let's switch to the more
standard way for disabling a Kconfig symbol.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/udoo/mx6qdl/linux.fragment | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/udoo/mx6qdl/linux.fragment b/board/udoo/mx6qdl/linux.fragment
index 2acad15..1d25099 100644
--- a/board/udoo/mx6qdl/linux.fragment
+++ b/board/udoo/mx6qdl/linux.fragment
@@ -1 +1 @@
-CONFIG_USB=n
+# CONFIG_USB is not set
-- 
2.7.4
