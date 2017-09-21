From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 13:17:09 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] ruby: bump version to
	2.4.1
Message-ID: <20170921111147.EE201810D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38b5b4968925dddccd8173dd0b6f6a9a5c7c7eaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 81de172d11d95a27eac5bc7ad24303cc0cff0b73)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 19722a3..624ce40 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,2 +1,2 @@
-# From https://www.ruby-lang.org/en/news/2016/12/25/ruby-2-4-0-released/
-sha256 3a87fef45cba48b9322236be60c455c13fd4220184ce7287600361319bb63690  ruby-2.4.0.tar.xz
+# From https://www.ruby-lang.org/en/news/2017/03/22/ruby-2-4-1-released/
+sha256 4fc8a9992de3e90191de369270ea4b6c1b171b7941743614cc50822ddc1fe654  ruby-2.4.1.tar.xz
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index f0dc63b..d0a81f1 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 2.4
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).0
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
 RUBY_VERSION_EXT = 2.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
