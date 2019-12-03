From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 17:07:49 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/libhid: update
 the upstream URL in Config.in
Message-ID: <20191203160321.A1947867D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ec3fc6559df4f4ef506e3543ad7d0ce1e41a33e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

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
