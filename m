From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 23:43:16 +0200
Subject: [Buildroot] [git commit] cryptsetup: update homepage link
Message-ID: <20150702214322.D8B9380084@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3e0217c1f03e867355e35822251d628247af630
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
