From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 13 Jul 2015 15:52:22 +0200
Subject: [Buildroot] [PATCH] docs/manual: fix typo
Message-ID: <1436795542-8947-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 docs/manual/adding-packages-kernel-module.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-kernel-module.txt b/docs/manual/adding-packages-kernel-module.txt
index 39575f7..0a5ec5b 100644
--- a/docs/manual/adding-packages-kernel-module.txt
+++ b/docs/manual/adding-packages-kernel-module.txt
@@ -128,7 +128,7 @@ configure the build of the kernel module:
 * +FOO_MODULE_MAKE_OPTS+ may be set to contain extra variable definitions
   to pass to the Linux buildsystem.
 
-Yo may also reference (but you may *not* set!) those variables:
+You may also reference (but you may *not* set!) those variables:
 
  * +LINUX_DIR+ contains the path to where the Linux kernel has been
    extracted and built.
-- 
1.9.1
