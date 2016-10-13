From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 07:38:55 +0200
Subject: [Buildroot] [git commit] package/iozone: indentation cleanup
Message-ID: <20161013054826.576AB817C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f32c2d96a4d4762e15f8ede1e0ced633234809d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iozone/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iozone/Config.in b/package/iozone/Config.in
index fe49bd1..33c938e 100644
--- a/package/iozone/Config.in
+++ b/package/iozone/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_IOZONE
 
 comment "iozone needs a toolchain w/ NPTL"
 	depends on BR2_USE_MMU
-        depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
