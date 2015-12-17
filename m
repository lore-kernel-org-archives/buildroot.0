From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 21:54:30 +0100
Subject: [Buildroot] [git commit] torsmo: deprecate this package
Message-ID: <20151217205545.3E6C17FE69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7152c5c5ce9567dd4046bbd27d1e84d619d09228
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/torsmo/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/torsmo/Config.in b/package/torsmo/Config.in
index a3943bd..5c18ac6 100644
--- a/package/torsmo/Config.in
+++ b/package/torsmo/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TORSMO
 	bool "torsmo"
+	depends on BR2_DEPRECATED_SINCE_2015_11
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
