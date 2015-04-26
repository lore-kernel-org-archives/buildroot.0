From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Apr 2015 11:37:17 +0200
Subject: [Buildroot] [PATCH v2 4/6] package/perl-net-dns: Add host variant
In-Reply-To: <1430041039-13905-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430041039-13905-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1430041039-13905-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed to make Mail-SpamAssassin?s dependency check happy.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/perl-net-dns/perl-net-dns.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index 75c0a1b..e25d615 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -12,3 +12,4 @@ PERL_NET_DNS_LICENSE = Artistic or GPLv1+
 PERL_NET_DNS_LICENSE_FILES = README
 
 $(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
1.7.10.4
