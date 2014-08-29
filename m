From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Aug 2014 09:56:11 +0200
Subject: [Buildroot] [git commit branch/next] ruby: bump to version 2.1.2
Message-ID: <20140829075626.E662C9D10D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa7e146c9c533ce02c52e95da9becdeed5f64900
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit bumps Ruby to version 2.1.2. It was quickly runtime tested
on ARM EBIhf.

In addition to this it changes the site to an http:// location, which
is the official one advertised on the Ruby web site.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.mk |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 66556c3..247d116 100644
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
