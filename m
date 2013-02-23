From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Feb 2013 21:30:59 +0100
Subject: [Buildroot] [git commit] ruby: security bump to version 1.9.3-p392
Message-ID: <20130223204021.B281B9AC96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9aa6c065cbf29e7642c016474be9aa89f4e00c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes JSON DoS (CVE-2013-0269) and REXML DoS (no assigned CVE yet).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ruby/ruby.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index ee1f9ed..601ae90 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-RUBY_VERSION = 1.9.3-p362
+RUBY_VERSION = 1.9.3-p392
 RUBY_SITE = ftp://ftp.ruby-lang.org/pub/ruby/1.9
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
 HOST_RUBY_DEPENDENCIES = host-pkgconf
