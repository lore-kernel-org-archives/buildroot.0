From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 19:01:44 +0000
Subject: [Buildroot] [PATCH 1/1] package/hicolor-icon-theme: add an upstream
 URL to Config.in
Message-ID: <20191126190144.9069-1-mark@dibsco.co.uk>
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
 package/hicolor-icon-theme/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/hicolor-icon-theme/Config.in b/package/hicolor-icon-theme/Config.in
index 10edbf8865..5ef2cd2267 100644
--- a/package/hicolor-icon-theme/Config.in
+++ b/package/hicolor-icon-theme/Config.in
@@ -7,3 +7,5 @@ config BR2_PACKAGE_HICOLOR_ICON_THEME
 	  standard directory structure for storing icons of third-party
 	  applications (i.e. the ones not available in usual icon
 	  themes).
+
+	  https://www.freedesktop.org/wiki/Software/icon-theme/
-- 
2.20.1
