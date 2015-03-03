From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Mar 2015 21:55:45 +0100
Subject: [Buildroot] [git commit] ruby: bump to version 2.2.1
Message-ID: <20150303212043.E39DA7FF09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ada937a94b7e43bc4d46973946e24590064a7923
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.hash |    4 ++--
 package/ruby/ruby.mk   |    7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 9d56eee..6fa47a4 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,2 +1,2 @@
-# From https://www.ruby-lang.org/en/news/2014/11/13/ruby-2-1-5-is-released/
-sha256	4305cc6ceb094df55210d83548dcbeb5117d74eea25196a9b14fa268d354b100	ruby-2.1.5.tar.gz
+# From https://www.ruby-lang.org/en/news/2015/03/03/ruby-2-2-1-released/
+sha256	3b2852c07fdc12d0ba2b5698c7587ae2b46141539a526d143da5860b55a626c0	ruby-2.2.1.tar.xz
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 00a785c..d44237a 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-RUBY_VERSION_MAJOR = 2.1
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).5
-RUBY_VERSION_EXT = 2.1.0
+RUBY_VERSION_MAJOR = 2.2
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
+RUBY_VERSION_EXT = 2.2.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
+RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
 HOST_RUBY_DEPENDENCIES = host-pkgconf
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
