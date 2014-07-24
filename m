From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Jul 2014 20:57:41 +0200
Subject: [Buildroot] [PATCH] trivial: fix typo 'an host'
Message-ID: <ddba3a5f4a8d8263c1e5.1406228261@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In English, unlike in French, the 'h' in 'host' is pronounced, meaning that
the article should be 'a' instead of 'an'.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-autotools.mk |  2 +-
 package/pkg-cmake.mk     |  2 +-
 package/pkg-generic.mk   |  2 +-
 package/pkg-luarocks.mk  |  2 +-
 package/pkg-perl.mk      |  2 +-
 package/pkg-python.mk    |  2 +-
 package/pkg-virtual.mk   |  2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff -r 377347124030 -r ddba3a5f4a8d package/pkg-autotools.mk
--- a/package/pkg-autotools.mk	Thu Jul 24 20:01:15 2014 +0200
+++ b/package/pkg-autotools.mk	Thu Jul 24 20:17:12 2014 +0200
@@ -54,7 +54,7 @@
 # make targets
 #
 #  argument 1 is the lowercase package name
-#  argument 2 is the uppercase package name, including an HOST_ prefix
+#  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
diff -r 377347124030 -r ddba3a5f4a8d package/pkg-cmake.mk
--- a/package/pkg-cmake.mk	Thu Jul 24 20:01:15 2014 +0200
+++ b/package/pkg-cmake.mk	Thu Jul 24 20:17:12 2014 +0200
@@ -27,7 +27,7 @@
 # generate the necessary make targets
 #
 #  argument 1 is the lowercase package name
-#  argument 2 is the uppercase package name, including an HOST_ prefix
+#  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
diff -r 377347124030 -r ddba3a5f4a8d package/pkg-generic.mk
--- a/package/pkg-generic.mk	Thu Jul 24 20:01:15 2014 +0200
+++ b/package/pkg-generic.mk	Thu Jul 24 20:17:12 2014 +0200
@@ -268,7 +268,7 @@
 # generic package
 #
 #  argument 1 is the lowercase package name
-#  argument 2 is the uppercase package name, including an HOST_ prefix
+#  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
diff -r 377347124030 -r ddba3a5f4a8d package/pkg-luarocks.mk
--- a/package/pkg-luarocks.mk	Thu Jul 24 20:01:15 2014 +0200
+++ b/package/pkg-luarocks.mk	Thu Jul 24 20:17:12 2014 +0200
@@ -24,7 +24,7 @@
 # generate the necessary make targets
 #
 #  argument 1 is the lowercase package name
-#  argument 2 is the uppercase package name, including an HOST_ prefix
+#  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
diff -r 377347124030 -r ddba3a5f4a8d package/pkg-perl.mk
--- a/package/pkg-perl.mk	Thu Jul 24 20:01:15 2014 +0200
+++ b/package/pkg-perl.mk	Thu Jul 24 20:17:12 2014 +0200
@@ -29,7 +29,7 @@
 # make targets
 #
 #  argument 1 is the lowercase package name
-#  argument 2 is the uppercase package name, including an HOST_ prefix
+#  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
diff -r 377347124030 -r ddba3a5f4a8d package/pkg-python.mk
--- a/package/pkg-python.mk	Thu Jul 24 20:01:15 2014 +0200
+++ b/package/pkg-python.mk	Thu Jul 24 20:17:12 2014 +0200
@@ -82,7 +82,7 @@
 # infrastructure to generate the necessary make targets
 #
 #  argument 1 is the lowercase package name
-#  argument 2 is the uppercase package name, including an HOST_ prefix
+#  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
diff -r 377347124030 -r ddba3a5f4a8d package/pkg-virtual.mk
--- a/package/pkg-virtual.mk	Thu Jul 24 20:01:15 2014 +0200
+++ b/package/pkg-virtual.mk	Thu Jul 24 20:17:12 2014 +0200
@@ -19,7 +19,7 @@
 # package against its provider.
 #
 #  argument 1 is the lowercase package name
-#  argument 2 is the uppercase package name, including an HOST_ prefix
+#  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
