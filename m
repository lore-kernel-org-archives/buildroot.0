From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:47:51 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/dmraid: add an
 upstream URL to Config.in
Message-ID: <20191203134029.8F4D784267@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=957d144e61cde2294e3f5109bf8e32799723c79c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 81f4a636696cf79ed655052f630c54ab1f48d32a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
