From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 24 Apr 2020 16:18:36 +0200
Subject: [Buildroot] [PATCH 5/8] package/moo: bump to version 2.004000
In-Reply-To: <20200424141839.1594-1-francois.perrad@gadz.org>
References: <20200424141839.1594-1-francois.perrad@gadz.org>
Message-ID: <20200424141839.1594-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff LICENSE:
-This software is Copyright (c) 2019 by mst - Matt S. Trout (cpan:MSTROUT) <mst@shadowcat.co.uk>.
+This software is Copyright (c) 2020 by mst - Matt S. Trout (cpan:MSTROUT) <mst@shadowcat.co.uk>.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-moo/perl-moo.hash | 6 +++---
 package/perl-moo/perl-moo.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-moo/perl-moo.hash b/package/perl-moo/perl-moo.hash
index 21bcc6cca..00e8117ad 100644
--- a/package/perl-moo/perl-moo.hash
+++ b/package/perl-moo/perl-moo.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    53af7e7849492a8e3994ee379d12e348 Moo-2.003006.tar.gz
-sha256 bcb2092ab18a45005b5e2e84465ebf3a4999d8e82a43a09f5a94d859ae7f2472 Moo-2.003006.tar.gz
+md5  e542104553d616b15631b5c66ccee904  Moo-2.004000.tar.gz
+sha256  323240d000394cf38ec42e865b05cb8928f625c82c9391cd2cdc72b33c51b834  Moo-2.004000.tar.gz
 
 # computed by scancpan
-sha256 88f4a8719c584d756dcfeebc7f35643066354188bfb57c672fbafcd44e044e9c LICENSE
+sha256  0f2d6b537f7a735c981511875d832bc8ff767bf97d62848cf0bada964e40aadd  LICENSE
diff --git a/package/perl-moo/perl-moo.mk b/package/perl-moo/perl-moo.mk
index 691377640..fce88f6ad 100644
--- a/package/perl-moo/perl-moo.mk
+++ b/package/perl-moo/perl-moo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOO_VERSION = 2.003006
+PERL_MOO_VERSION = 2.004000
 PERL_MOO_SOURCE = Moo-$(PERL_MOO_VERSION).tar.gz
 PERL_MOO_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_MOO_LICENSE = Artistic or GPL-1.0+
-- 
2.20.1
