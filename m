From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 27 Apr 2016 11:25:08 +0100
Subject: [Buildroot] [PATCH 1/2] ruby: bump version to 2.3.1
Message-ID: <1461752709-37272-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 3499263..4e90eed 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,2 +1,2 @@
-# From https://www.ruby-lang.org/en/news/2015/12/25/ruby-2-3-0-released/
-sha256	70125af0cfd7048e813a5eecab3676249582bfb65cfd57b868c3595f966e4097	ruby-2.3.0.tar.xz
+# From https://www.ruby-lang.org/en/news/2016/04/26/ruby-2-3-1-released/
+sha256 6725b5534d5a3a21ec4f14d6d7b9921a0d00d08acb88fd04cd50b47b70496338  ruby-2.3.1.tar.xz
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 19b33de..728e43d 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.3
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).0
-RUBY_VERSION_EXT = 2.3.0
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
+RUBY_VERSION_EXT = 2.3.1
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
-- 
2.7.3
