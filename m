From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 13:57:41 +0100
Subject: [Buildroot] [git commit] perl-json-tiny: bump to version 0.50
Message-ID: <20141026125753.142A7B06A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be59a6879ebf95fb0119289d3a4f510ac141048e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-json-tiny/perl-json-tiny.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/perl-json-tiny/perl-json-tiny.mk b/package/perl-json-tiny/perl-json-tiny.mk
index 3adcb49..7ee611d 100644
--- a/package/perl-json-tiny/perl-json-tiny.mk
+++ b/package/perl-json-tiny/perl-json-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_JSON_TINY_VERSION = 0.49
+PERL_JSON_TINY_VERSION = 0.50
 PERL_JSON_TINY_SOURCE = JSON-Tiny-$(PERL_JSON_TINY_VERSION).tar.gz
 PERL_JSON_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAVIDO
 PERL_JSON_TINY_DEPENDENCIES = perl
