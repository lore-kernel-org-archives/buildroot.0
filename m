From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:26:46 +0100
Subject: [Buildroot] [git commit] package/perl-net-http: bump to version 6.20
Message-ID: <20210123200716.2813780296@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04334cd7d5372bf6b953738d8c9270fa4e00c257
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-http/perl-net-http.hash | 6 +++---
 package/perl-net-http/perl-net-http.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-net-http/perl-net-http.hash b/package/perl-net-http/perl-net-http.hash
index 5c93ad1176..42ae6bd979 100644
--- a/package/perl-net-http/perl-net-http.hash
+++ b/package/perl-net-http/perl-net-http.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    6cbebcc76099ce822f0aa7764af11f73 Net-HTTP-6.19.tar.gz
-sha256 52b76ec13959522cae64d965f15da3d99dcb445eddd85d2ce4e4f4df385b2fc4 Net-HTTP-6.19.tar.gz
+md5  00f825fb848d50202aeec074c3608453  Net-HTTP-6.20.tar.gz
+sha256  92527b2a24512961b8e3637c6216a057751e39b6fa751422ed181ff599779f1e  Net-HTTP-6.20.tar.gz
 
 # computed by scancpan
-sha256 49fbcc80e17295888b909176a0029f275a8c17b6cbfaf8867fe571ebe9a9ca79 LICENSE
+sha256  49fbcc80e17295888b909176a0029f275a8c17b6cbfaf8867fe571ebe9a9ca79  LICENSE
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index c7d0e3d0aa..f8da631008 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_HTTP_VERSION = 6.19
+PERL_NET_HTTP_VERSION = 6.20
 PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
 PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_NET_HTTP_LICENSE = Artistic or GPL-1.0+
