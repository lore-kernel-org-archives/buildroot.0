From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 22:40:44 +0200
Subject: [Buildroot] [git commit] ruby: fix license info
Message-ID: <20131008204238.B4F779B8ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a26628bf3dcd20d9b7d27d53bc5e2752cf515dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on the contents of LEGAL, without checking the code.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index ba2d49b..2188837 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -12,8 +12,8 @@ RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_MAKE = $(MAKE1)
 RUBY_CONF_OPT = --disable-install-doc --disable-rpath
 HOST_RUBY_CONF_OPT = --disable-install-doc --with-out-ext=curses,readline
-RUBY_LICENSE = Ruby
-RUBY_LICENSE_FILES = LEGAL
+RUBY_LICENSE = Ruby or BSD-2c, BSD-3c, others
+RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 
 # Force optionals to build before we do
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
