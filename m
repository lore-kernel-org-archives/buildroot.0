From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Jul 2018 23:51:46 +0200
Subject: [Buildroot] [git commit] perl-net-ping: add missing license
 declaration
Message-ID: <20180727214915.4D054813AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7052c6fee0a6c5bda94d1fdce9b70d6b72b09cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-ping/perl-net-ping.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-net-ping/perl-net-ping.mk b/package/perl-net-ping/perl-net-ping.mk
index 3cd4cd0b47..51d8f13792 100644
--- a/package/perl-net-ping/perl-net-ping.mk
+++ b/package/perl-net-ping/perl-net-ping.mk
@@ -7,6 +7,7 @@
 PERL_NET_PING_VERSION = 2.68
 PERL_NET_PING_SOURCE = Net-Ping-$(PERL_NET_PING_VERSION).tar.gz
 PERL_NET_PING_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
+PERL_NET_PING_LICENSE = Artistic or GPL-1.0+
 PERL_NET_PING_LICENSE_FILES = README
 
 $(eval $(perl-package))
