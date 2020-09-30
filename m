From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 30 Sep 2020 12:23:19 +0200
Subject: [Buildroot] [PATCH] ruby: update to 2.7.1
Message-ID: <20200930102319.wj7h72pq7aqcykec@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 89cab3fcd3..e9f53879b1 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-4-10-released/
-sha256 d5668ed11544db034f70aec37d11e157538d639ed0d0a968e2f587191fc530df  ruby-2.4.10.tar.xz
+# Locally calculated
+sha256 b224f9844646cc92765df8288a46838511c1cec5b550d8874bd4686a904fcee7  ruby-2.7.1.tar.xz
 # License files, Locally calculated
 sha256 609292a6d848ab223073944fc2d844449391a5ba2055a8b5baf1726bc13b39cb  LEGAL
 sha256 f5eb1b2956d5f7a67b2e5722a3749bc2fe86f9c580f2e3f5a08519cf073b5864  COPYING
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 6f8cb319cb..02f43814fd 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RUBY_VERSION_MAJOR = 2.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).10
-RUBY_VERSION_EXT = 2.4.0
+RUBY_VERSION_MAJOR = 2.7
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
+RUBY_VERSION_EXT = 2.7.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
-- 
2.11.0
