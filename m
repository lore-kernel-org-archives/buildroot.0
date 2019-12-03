From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:11:58 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/atk: add an
 upstream URL to Config.in
Message-ID: <20191203130351.3396683FF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01e3bee2e44abd34d98f8f2ff664019219ba32de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4daeedfc45b6baee5545fd0710c180037da3da49)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
