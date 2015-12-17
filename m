From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 12:56:25 +0100
Subject: [Buildroot] [git commit] ruby: security bump to version 2.2.4
Message-ID: <20151217115704.C9554821FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ce39dd0489ebb066bb8d53ff1649a596052bb21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-7551 - Unsafe tainted string usage in Fiddle and DL

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 4a1861c..06faed6 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,2 +1,2 @@
-# From https://www.ruby-lang.org/en/news/2015/08/18/ruby-2-2-3-released/
-sha256	c6ec90e9ed018e6d9a578fc93755d8565839908d5796809e1aecd1798c7ea8a7	ruby-2.2.3.tar.xz
+# From https://www.ruby-lang.org/en/news/2015/12/16/ruby-2-2-4-released/
+sha256	d28bff4641e382681c58072ddc244d025ac47ff71dd9426a92fcfc3830d1773c	ruby-2.2.4.tar.xz
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 17104b6..fd8be90 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.2
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).4
 RUBY_VERSION_EXT = 2.2.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
