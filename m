From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Sep 2015 13:11:57 +0200
Subject: [Buildroot] [git commit] ruby: bump to version 2.2.3
Message-ID: <20150901112046.4FCA480E3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed5c939dfb2dc76fd0b824d2f0eacc232ffddc21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.hash |    4 ++--
 package/ruby/ruby.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 4680a61..4a1861c 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,2 +1,2 @@
-# From https://www.ruby-lang.org/en/news/2015/04/13/ruby-2-2-2-released/
-sha256	f033b5d08ab57083e48c1d81bcd7399967578c370b664da90e12a32891424462	ruby-2.2.2.tar.xz
+# From https://www.ruby-lang.org/en/news/2015/08/18/ruby-2-2-3-released/
+sha256	c6ec90e9ed018e6d9a578fc93755d8565839908d5796809e1aecd1798c7ea8a7	ruby-2.2.3.tar.xz
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 2fa6b4e..243cd0b 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.2
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
 RUBY_VERSION_EXT = 2.2.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
