From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 23:40:43 +0200
Subject: [Buildroot] [git commit branch/next]
 package/perl-device-serialport: fix LICENSE variable
Message-ID: <20180812213440.681548C9D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35c562152ca43ede8e99e16e4a28fc7ed8bae5fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

A bad copy/paste lead to the LICENSE variable using the wrong
prefix. Thanks to check-package, this was detected, and is now fixed
by this commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-device-serialport/perl-device-serialport.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl-device-serialport/perl-device-serialport.mk b/package/perl-device-serialport/perl-device-serialport.mk
index a87a7447bd..d9c61e9486 100644
--- a/package/perl-device-serialport/perl-device-serialport.mk
+++ b/package/perl-device-serialport/perl-device-serialport.mk
@@ -7,7 +7,7 @@
 PERL_DEVICE_SERIALPORT_VERSION = 1.04
 PERL_DEVICE_SERIALPORT_SOURCE = Device-SerialPort-$(PERL_DEVICE_SERIALPORT_VERSION).tar.gz
 PERL_DEVICE_SERIALPORT_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CO/COOK
-PERL_DBI_LICENSE = Artistic or GPL-1.0+
+PERL_DEVICE_SERIALPORT_LICENSE = Artistic or GPL-1.0+
 PERL_DEVICE_SERIALPORT_LICENSE_FILES = README
 
 $(eval $(perl-package))
