From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Mar 2021 21:37:47 +0100
Subject: [Buildroot] [git commit] package/ruby: add RUBY_CPE_ID_VENDOR
Message-ID: <20210302201930.00C7F81E4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0263f2551724b03f8cf94ac82a903fc9e298da9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:ruby-lang:ruby is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aruby-lang%3Aruby

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
 
