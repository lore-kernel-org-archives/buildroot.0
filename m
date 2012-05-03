From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 May 2012 15:51:41 +0200
Subject: [Buildroot] [git commit] ruby: security bump to 1.9.2-p320
Message-ID: <20120503135217.688C096C68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=905c301de3faec72e2dea0d16606879eb2fea59c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Security Fix for RubyGems: SSL server verification failure for remote
repository.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
