From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Apr 2015 15:54:43 +0200
Subject: [Buildroot] [PATCH 1/6] package/perl-netaddr-ip: Add host variant
Message-ID: <1429970088-593-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed to make Mail-SpamAssassin?s dependency check happy.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/perl-netaddr-ip/perl-netaddr-ip.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.mk b/package/perl-netaddr-ip/perl-netaddr-ip.mk
index e8ace9d..aaa3ef0 100644
--- a/package/perl-netaddr-ip/perl-netaddr-ip.mk
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.mk
@@ -14,3 +14,4 @@ PERL_NETADDR_IP_LICENSE_FILES = Artistic Copying
 PERL_NETADDR_IP_CONF_OPTS = -noxs
 
 $(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
1.7.10.4
