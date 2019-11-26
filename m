From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 20:38:25 +0100
Subject: [Buildroot] [git commit] package/dmraid: add an upstream URL to
 Config.in
Message-ID: <20191126203656.1B45683820@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81f4a636696cf79ed655052f630c54ab1f48d32a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dmraid/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index aa98c853a1..3c375f4c67 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -12,6 +12,8 @@ config BR2_PACKAGE_DMRAID
 	  dmraid uses the Linux device-mapper to create devices with
 	  respective mappings for the ATARAID sets discovered.
 
+	  http://people.redhat.com/~heinzm/sw/dmraid/
+
 comment "dmraid needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
