From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Jun 2013 11:56:53 +0200
Subject: [Buildroot] [git commit] ruby: security bump to version 1.9.3-p429
Message-ID: <20130611100810.08A4E9AC6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6bccfa880a9b82c071303c87fe0779ac621329d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-2065.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ruby/ruby.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index e708262..020cd76 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUBY_VERSION = 1.9.3-p392
+RUBY_VERSION = 1.9.3-p429
 RUBY_SITE = ftp://ftp.ruby-lang.org/pub/ruby/1.9
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
 HOST_RUBY_DEPENDENCIES = host-pkgconf
