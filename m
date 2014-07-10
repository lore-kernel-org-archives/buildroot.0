From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jul 2014 22:05:55 +0200
Subject: [Buildroot] [git commit] arch: avr32 should only get removed for
	the 2015.02 release
Message-ID: <20140710200628.DA6C29D1F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2444e94ce625452ddb030d1cf6e90466ee96ef0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed on the list.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 77fae7a..9cd85a5 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -60,7 +60,7 @@ config BR2_avr32
 	# do the lack of upstream support in the major toolchain
 	# components. If you're interested by AVR32, contact the
 	# Buildroot community. Otherwise, its support will be removed
-	# in 2014.11.
+	# by the 2015.02 release.
 	depends on BR2_DEPRECATED_SINCE_2014_08
 	help
 	  The AVR32 is a 32-bit RISC microprocessor architecture designed by
