From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 22:10:38 +0100
Subject: [Buildroot] [git commit] package/kexec-lite: add an upstream URL to
 Config.in
Message-ID: <20191126210245.62ACC8152E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57234a49ef9dde153be0e39a1b6f63f4e8680b49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kexec-lite/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
index cd0e30f2dd..3e84f90d57 100644
--- a/package/kexec-lite/Config.in
+++ b/package/kexec-lite/Config.in
@@ -15,6 +15,8 @@ config BR2_PACKAGE_KEXEC_LITE
 	  This package is a tiny implementation of the kexec userspace
 	  components, for devicetree-based platforms.
 
+	  https://github.com/antonblanchard/kexec-lite
+
 comment "kexec-lite needs a uClibc or glibc toolchain w/ wchar, dynamic library"
 	depends on BR2_powerpc || BR2_powerpc64
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR \
