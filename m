From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Apr 2014 00:44:21 +0200
Subject: [Buildroot] [git commit] package/webkit: threads are also needed
	for icu
Message-ID: <20140408225026.222A59C54F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48c3eefca6e9f33d8b736e2bffcee152ce8abb9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add icu to the comment-list of packages requiring threads.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkit/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 5ba2eb3..4112287 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_WEBKIT
 	bool "webkit"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # enchant -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # enchant -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # enchant -> libglib2; icu
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # icu
