From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 22:10:10 +0100
Subject: [Buildroot] [git commit] package/hicolor-icon-theme: add an
 upstream URL to Config.in
Message-ID: <20191126210245.49D3A8152E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d4407c00b0c43a4baee9699f0b07d061141c613
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
