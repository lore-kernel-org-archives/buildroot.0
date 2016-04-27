From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 22:15:30 +0200
Subject: [Buildroot] [git commit] ruby: bump to version 2.3.1
Message-ID: <20160427201534.A635181D60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22001b26323bc2e41eef4c31a8c2fff60de48023
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 3499263..7e62744 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,2 +1,2 @@
-# From https://www.ruby-lang.org/en/news/2015/12/25/ruby-2-3-0-released/
-sha256	70125af0cfd7048e813a5eecab3676249582bfb65cfd57b868c3595f966e4097	ruby-2.3.0.tar.xz
+# From https://www.ruby-lang.org/en/news/2016/04/26/ruby-2-3-1-released/
+sha256	6725b5534d5a3a21ec4f14d6d7b9921a0d00d08acb88fd04cd50b47b70496338	ruby-2.3.1.tar.xz
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 19b33de..3b8310c 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.3
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).0
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
 RUBY_VERSION_EXT = 2.3.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
