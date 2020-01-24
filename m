From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 24 Jan 2020 18:11:02 +0100
Subject: [Buildroot] [PATCH 1/6] package/perl-filesys-notify-simple: bump to
 version 0.14
Message-ID: <20200124171107.26086-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the year of LICENSE was upgraded:
- This software is copyright (c) 2018 by Tatsuhiko Miyagawa <miyagawa@bulknews.net>.
+ This software is copyright (c) 2020 by Tatsuhiko Miyagawa <miyagawa@bulknews.net>.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-filesys-notify-simple.hash                         | 6 +++---
 .../perl-filesys-notify-simple.mk                           | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-filesys-notify-simple/perl-filesys-notify-simple.hash b/package/perl-filesys-notify-simple/perl-filesys-notify-simple.hash
index a48394504..87d365d6c 100644
--- a/package/perl-filesys-notify-simple/perl-filesys-notify-simple.hash
+++ b/package/perl-filesys-notify-simple/perl-filesys-notify-simple.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    6042cd96abcc7bf69f959142d00b8143 Filesys-Notify-Simple-0.13.tar.gz
-sha256 ade3d3db882ce2137e527201893d4b8c12b2dbd15009bb89c31cb91ba6495ba2 Filesys-Notify-Simple-0.13.tar.gz
+md5    4a3ca3098b2455346fe24a66c94d2151 Filesys-Notify-Simple-0.14.tar.gz
+sha256 1fda712d4ba5e1868159ed35f6f8efbfae9d435d6376f5606d533bcb080555a4 Filesys-Notify-Simple-0.14.tar.gz
 
 # computed by scancpan
-sha256 bd61ca40272d971750f0a2bd0122629865355c5f4a2aa9e70c0d325e75d0da3a LICENSE
+sha256 9a5cceb9fdb0064b57eeca0e7ad2af1e57eff51320a13083fc22930d2a190ed7 LICENSE
diff --git a/package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk b/package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk
index bb48f2278..62bc80c9f 100644
--- a/package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk
+++ b/package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_FILESYS_NOTIFY_SIMPLE_VERSION = 0.13
+PERL_FILESYS_NOTIFY_SIMPLE_VERSION = 0.14
 PERL_FILESYS_NOTIFY_SIMPLE_SOURCE = Filesys-Notify-Simple-$(PERL_FILESYS_NOTIFY_SIMPLE_VERSION).tar.gz
 PERL_FILESYS_NOTIFY_SIMPLE_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
 PERL_FILESYS_NOTIFY_SIMPLE_LICENSE = Artistic or GPL-1.0+
-- 
2.20.1
