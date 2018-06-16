From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 16 Jun 2018 10:16:47 +0200
Subject: [Buildroot] [PATCH 27/34] perl-netaddr-ip: add license hash
In-Reply-To: <20180616081654.34649-1-francois.perrad@gadz.org>
References: <20180616081654.34649-1-francois.perrad@gadz.org>
Message-ID: <20180616081654.34649-27-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-netaddr-ip/perl-netaddr-ip.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.hash b/package/perl-netaddr-ip/perl-netaddr-ip.hash
index fde62b122..ce0477d97 100644
--- a/package/perl-netaddr-ip/perl-netaddr-ip.hash
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.hash
@@ -1,3 +1,7 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
 md5    990dfcbffae356835c536e8ab56a2880 NetAddr-IP-4.079.tar.gz
 sha256 ec5a82dfb7028bcd28bb3d569f95d87dd4166cc19867f2184ed3a59f6d6ca0e7 NetAddr-IP-4.079.tar.gz
+
+# computed by scancpan
+sha256 b7fd9b73ea99602016a326e0b62e6646060d18febdd065ceca8bb482208c3d88 Artistic
+sha256 773a84089e32147cffef4c6fa127a14658c8c5866987d71d86f0fe22161780f4 Copying
-- 
2.17.1
