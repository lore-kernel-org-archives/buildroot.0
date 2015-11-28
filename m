From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 19:12:16 +0100
Subject: [Buildroot] [git commit branch/next] libplist: use the official
	project url
Message-ID: <20151128181404.8CC9E81D64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6752beb5f5db3c2023a1722db659b271f86ec5d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libplist/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libplist/Config.in b/package/libplist/Config.in
index c9d511b..4b2b529 100644
--- a/package/libplist/Config.in
+++ b/package/libplist/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBPLIST
 	  libplist is a client for manipulating Apple Property List
 	  (.plist) files
 
-	  http://cgit.sukimashita.com/libplist.git
+	  http://www.libimobiledevice.org/
 
 comment "libplist needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
