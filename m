From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 19:12:27 +0100
Subject: [Buildroot] [git commit] libplist: put depends before selects
Message-ID: <20151201232123.E397481D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25c33d2f97164bdafac68ecbf95e064931e40e40
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libplist/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libplist/Config.in b/package/libplist/Config.in
index 4b2b529..5f96746 100644
--- a/package/libplist/Config.in
+++ b/package/libplist/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBPLIST
 	bool "libplist"
-	select BR2_PACKAGE_LIBXML2
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBXML2
 	help
 	  libplist is a client for manipulating Apple Property List
 	  (.plist) files
