From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 13 Nov 2014 14:13:08 -0300
Subject: [Buildroot] [PATCH] ruby: security bump to version 2.1.5
Message-ID: <1415898788-28747-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2014-8090 - Another Denial Of Service XML Expansion.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 8d5d133..9d56eee 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,2 +1,2 @@
-# From https://www.ruby-lang.org/en/news/2014/10/27/ruby-2-1-4-released/
-sha256	bf9952cdeb3a0c6a5a27745c9b4c0e5e264e92b669b2b08efb363f5156549204	ruby-2.1.4.tar.gz
+# From https://www.ruby-lang.org/en/news/2014/11/13/ruby-2-1-5-is-released/
+sha256	4305cc6ceb094df55210d83548dcbeb5117d74eea25196a9b14fa268d354b100	ruby-2.1.5.tar.gz
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 36f6d3f..20a2a11 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.1
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).4
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).5
 RUBY_VERSION_EXT = 2.1.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
-- 
2.0.4
