From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Apr 2014 08:30:18 -0300
Subject: [Buildroot] [PATCH] ruby: bump to 1.9.3-p545
Message-ID: <1397475018-15022-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ruby/ruby.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index d651e82..0ea352d 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 1.9
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).3-p484
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).3-p545
 RUBY_SITE = ftp://ftp.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
 HOST_RUBY_DEPENDENCIES = host-pkgconf
-- 
1.8.3.2
