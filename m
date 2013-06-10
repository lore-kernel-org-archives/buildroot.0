From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Jun 2013 20:55:30 -0300
Subject: [Buildroot] [PATCH] ruby: security bump to version 1.9.3-p429
Message-ID: <1370908530-23706-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-2065.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ruby/ruby.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index e708262..020cd76 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUBY_VERSION = 1.9.3-p392
+RUBY_VERSION = 1.9.3-p429
 RUBY_SITE = ftp://ftp.ruby-lang.org/pub/ruby/1.9
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
 HOST_RUBY_DEPENDENCIES = host-pkgconf
-- 
1.8.1.5
