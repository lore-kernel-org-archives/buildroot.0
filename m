From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Oct 2018 21:20:15 +0200
Subject: [Buildroot] [git commit] perl-net-ping: bump to version 2.71
Message-ID: <20181026191920.210BA8910C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a88a6c04f7cfaa62d322ed071c972623b6b3587
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file hash is changed due to:

 - Changes in the README file unrelated to the licensing terms.
 - Update of the copyright year (2017 changed to 2017-2018)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-ping/perl-net-ping.hash | 6 +++---
 package/perl-net-ping/perl-net-ping.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-net-ping/perl-net-ping.hash b/package/perl-net-ping/perl-net-ping.hash
index 363d095386..c3bff0339d 100644
--- a/package/perl-net-ping/perl-net-ping.hash
+++ b/package/perl-net-ping/perl-net-ping.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    0b01ada2bc588330456924393d47ed11 Net-Ping-2.68.tar.gz
-sha256 d01ac2fcdf684c4a23a07104fbb147cfbdbda47fd5b660912124258f29afd7e3 Net-Ping-2.68.tar.gz
+md5    58110451d15d27b46ebc6a53f1697ff1 Net-Ping-2.71.tar.gz
+sha256 0819d0aa87b173e98ecb3ccfd92272ce53c7fc9e86f962f64602a6fa477f7d4f Net-Ping-2.71.tar.gz
 
 # computed by scancpan
-sha256 eb4ad254a468a977f29849efda0183f69b7f4ede0f7123e0dd5768207ee73c58 README
+sha256 9441a22309a2b40ff1282ac1906c137f07f5e521e7b1ec162b251f6006051b47 README
diff --git a/package/perl-net-ping/perl-net-ping.mk b/package/perl-net-ping/perl-net-ping.mk
index 0b863008e0..5e8f53be1e 100644
--- a/package/perl-net-ping/perl-net-ping.mk
+++ b/package/perl-net-ping/perl-net-ping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_PING_VERSION = 2.68
+PERL_NET_PING_VERSION = 2.71
 PERL_NET_PING_SOURCE = Net-Ping-$(PERL_NET_PING_VERSION).tar.gz
 PERL_NET_PING_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_NET_PING_LICENSE = Artistic or GPL-1.0+
