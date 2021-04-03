From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Apr 2021 15:53:55 +0200
Subject: [Buildroot] [git commit] package/perl-net-http: bump version to 6.21
Message-ID: <20210403132900.001CA8A2E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b652f8c1c147a4135495368b02f29f192b9115a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-http/perl-net-http.hash | 4 ++--
 package/perl-net-http/perl-net-http.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-http/perl-net-http.hash b/package/perl-net-http/perl-net-http.hash
index 42ae6bd979..85ddad6eea 100644
--- a/package/perl-net-http/perl-net-http.hash
+++ b/package/perl-net-http/perl-net-http.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  00f825fb848d50202aeec074c3608453  Net-HTTP-6.20.tar.gz
-sha256  92527b2a24512961b8e3637c6216a057751e39b6fa751422ed181ff599779f1e  Net-HTTP-6.20.tar.gz
+md5  dbe27483034a79a7d43f61cc48540641  Net-HTTP-6.21.tar.gz
+sha256  375aa35b76be99f06464089174d66ac76f78ce83a5c92a907bbfab18b099eec4  Net-HTTP-6.21.tar.gz
 
 # computed by scancpan
 sha256  49fbcc80e17295888b909176a0029f275a8c17b6cbfaf8867fe571ebe9a9ca79  LICENSE
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index f8da631008..de0809d0b6 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_HTTP_VERSION = 6.20
+PERL_NET_HTTP_VERSION = 6.21
 PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
 PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_NET_HTTP_LICENSE = Artistic or GPL-1.0+
