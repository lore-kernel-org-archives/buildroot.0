From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 14:29:40 +0200
Subject: [Buildroot] [git commit] package/liblinear: wrap help text to fit
	72 columns
Message-ID: <20150920122944.96F847FBF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64476e4a4db3fa121291b09c2b1e1c997835eb6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liblinear/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/liblinear/Config.in b/package/liblinear/Config.in
index 17c5a74..f25c119 100644
--- a/package/liblinear/Config.in
+++ b/package/liblinear/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_LIBLINEAR
 	bool "liblinear"
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
-	  liblinear is a linear classifier for data with millions of instances and
-	  features.
+	  liblinear is a linear classifier for data with millions of instances
+	  and features.
 
 	  http://www.csie.ntu.edu.tw/~cjlin/liblinear/
 
