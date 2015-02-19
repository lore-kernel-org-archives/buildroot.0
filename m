From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:41:06 +0100
Subject: [Buildroot] [git commit] perl: bump to version 5.20.2
Message-ID: <20150302222720.23199807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=671301e6b56418098eeccdf6c9be82f48de1be8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/perl.hash |    8 ++++----
 package/perl/perl.mk   |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index f287eaa..ac7bafe 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.20.1.tar.bz2.{md5,sha1,sha256}.txt
-md5    ede5166f949d9a07163bc5b086be9759                                 perl-5.20.1.tar.bz2
-sha1   cd424d1520ba2686fe5d4422565aaf880e9467f6                         perl-5.20.1.tar.bz2
-sha256 ede5ded37e7fb6139b04728cfca826f17076f9888dbfd100a56834dbeb04657c perl-5.20.1.tar.bz2
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.20.2.tar.bz2.{md5,sha1,sha256}.txt
+md5    21062666f1c627aeb6dbff3c6952738b                                 perl-5.20.2.tar.bz2
+sha1   63126c683b4c79c35008a47d56f7beae876c569f                         perl-5.20.2.tar.bz2
+sha256 e5a4713bc65e1da98ebd833dce425c000768bfe84d17ec5183ec5ca249db71ab perl-5.20.2.tar.bz2
 
 # No upstream hashes for the following
 sha256 614f320d45042ca179a15ec88c6a15ff68e6f36fb004ee89efa71e42bda1dead perl-5.20.1-cross-0.9.4.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index b1f2101..0636aba 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PERL_VERSION_MAJOR = 20
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
 PERL_LICENSE = Artistic or GPLv1+
