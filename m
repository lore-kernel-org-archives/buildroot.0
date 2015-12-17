From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 17 Dec 2015 16:39:54 +0000
Subject: [Buildroot] [PATCH 2/2] torsmo: deprecate this package
In-Reply-To: <1450370394-51267-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1450370394-51267-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1450370394-51267-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
-- 
2.4.10
