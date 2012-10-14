From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Oct 2012 23:11:16 +0200
Subject: [Buildroot] [PATCH 09/10] glib-networking: remove redundant
	dependency on gettext
In-Reply-To: <20121014210734.17845.64519.stgit@localhost>
References: <20121014210734.17845.64519.stgit@localhost>
Message-ID: <20121014211110.17845.3033.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/glib-networking/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index dab35ea..f1aa7ee 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_GLIB_NETWORKING
 	bool "glib-networking"
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Network-related GIO modules for glib.
 
