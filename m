From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Oct 2014 12:06:46 +0200
Subject: [Buildroot] [git commit] ruby: bump to version 2.1.3
Message-ID: <20141002101332.A90589D55C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e651b2e5325f83a862a8711a1f4bd82beb43bb64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/ruby.hash |    2 ++
 package/ruby/ruby.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
new file mode 100644
index 0000000..3d17e8c
--- /dev/null
+++ b/package/ruby/ruby.hash
@@ -0,0 +1,2 @@
+# From https://www.ruby-lang.org/en/downloads/
+md5	74a37b9ad90e4ea63c0eed32b9d5b18f	ruby-2.1.3.tar.gz
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index bf34189..40025b0 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.1
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
 RUBY_VERSION_EXT = 2.1.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
