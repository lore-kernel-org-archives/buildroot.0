From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Wed,  7 May 2014 16:52:49 -0300
Subject: [Buildroot] [PATCH] httping: Fix a trivial typo in the menu
Message-ID: <1399492369-29083-1-git-send-email-ezequiel.garcia@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 package/httping/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/httping/Config.in b/package/httping/Config.in
index cd97e72..6564415 100644
--- a/package/httping/Config.in
+++ b/package/httping/Config.in
@@ -1,4 +1,4 @@
-comment "httping needs a toolchain w/ char"
+comment "httping needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_HTTPING
-- 
1.9.1
