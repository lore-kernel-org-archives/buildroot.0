From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 17:23:07 +0200
Subject: [Buildroot] [git commit] package/multicat: use double quotes in
	toolchain comment
Message-ID: <20160704152319.39905819EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bec6225f3912f5d64e2282a305e33a57ecd58f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To be consistent with the rest of Buildroot.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/multicat/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/multicat/Config.in b/package/multicat/Config.in
index 8dfb6c1..1359358 100644
--- a/package/multicat/Config.in
+++ b/package/multicat/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_MULTICAT
 
 	  http://www.videolan.org/projects/multicat.html
 
-comment 'multicat needs a toolchain w/ threads'
+comment "multicat needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
