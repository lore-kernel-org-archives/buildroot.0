From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 16:16:01 +0100
Subject: [Buildroot] [git commit] binutils: add comment with bug report
	reference
Message-ID: <20161101151604.6888C80E57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa921541902751b3cc3355ac4ea8f66ada18e91f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add requested bug report

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
