From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 22:58:27 +0100
Subject: [Buildroot] [git commit] package/pimd: update the upstream URL in
 Config.in
Message-ID: <20191222215908.5FC498DAAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47e0aec2c9a92155a0995012e9e0263077b1f419
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pimd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pimd/Config.in b/package/pimd/Config.in
index d6a579bda2..718f84f4f8 100644
--- a/package/pimd/Config.in
+++ b/package/pimd/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_PIMD
 	  pimd is a lightweight stand-alone PIM-SM v2 multicast routing
 	  daemon.
 
-	  http://troglobit.com/project/pimd/
+	  http://troglobit.com/projects/pimd/
