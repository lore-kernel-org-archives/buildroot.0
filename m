From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jan 2013 23:46:55 +0100
Subject: [Buildroot] [git commit] flex: add license information
Message-ID: <20130121225447.83CD49A6BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8121428b16e10236fb29322f5aeed02ff441f297
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/flex/flex.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 0c1ed5a..b1963f9 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -11,6 +11,8 @@ FLEX_PATCH = flex_$(FLEX_VERSION)-$(FLEX_PATCH_VERSION).diff.gz
 FLEX_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/f/flex
 FLEX_DIR = $(BUILD_DIR)/flex-$(FLEX_VERSION)
 FLEX_INSTALL_STAGING = YES
+FLEX_LICENSE = FLEX
+FLEX_LICENSE_FILES = COPYING
 FLEX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_GETTEXT),gettext)
 # we don't have a host-gettext/libintl
