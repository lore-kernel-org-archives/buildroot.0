From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Mar 2021 15:01:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/ruby: add RUBY_CPE_ID_VENDOR
Message-ID: <20210302140107.364376-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:ruby-lang:ruby is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aruby-lang%3Aruby

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ruby/ruby.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 341943c4a5..4ab6ea78c1 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -19,6 +19,7 @@ HOST_RUBY_CONF_OPTS = \
 	--without-gmp
 RUBY_LICENSE = Ruby or BSD-2-Clause, BSD-3-Clause, others
 RUBY_LICENSE_FILES = LEGAL COPYING BSDL
+RUBY_CPE_ID_VENDOR = ruby-lang
 # 0001-fix-default-coroutine-selection.patch
 RUBY_AUTORECONF = YES
 
-- 
2.30.0
