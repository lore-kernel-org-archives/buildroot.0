From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:27 -0000
Subject: [Buildroot] [git commit branch/next] cryptsetup: update homepage
	link
Message-ID: <20150808105619.C36627FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3e0217c1f03e867355e35822251d628247af630
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptsetup/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 3d3c47d..13b0184 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_CRYPTSETUP
 	  This tool helps manipulate dm-crypt and luks partitions for
 	  on-disk encryption.
 
-	  https://code.google.com/p/cryptsetup/
+	  https://gitlab.com/cryptsetup/cryptsetup
 
 comment "cryptsetup needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
