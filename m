From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Fri, 27 Jul 2018 21:54:23 +0200
Subject: [Buildroot] [PATCH 5/5] perl-net-telnet: add missing license
 declaration
In-Reply-To: <20180727195423.21338-1-thomas.de_schampheleire@nokia.com>
References: <20180727195423.21338-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180727195423.21338-6-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
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
-- 
2.16.4
