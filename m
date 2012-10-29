From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Oct 2012 22:06:19 +0100
Subject: [Buildroot] [git commit] docs/manual: update to host-pkgconf
Message-ID: <20121029211342.EC2629998B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=598aea4b6171dd0a61160bba6b7c021e64c2f22b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the manual to match now that we have moved to pkgconf instead of
pkg-config.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-autotools.txt |    2 +-
 docs/manual/adding-packages-cmake.txt     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index 9fb0918..b85b7af 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -21,7 +21,7 @@ package, with an example :
 09: LIBFOO_INSTALL_STAGING = YES
 10: LIBFOO_INSTALL_TARGET = YES
 11: LIBFOO_CONF_OPT = --enable-shared
-12: LIBFOO_DEPENDENCIES = libglib2 host-pkg-config
+12: LIBFOO_DEPENDENCIES = libglib2 host-pkgconf
 13:
 14: $(eval $(autotools-package))
 ------------------------
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index e29ca0f..da4984a 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -21,7 +21,7 @@ with an example :
 09: LIBFOO_INSTALL_STAGING = YES
 10: LIBFOO_INSTALL_TARGET = YES
 11: LIBFOO_CONF_OPT = -DBUILD_DEMOS=ON
-12: LIBFOO_DEPENDENCIES = libglib2 host-pkg-config
+12: LIBFOO_DEPENDENCIES = libglib2 host-pkgconf
 13:
 14: $(eval $(cmake-package))
 ------------------------
