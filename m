From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 21:01:53 +0100
Subject: [Buildroot] [git commit] package/elf2flt: add an upstream URL to
 Config.in.host
Message-ID: <20191126203656.48E448120D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bc9787f95e0e640c02ad19ab167516d224a8523
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in.host. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/elf2flt/Config.in.host | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/elf2flt/Config.in.host b/package/elf2flt/Config.in.host
index b93795baa4..d6685a7ff6 100644
--- a/package/elf2flt/Config.in.host
+++ b/package/elf2flt/Config.in.host
@@ -9,3 +9,5 @@ config BR2_PACKAGE_HOST_ELF2FLT
 
 	  This option compiles the required tools and makes the required
 	  modifications on your toolchain (linker).
+
+	  https://github.com/uclinux-dev/elf2flt
