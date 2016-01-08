From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Jan 2016 15:48:36 -0300
Subject: [Buildroot] [PATCH] ruby: bump to version 2.3.0
Message-ID: <1452278916-1504-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 06faed6..3499263 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,2 +1,2 @@
-# From https://www.ruby-lang.org/en/news/2015/12/16/ruby-2-2-4-released/
-sha256	d28bff4641e382681c58072ddc244d025ac47ff71dd9426a92fcfc3830d1773c	ruby-2.2.4.tar.xz
+# From https://www.ruby-lang.org/en/news/2015/12/25/ruby-2-3-0-released/
+sha256	70125af0cfd7048e813a5eecab3676249582bfb65cfd57b868c3595f966e4097	ruby-2.3.0.tar.xz
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index fd8be90..19b33de 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RUBY_VERSION_MAJOR = 2.2
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).4
-RUBY_VERSION_EXT = 2.2.0
+RUBY_VERSION_MAJOR = 2.3
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).0
+RUBY_VERSION_EXT = 2.3.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
-- 
2.4.10
