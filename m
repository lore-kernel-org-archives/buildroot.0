From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 21 Nov 2016 13:43:06 +0000
Subject: [Buildroot] [PATCH next] ruby: bump version to 2.3.3
Message-ID: <20161121134306.7272-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index d480f07..8182e2c 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,2 +1,2 @@
-# From https://www.ruby-lang.org/en/news/2016/11/15/ruby-2-3-2-released/
-sha256 5c78f311045ce48160092160444dec2744941a5e37d7865032978bd5bf392f0c  ruby-2.3.2.tar.xz
+# From https://www.ruby-lang.org/en/news/2016/11/21/ruby-2-3-3-released/
+sha256 1a4fa8c2885734ba37b97ffdb4a19b8fba0e8982606db02d936e65bac07419dc  ruby-2.3.3.tar.xz
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 631f270..b8e03ac 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.3
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
 RUBY_VERSION_EXT = 2.3.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
-- 
2.10.1
