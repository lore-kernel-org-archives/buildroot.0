From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 15 Aug 2012 16:38:23 +0200
Subject: [Buildroot] [PATCH 01/12] microperl: add license info
Message-ID: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/microperl/microperl.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index fbf319c..b2a912a 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -7,6 +7,8 @@
 MICROPERL_VERSION = 5.12.4
 MICROPERL_SITE = http://www.cpan.org/src/5.0
 MICROPERL_SOURCE = perl-$(MICROPERL_VERSION).tar.bz2
+MICROPERL_LICENSE = Artistic
+MICROPERL_LICENSE_FILES = Artistic
 MICROPERL_DEPENDENCIES = host-microperl
 MICROPERL_MODS_DIR = /usr/lib/perl5/$(MICROPERL_VERSION)
 MICROPERL_ARCH_DIR = $(MICROPERL_MODS_DIR)/$(GNU_TARGET_NAME)
-- 
1.7.9.5
