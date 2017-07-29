From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 14:56:47 +0200
Subject: [Buildroot] [git commit] package/libgpiod: install to staging
Message-ID: <20170729125521.EE4CA80400@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6acd8449b81da1b40a05cb024bcd19558219701
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install to staging to make API headers discoverable by other packages.

Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgpiod/libgpiod.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 76648bd..559e3d1 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -8,6 +8,7 @@ LIBGPIOD_VERSION = v0.3
 LIBGPIOD_SITE = $(call github,brgl,libgpiod,$(LIBGPIOD_VERSION))
 LIBGPIOD_LICENSE = LGPL-2.1+
 LIBGPIOD_LICENSE_FILES = COPYING
+LIBGPIOD_INSTALL_STAGING = YES
 
 LIBGPIOD_DEPENDENCIES = host-pkgconf
 
