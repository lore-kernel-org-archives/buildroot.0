From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 12:54:31 +0000
Subject: [Buildroot] [PATCH 1/1] package/dmraid: add an upstream URL to
 Config.in
Message-ID: <20191126125431.17176-1-mark@dibsco.co.uk>
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
-- 
2.20.1
