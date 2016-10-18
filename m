From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Oct 2016 22:12:27 +0200
Subject: [Buildroot] [git commit] qt5base: improve message if directfb is
	disabled
Message-ID: <20161018202210.7D51481D4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cdf47aff42ad968a9987110cc2688dd4f947a258
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 64a7f65..7244fbe 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -180,7 +180,7 @@ config BR2_PACKAGE_QT5BASE_DIRECTFB
 	bool "directfb support"
 	depends on BR2_PACKAGE_DIRECTFB
 
-comment "directfb backend if directb is enabled"
+comment "directfb backend available if directfb is enabled"
 	depends on !BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_QT5BASE_XCB
