From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Jul 2014 22:29:54 +0200
Subject: [Buildroot] [git commit] trivial: fix typo 'an host'
Message-ID: <20140724203151.BB4279D2E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5bd9ed6fe6a4a7c3a3a27453cc6a2bd2eefc5b05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In English, unlike in French, the 'h' in 'host' is pronounced, meaning that
the article should be 'a' instead of 'an'.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-autotools.mk |    2 +-
 package/pkg-cmake.mk     |    2 +-
 package/pkg-generic.mk   |    2 +-
 package/pkg-luarocks.mk  |    2 +-
 package/pkg-perl.mk      |    2 +-
 package/pkg-python.mk    |    2 +-
 package/pkg-virtual.mk   |    2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 4443c72..db3736c 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -54,7 +54,7 @@ AUTOCONF_AC_CHECK_FILE_VAL = ac_cv_file_$(subst -,_,$(subst /,_,$(subst .,_,$(1)
 # make targets
 #
 #  argument 1 is the lowercase package name
-#  argument 2 is the uppercase package name, including an HOST_ prefix
+#  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index d83ff2d..adffbec 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -27,7 +27,7 @@
 # generate the necessary make targets
 #
 #  argument 1 is the lowercase package name
-#  argument 2 is the uppercase package name, including an HOST_ prefix
+#  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 97a7547..03cbf96 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -268,7 +268,7 @@ endef
 # generic package
 #
 #  argument 1 is the lowercase package name
-#  argument 2 is the uppercase package name, including an HOST_ prefix
+#  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index b24a4c5..d9373e1 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -24,7 +24,7 @@
 # generate the necessary make targets
 #
 #  argument 1 is the lowercase package name
-#  argument 2 is the uppercase package name, including an HOST_ prefix
+#  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 8c45001..f073d70 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -29,7 +29,7 @@ PERL_ARCHNAME	= $(ARCH)-linux
 # make targets
 #
 #  argument 1 is the lowercase package name
-#  argument 2 is the uppercase package name, including an HOST_ prefix
+#  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index fedfd69..d37a03f 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -82,7 +82,7 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
 # infrastructure to generate the necessary make targets
 #
 #  argument 1 is the lowercase package name
-#  argument 2 is the uppercase package name, including an HOST_ prefix
+#  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index f5d7567..2889ef9 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -19,7 +19,7 @@
 # package against its provider.
 #
 #  argument 1 is the lowercase package name
-#  argument 2 is the uppercase package name, including an HOST_ prefix
+#  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
