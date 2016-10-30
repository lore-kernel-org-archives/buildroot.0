From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 30 Oct 2016 14:25:11 +0100
Subject: [Buildroot] [PATCH] binutils: add comment with bug report reference
Message-ID: <20161030132511.GA23794@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add requested bug report

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/binutils/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index a7610b4..dce6996 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -18,6 +18,7 @@ choice
 	config BR2_BINUTILS_VERSION_2_27_X
 		bool "binutils 2.27"
 		# supported but broken on Microblaze
+		# see https://sourceware.org/bugzilla/show_bug.cgi?id=20748
 		depends on !BR2_microblaze
 
 endchoice
-- 
2.1.4
