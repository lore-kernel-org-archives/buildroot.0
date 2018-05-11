From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 11 May 2018 13:58:08 +0200
Subject: [Buildroot] [PATCH/next 5/6] package/perl-mailtools: bump version
 to 2.20
In-Reply-To: <20180511115809.1647-1-bernd.kuhls@t-online.de>
References: <20180511115809.1647-1-bernd.kuhls@t-online.de>
Message-ID: <20180511115809.1647-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/perl-mailtools/perl-mailtools.hash | 6 ++++--
 package/perl-mailtools/perl-mailtools.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/perl-mailtools/perl-mailtools.hash b/package/perl-mailtools/perl-mailtools.hash
index cb33453ecd..9fb91cbd26 100644
--- a/package/perl-mailtools/perl-mailtools.hash
+++ b/package/perl-mailtools/perl-mailtools.hash
@@ -1,3 +1,5 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    a00b9d3c3dec64bd15de8c50f1b73d05 MailTools-2.19.tar.gz
-sha256 c17ed702efea8eab56fe92961c07cd4980cee26ca6f13aff2688dc8af69c5e1a MailTools-2.19.tar.gz
+md5    53e9d35256c3fd7cef0e4a24b15e9512 MailTools-2.20.tar.gz
+sha256 f55606f7a9cc342ee9d5f996e2b6a4c0047e2ee47cd88c3250ecf0d0c5fb3196 MailTools-2.20.tar.gz
+# Locally computed
+sha256 734d5b1bd212de832aea99e94c98d56217ea9519d900a29c0547538f596a9b26  README
diff --git a/package/perl-mailtools/perl-mailtools.mk b/package/perl-mailtools/perl-mailtools.mk
index 75079f9e8b..ae595bbfcf 100644
--- a/package/perl-mailtools/perl-mailtools.mk
+++ b/package/perl-mailtools/perl-mailtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MAILTOOLS_VERSION = 2.19
+PERL_MAILTOOLS_VERSION = 2.20
 PERL_MAILTOOLS_SOURCE = MailTools-$(PERL_MAILTOOLS_VERSION).tar.gz
 PERL_MAILTOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MA/MARKOV
 PERL_MAILTOOLS_DEPENDENCIES = perl-timedate
-- 
2.14.2
