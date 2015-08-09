From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 16:58:15 +0200
Subject: [Buildroot] [git commit] package/sysdig: Fix typo in comment
Message-ID: <20150809145824.D155F8076D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a871ffd1821ba5e26862949a7a7a09b7de847f9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sysdig/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 36d35fb..dc71d5f 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -16,6 +16,6 @@ config BR2_PACKAGE_SYSDIG
 
 	  http://sysdig.org
 
-comment "sysdig needs a toolchain w/ C++, dynamibc library and a Linux kernel to be built"
+comment "sysdig needs a toolchain w/ C++, dynamic library and a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
