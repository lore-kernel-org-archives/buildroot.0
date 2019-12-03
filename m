From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:48:38 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/elf2flt: add an
 upstream URL to Config.in.host
Message-ID: <20191203134029.B98DD7FE16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76261c5ffba7d232eeed7e4cdb2cdcf72d0bd75d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Add an upstream URL to the help text in Config.in.host. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3bc9787f95e0e640c02ad19ab167516d224a8523)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
