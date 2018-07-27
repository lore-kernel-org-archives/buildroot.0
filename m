From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Jul 2018 23:51:51 +0200
Subject: [Buildroot] [git commit] perl-net-telnet: add missing license
 declaration
Message-ID: <20180727214915.55F81813AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36bc9d8b92b75a995ce3d6f04ef6efcde5495f6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-telnet/perl-net-telnet.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-net-telnet/perl-net-telnet.mk b/package/perl-net-telnet/perl-net-telnet.mk
index 04d170d10a..28568871e2 100644
--- a/package/perl-net-telnet/perl-net-telnet.mk
+++ b/package/perl-net-telnet/perl-net-telnet.mk
@@ -7,6 +7,7 @@
 PERL_NET_TELNET_VERSION = 3.04
 PERL_NET_TELNET_SOURCE = Net-Telnet-$(PERL_NET_TELNET_VERSION).tar.gz
 PERL_NET_TELNET_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JR/JROGERS
+PERL_NET_TELNET_LICENSE = Artistic or GPL-1.0+
 PERL_NET_TELNET_LICENSE_FILES = README
 
 $(eval $(perl-package))
