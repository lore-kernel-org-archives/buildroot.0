From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  8 Oct 2013 21:02:33 +0200
Subject: [Buildroot] [PATCH 3/3] ruby: fix license info
In-Reply-To: <1381258953-13487-1-git-send-email-arnout@mind.be>
References: <1381258953-13487-1-git-send-email-arnout@mind.be>
Message-ID: <1381258953-13487-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Based on the contents of LEGAL, without checking the code.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ruby/ruby.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.8.4.rc3
