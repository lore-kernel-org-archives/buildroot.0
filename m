From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Sep 2013 11:29:58 -0300
Subject: [Buildroot] [PATCH 2/2] ruby: security bump to version 1.9.3-p448
In-Reply-To: <1379428198-12458-1-git-send-email-gustavo@zacarias.com.ar>
References: <1379428198-12458-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1379428198-12458-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-4073.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ruby/ruby.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 020cd76..ba2d49b 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUBY_VERSION = 1.9.3-p429
+RUBY_VERSION = 1.9.3-p448
 RUBY_SITE = ftp://ftp.ruby-lang.org/pub/ruby/1.9
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
 HOST_RUBY_DEPENDENCIES = host-pkgconf
-- 
1.8.1.5
