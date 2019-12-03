From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 17:03:18 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libhid: update
 the upstream URL in Config.in
Message-ID: <20191203160316.6CF38866E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64c521a2f029b3c0fe2f36dbc72fabad0c39fc10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 756409336e2d59fd75807e9be2a624a65b590ee8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libhid/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libhid/Config.in b/package/libhid/Config.in
index e6f2012860..ec66308061 100644
--- a/package/libhid/Config.in
+++ b/package/libhid/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBHID
 	help
 	  Userspace library for accessing USB HID devices
 
-	  http://libhid.alioth.debian.org
+	  https://directory.fsf.org/wiki/Libhid
 
 comment "libhid needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
