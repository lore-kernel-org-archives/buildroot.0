From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 08:40:21 +0100
Subject: [Buildroot] [git commit] snappy: update homepage link
Message-ID: <20170303074100.0661F81D4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=355b0336d52a5473a0535af40afa6892d9fcd2f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/snappy/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/snappy/Config.in b/package/snappy/Config.in
index 06d537f..d5f7069 100644
--- a/package/snappy/Config.in
+++ b/package/snappy/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_SNAPPY
 	  library; instead, it aims for very high speeds and reasonable
 	  compression.
 
-	  http://code.google.com/p/snappy/
+	  http://google.github.io/snappy/
 
 comment "snappy needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
