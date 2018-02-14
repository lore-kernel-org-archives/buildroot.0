From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 21:25:08 +0100
Subject: [Buildroot] [git commit] gconf: Config.in: fix help text wrapping
Message-ID: <20180214202523.47F4086D18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a12dd24ac77b6c5863d4171916f1a7a6751ee566
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes the warnings reported by check-package on the help
text of package Config.in file, related to the formatting of the help
text: should start with a tab, then 2 spaces, then at most 62
characters.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gconf/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gconf/Config.in b/package/gconf/Config.in
index a967d61644..a2371b3f23 100644
--- a/package/gconf/Config.in
+++ b/package/gconf/Config.in
@@ -9,9 +9,9 @@ config BR2_PACKAGE_GCONF
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
 	help
-	  GConf was a system used by the GNOME desktop environment for storing
-	  configuration settings for the desktop and applications. It is similar
-	  to the Windows Registry.
+	  GConf was a system used by the GNOME desktop environment for
+	  storing configuration settings for the desktop and
+	  applications. It is similar to the Windows Registry.
 
 	  https://projects.gnome.org/gconf/
 
