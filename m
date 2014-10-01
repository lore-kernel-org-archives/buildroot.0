From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  1 Oct 2014 19:39:57 -0300
Subject: [Buildroot] [PATCH 2/2] ruby: bump to version 2.1.3
In-Reply-To: <1412203197-1167-1-git-send-email-gustavo@zacarias.com.ar>
References: <1412203197-1167-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1412203197-1167-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ruby/ruby.hash | 2 ++
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/ruby/ruby.hash

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
new file mode 100644
index 0000000..3d17e8c
--- /dev/null
+++ b/package/ruby/ruby.hash
@@ -0,0 +1,2 @@
+# From https://www.ruby-lang.org/en/downloads/
+md5	74a37b9ad90e4ea63c0eed32b9d5b18f	ruby-2.1.3.tar.gz
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index bf34189..40025b0 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.1
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
 RUBY_VERSION_EXT = 2.1.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
-- 
2.0.4
