From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 07:39:28 +0200
Subject: [Buildroot] [git commit] package/tinydtls: indentation cleanup
Message-ID: <20161013054826.6158D805E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b1fe969048fa8625e134f4fd773dbd91d1427b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinydtls/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tinydtls/Config.in b/package/tinydtls/Config.in
index 33b08fe..2f90eb2 100644
--- a/package/tinydtls/Config.in
+++ b/package/tinydtls/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_TINYDTLS
 	  https://sourceforge.net/projects/tinydtls
 
 comment "tinydtls needs a toolchain w/ threads"
-        depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
