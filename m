From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Fri, 27 Jul 2018 21:54:22 +0200
Subject: [Buildroot] [PATCH 4/5] perl-net-ping: add missing license
 declaration
In-Reply-To: <20180727195423.21338-1-thomas.de_schampheleire@nokia.com>
References: <20180727195423.21338-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180727195423.21338-5-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
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
-- 
2.16.4
