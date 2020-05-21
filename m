From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 May 2020 15:42:59 +0200
Subject: [Buildroot] [git commit] package/xerces: fix coding style in
 Config.in
Message-ID: <20200602200121.C2B0B812A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e60247be67a8e7f9937a8bf2b123ddb2be9dad2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We generally use on "depends on" for each toolchain option, so let's
do this as well in package/xerces/Config.in.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xerces/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/xerces/Config.in b/package/xerces/Config.in
index a9b102bd5e..d3f4967413 100644
--- a/package/xerces/Config.in
+++ b/package/xerces/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XERCES
 	bool "xerces-c++"
-	depends on BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on USE_WCHAR
 	help
 	  Xerces-C++ is a validating XML parser written in portable C++.
 
