From: Mark Corbin <mark@dibsco.co.uk>
Date: Mon, 25 Nov 2019 20:05:48 +0000
Subject: [Buildroot] [PATCH 1/1] package/atk: add an upstream URL to
 Config.in
Message-ID: <20191125200548.18520-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/atk/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/atk/Config.in b/package/atk/Config.in
index c980614998..d9371b879b 100644
--- a/package/atk/Config.in
+++ b/package/atk/Config.in
@@ -7,6 +7,8 @@ config BR2_PACKAGE_ATK
 	help
 	  The ATK accessibility toolkit, needed to build GTK+-2.x.
 
+	  https://gitlab.gnome.org/GNOME/atk
+
 comment "atk needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.20.1
