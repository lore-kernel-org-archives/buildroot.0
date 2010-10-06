From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Oct 2010 17:30:52 +0200
Subject: [Buildroot] [git commit master 1/1] libmpeg2: fix Config.in
	indentation/typo
Message-ID: <20101006153114.C97118BE59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a268b0528c8a00f84cc5b5240047b91ac281de7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Thomas for noticing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libmpeg2/Config.in |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/multimedia/libmpeg2/Config.in b/package/multimedia/libmpeg2/Config.in
index a3fafb0..3694689 100644
--- a/package/multimedia/libmpeg2/Config.in
+++ b/package/multimedia/libmpeg2/Config.in
@@ -6,8 +6,8 @@ config BR2_PACKAGE_LIBMPEG2
 	  http://libmpeg2.sourceforge.net/
 
 config BR2_PACKAGE_LIBMPEG2_BINS
-       bool "mpeg2 binaries"
-       depends on BR2_PACKAGE_LIBMPEG2
-       help
-         Install mpeg2dec, corrupt_mpeg2 and extrac_mpeg2 programs as
-	 well.
+	bool "mpeg2 binaries"
+	depends on BR2_PACKAGE_LIBMPEG2
+	help
+	  Install mpeg2dec, corrupt_mpeg2 and extract_mpeg2 programs as
+	  well.
-- 
1.7.1
