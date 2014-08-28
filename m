From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Aug 2014 00:17:39 +0200
Subject: [Buildroot] [PATCH 3/3] ruby: bump to version 2.1.2
In-Reply-To: <1409264259-13058-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1409264259-13058-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1409264259-13058-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps Ruby to version 2.1.2. It was quickly runtime tested
on ARM EBIhf.

In addition to this it changes the site to an http:// location, which
is the official one advertised on the Ruby web site.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/ruby.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index b84aaf3..297e902 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-RUBY_VERSION_MAJOR = 1.9
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).3-p545
-# 1.9.1 directory used for extensions
-RUBY_VERSION_EXT = 1.9.1
-RUBY_SITE = ftp://ftp.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
+RUBY_VERSION_MAJOR = 2.1
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
+RUBY_VERSION_EXT = 2.1.0
+RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
 HOST_RUBY_DEPENDENCIES = host-pkgconf
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
-- 
2.0.0
