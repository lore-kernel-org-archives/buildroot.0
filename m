From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 22:48:46 +0100
Subject: [Buildroot] [git commit branch/next] ruby: bump version to 2.3.2
Message-ID: <20161115220730.9534181D38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbe981184cc1b4909b3f18d653109075d21458cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 7e62744..d480f07 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,2 +1,2 @@
-# From https://www.ruby-lang.org/en/news/2016/04/26/ruby-2-3-1-released/
-sha256	6725b5534d5a3a21ec4f14d6d7b9921a0d00d08acb88fd04cd50b47b70496338	ruby-2.3.1.tar.xz
+# From https://www.ruby-lang.org/en/news/2016/11/15/ruby-2-3-2-released/
+sha256 5c78f311045ce48160092160444dec2744941a5e37d7865032978bd5bf392f0c  ruby-2.3.2.tar.xz
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index f3f8047..631f270 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.3
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
 RUBY_VERSION_EXT = 2.3.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
