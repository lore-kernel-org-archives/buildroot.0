From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 13:56:14 +0100
Subject: [Buildroot] [git commit] package/libdrm: Remove i386/x86_64
	dependency from Nouveau driver
Message-ID: <20151220125857.1686181F9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a5518a9135903f86219bb1b23166a001f62fa07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index cf1c13b..445a85b 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -36,7 +36,6 @@ config BR2_PACKAGE_LIBDRM_AMDGPU
 
 config BR2_PACKAGE_LIBDRM_NOUVEAU
 	bool "nouveau"
-	depends on BR2_i386 || BR2_x86_64
 	help
 	  Install NVIDIA graphics driver.
 
