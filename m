From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jun 2019 16:20:38 +0200
Subject: [Buildroot] [git commit] package/perl-net-http: bump to version 6.19
Message-ID: <20190610142045.AAEDD800B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=446f6531573ffc411262fc26059727b0d6e3a699
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/perl-net-http/perl-net-http.hash | 4 ++--
 package/perl-net-http/perl-net-http.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-http/perl-net-http.hash b/package/perl-net-http/perl-net-http.hash
index 0dd9964953..5c93ad1176 100644
--- a/package/perl-net-http/perl-net-http.hash
+++ b/package/perl-net-http/perl-net-http.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    6da11a7db0e933b7684148e1fb32006a Net-HTTP-6.18.tar.gz
-sha256 7e42df2db7adce3e0eb4f78b88c450f453f5380f120fd5411232e03374ba951c Net-HTTP-6.18.tar.gz
+md5    6cbebcc76099ce822f0aa7764af11f73 Net-HTTP-6.19.tar.gz
+sha256 52b76ec13959522cae64d965f15da3d99dcb445eddd85d2ce4e4f4df385b2fc4 Net-HTTP-6.19.tar.gz
 
 # computed by scancpan
 sha256 49fbcc80e17295888b909176a0029f275a8c17b6cbfaf8867fe571ebe9a9ca79 LICENSE
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index da65450eaf..c7d0e3d0aa 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_HTTP_VERSION = 6.18
+PERL_NET_HTTP_VERSION = 6.19
 PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
 PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_NET_HTTP_LICENSE = Artistic or GPL-1.0+
