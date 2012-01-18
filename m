From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:56 +0100
Subject: [Buildroot] [git commit] ruby: unbreak host build after
	auto-host-deps change
Message-ID: <20120118150408.6AB0E85779@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef52202c15af9fe9e24f7722ee51974e72e0612c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ruby/ruby.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 26db931..c984d67 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -9,6 +9,7 @@ RUBY_SITE = ftp://ftp.ruby-lang.org/pub/ruby/1.9
 RUBY_AUTORECONF = YES
 HOST_RUBY_AUTORECONF = YES
 RUBY_DEPENDENCIES = host-ruby
+HOST_RUBY_DEPENDENCIES =
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_CONF_OPT = --disable-install-doc --disable-rpath
 HOST_RUBY_CONF_OPT = --disable-install-doc --with-out-ext=curses,readline
