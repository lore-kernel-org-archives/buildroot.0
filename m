From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 22:46:48 +0100
Subject: [Buildroot] [git commit] ruby: security bump to version 2.1.4
Message-ID: <20141027214657.9A91FB1A31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ba2a5c73714b3590251ad39499b35f363c402e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2014-8080 - Denial of service XML expansion

And change default ext/openssl settings WRT CVE-2014-3566.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/ruby.hash |    4 ++--
 package/ruby/ruby.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 3d17e8c..8d5d133 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,2 +1,2 @@
-# From https://www.ruby-lang.org/en/downloads/
-md5	74a37b9ad90e4ea63c0eed32b9d5b18f	ruby-2.1.3.tar.gz
+# From https://www.ruby-lang.org/en/news/2014/10/27/ruby-2-1-4-released/
+sha256	bf9952cdeb3a0c6a5a27745c9b4c0e5e264e92b669b2b08efb363f5156549204	ruby-2.1.4.tar.gz
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index e633ee4..36f6d3f 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.1
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).4
 RUBY_VERSION_EXT = 2.1.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
