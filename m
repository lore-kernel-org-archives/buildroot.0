From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 10:29:14 +0200
Subject: [Buildroot] [git commit] qt5webkit: indentation cleanup
Message-ID: <20160628082959.3CDA8802FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e99d123642e5b4bfc4ff129aedd0dd40cb824d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5webkit/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 7add5f9..48aaf94 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -23,6 +23,6 @@ config BR2_PACKAGE_QT5WEBKIT
 	  http://qt.io
 
 comment "qt5webkit needs a toolchain w/ dynamic library"
-        depends on BR2_STATIC_LIBS
-        depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-        depends on !BR2_BINFMT_FLAT
+	depends on BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	depends on !BR2_BINFMT_FLAT
