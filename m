From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 Apr 2015 17:54:29 -0300
Subject: [Buildroot] [PATCH] ruby: security bump to version 2.2.2
Message-ID: <1428958469-19720-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2015-1855 - OpenSSL extension?s hostname verification vulnerability.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 6fa47a4..4680a61 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,2 +1,2 @@
-# From https://www.ruby-lang.org/en/news/2015/03/03/ruby-2-2-1-released/
-sha256	3b2852c07fdc12d0ba2b5698c7587ae2b46141539a526d143da5860b55a626c0	ruby-2.2.1.tar.xz
+# From https://www.ruby-lang.org/en/news/2015/04/13/ruby-2-2-2-released/
+sha256	f033b5d08ab57083e48c1d81bcd7399967578c370b664da90e12a32891424462	ruby-2.2.2.tar.xz
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 2e2adfd..552da07 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.2
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
 RUBY_VERSION_EXT = 2.2.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
-- 
2.0.5
