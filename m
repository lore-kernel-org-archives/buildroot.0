From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 May 2012 10:33:37 -0300
Subject: [Buildroot] [PATCH] ruby: security bump to 1.9.2-p320
Message-ID: <1335965617-11469-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Security Fix for RubyGems: SSL server verification failure for remote
repository.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ruby/ruby.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index c984d67..d89c25b 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-RUBY_VERSION = 1.9.2-p290
+RUBY_VERSION = 1.9.2-p320
 RUBY_SITE = ftp://ftp.ruby-lang.org/pub/ruby/1.9
 RUBY_AUTORECONF = YES
 HOST_RUBY_AUTORECONF = YES
-- 
1.7.3.4
