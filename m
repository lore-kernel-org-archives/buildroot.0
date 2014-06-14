From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 19:08:48 +0200
Subject: [Buildroot] [git commit] tclap: fix syntax error in Config.in
Message-ID: <20140614170925.676CF9AD59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a71f1875b44fff0d4cb89d9009dca0512784683c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tclap/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tclap/Config.in b/package/tclap/Config.in
index 8c6296f..667117d 100644
--- a/package/tclap/Config.in
+++ b/package/tclap/Config.in
@@ -3,7 +3,7 @@ comment "tclap needs a toolchain w/ C++"
 
 config BR2_PACKAGE_TCLAP
 	bool "tclap"
-	depends BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  This is a small, flexible library that provides a simple interface
 	  for defining and accessing command line arguments. It was initially
