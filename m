From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 13:43:30 +0000
Subject: [Buildroot] [PATCH 1/1] package/elf2flt: add an upstream URL to
 Config.in.host
Message-ID: <20191126134330.20650-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream URL to the help text in Config.in.host. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
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
-- 
2.20.1
