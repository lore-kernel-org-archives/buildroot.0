From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Apr 2021 15:53:50 +0200
Subject: [Buildroot] [git commit] package/perl-http-message: bump version to
 6.29
Message-ID: <20210403132859.8D80D8A2E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0c8ab2246a63876a86155b4588b86fb8682186d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-http-message/perl-http-message.hash | 4 ++--
 package/perl-http-message/perl-http-message.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index 4e406c9d46..a074bb4cb5 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  4b4038aef74f63c2b6baca189c6c6602  HTTP-Message-6.27.tar.gz
-sha256  0be0f720fbbbdbae8711f6eec9b2f0d34bd5ed5046fc66b80dc3b42017c1e699  HTTP-Message-6.27.tar.gz
+md5  058f0598ee52a816ccb1d9dceb798520  HTTP-Message-6.29.tar.gz
+sha256  f4417970679e08f6deb0609009aa9515dee0c8d91dbadd6b86a26e2b8e0d6341  HTTP-Message-6.29.tar.gz
 
 # computed by scancpan
 sha256  1379396dcd2291f17a741d2d6bf14d379f5f2ab91b3c7e7b92c5f82856e2d7ac  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 72b94356be..1b3a93d7c2 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.27
+PERL_HTTP_MESSAGE_VERSION = 6.29
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_LICENSE = Artistic or GPL-1.0+
