From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Jun 2020 22:34:11 +0200
Subject: [Buildroot] [git commit] package/perl-http-daemon: bump to version
 6.12
Message-ID: <20200605203650.7BEAF82616@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b7cc165cc37c0cf689420b76b308a6cafdae797
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-http-daemon/perl-http-daemon.hash | 6 +++---
 package/perl-http-daemon/perl-http-daemon.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-daemon/perl-http-daemon.hash b/package/perl-http-daemon/perl-http-daemon.hash
index b2e5dbceb3..f8272a4fce 100644
--- a/package/perl-http-daemon/perl-http-daemon.hash
+++ b/package/perl-http-daemon/perl-http-daemon.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    c5d6e1d84f7f09770d9ce52d4bddef59 HTTP-Daemon-6.06.tar.gz
-sha256 fc03a161b54553f766457a4267e7066767f54ad01cacfe9a91d7caa2a0319bad HTTP-Daemon-6.06.tar.gz
+md5  63674e3f81760a29075853413eb157d8  HTTP-Daemon-6.12.tar.gz
+sha256  df47bed10c38670c780fd0116867d5fd4693604acde31ba63380dce04c4e1fa6  HTTP-Daemon-6.12.tar.gz
 
 # computed by scancpan
-sha256 e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc LICENCE
+sha256  e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc  LICENCE
diff --git a/package/perl-http-daemon/perl-http-daemon.mk b/package/perl-http-daemon/perl-http-daemon.mk
index 3fb89db924..e475072628 100644
--- a/package/perl-http-daemon/perl-http-daemon.mk
+++ b/package/perl-http-daemon/perl-http-daemon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_DAEMON_VERSION = 6.06
+PERL_HTTP_DAEMON_VERSION = 6.12
 PERL_HTTP_DAEMON_SOURCE = HTTP-Daemon-$(PERL_HTTP_DAEMON_VERSION).tar.gz
 PERL_HTTP_DAEMON_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_DAEMON_DEPENDENCIES = host-perl-module-build-tiny
