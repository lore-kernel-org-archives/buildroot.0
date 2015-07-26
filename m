From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:14 +0200
Subject: [Buildroot] [04/37] package/efl: remove shared version number
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-5-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is necessary to move efl packages to package directory
and prepare the efl version bump to the latest release.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/efl.mk                                             | 1 -
 package/efl/expedite/expedite.mk                               | 2 +-
 package/efl/libecore/libecore.mk                               | 2 +-
 package/efl/libedbus/libedbus.mk                               | 2 +-
 package/efl/libedje/libedje.mk                                 | 2 +-
 package/efl/libeet/libeet.mk                                   | 2 +-
 package/efl/libefreet/libefreet.mk                             | 2 +-
 package/efl/libeina/libeina.mk                                 | 2 +-
 package/efl/libeio/libeio.mk                                   | 2 +-
 package/efl/libelementary/libelementary.mk                     | 2 +-
 package/efl/libembryo/libembryo.mk                             | 2 +-
 package/efl/libethumb/libethumb.mk                             | 2 +-
 package/efl/libevas-generic-loaders/libevas-generic-loaders.mk | 2 +-
 package/efl/libevas/libevas.mk                                 | 2 +-
 14 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index aa6630c..99e4d14 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -1,3 +1,2 @@
-EFL_VERSION = 1.7.10
 
 include $(sort $(wildcard package/efl/*/*.mk))
diff --git a/package/efl/expedite/expedite.mk b/package/efl/expedite/expedite.mk
index 02a4ca0..9b232f8 100644
--- a/package/efl/expedite/expedite.mk
+++ b/package/efl/expedite/expedite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPEDITE_VERSION = $(EFL_VERSION)
+EXPEDITE_VERSION = 1.7.10
 EXPEDITE_SITE = http://download.enlightenment.org/releases
 EXPEDITE_LICENSE = BSD-2c
 EXPEDITE_LICENSE_FILES = COPYING
diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index 1f711a8..b5016dc 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBECORE_VERSION = $(EFL_VERSION)
+LIBECORE_VERSION = 1.7.10
 LIBECORE_SOURCE = ecore-$(LIBECORE_VERSION).tar.bz2
 LIBECORE_SITE = http://download.enlightenment.org/releases
 LIBECORE_LICENSE = BSD-2c
diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
index 18f047a..634ceaf 100644
--- a/package/efl/libedbus/libedbus.mk
+++ b/package/efl/libedbus/libedbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEDBUS_VERSION = $(EFL_VERSION)
+LIBEDBUS_VERSION = 1.7.10
 LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
 LIBEDBUS_SITE = http://download.enlightenment.org/releases
 LIBEDBUS_LICENSE = BSD-2c
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
index c067a04..59189e4 100644
--- a/package/efl/libedje/libedje.mk
+++ b/package/efl/libedje/libedje.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEDJE_VERSION = $(EFL_VERSION)
+LIBEDJE_VERSION = 1.7.10
 LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
 LIBEDJE_SITE = http://download.enlightenment.org/releases
 LIBEDJE_LICENSE = GPLv2+ (epp binary), BSD-2c (everything else)
diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
index 59582dc..fc3d7f9 100644
--- a/package/efl/libeet/libeet.mk
+++ b/package/efl/libeet/libeet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEET_VERSION = $(EFL_VERSION)
+LIBEET_VERSION = 1.7.10
 LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
 LIBEET_SITE = http://download.enlightenment.org/releases
 LIBEET_LICENSE = BSD-2c
diff --git a/package/efl/libefreet/libefreet.mk b/package/efl/libefreet/libefreet.mk
index 670bbb5..65dbd12 100644
--- a/package/efl/libefreet/libefreet.mk
+++ b/package/efl/libefreet/libefreet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEFREET_VERSION = $(EFL_VERSION)
+LIBEFREET_VERSION = 1.7.10
 LIBEFREET_SOURCE = efreet-$(LIBEFREET_VERSION).tar.bz2
 LIBEFREET_SITE = http://download.enlightenment.org/releases
 LIBEFREET_LICENSE = BSD-2c
diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
index 5b288dd..ae9f1c6 100644
--- a/package/efl/libeina/libeina.mk
+++ b/package/efl/libeina/libeina.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEINA_VERSION = $(EFL_VERSION)
+LIBEINA_VERSION = 1.7.10
 LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
 LIBEINA_SITE = http://download.enlightenment.org/releases
 LIBEINA_LICENSE = LGPLv2.1+
diff --git a/package/efl/libeio/libeio.mk b/package/efl/libeio/libeio.mk
index 6109f94..e687c32 100644
--- a/package/efl/libeio/libeio.mk
+++ b/package/efl/libeio/libeio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEIO_VERSION = $(EFL_VERSION)
+LIBEIO_VERSION = 1.7.10
 LIBEIO_SOURCE = eio-$(LIBEIO_VERSION).tar.bz2
 LIBEIO_SITE = http://download.enlightenment.org/releases
 LIBEIO_LICENSE = LGPLv2.1
diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
index 474e67f..8bd69fe 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBELEMENTARY_VERSION = $(EFL_VERSION)
+LIBELEMENTARY_VERSION = 1.7.10
 LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.bz2
 LIBELEMENTARY_SITE = http://download.enlightenment.org/releases
 LIBELEMENTARY_LICENSE = LGPLv2.1
diff --git a/package/efl/libembryo/libembryo.mk b/package/efl/libembryo/libembryo.mk
index ebbf0b2..fc45e42 100644
--- a/package/efl/libembryo/libembryo.mk
+++ b/package/efl/libembryo/libembryo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEMBRYO_VERSION = $(EFL_VERSION)
+LIBEMBRYO_VERSION = 1.7.10
 LIBEMBRYO_SOURCE = embryo-$(LIBEMBRYO_VERSION).tar.bz2
 LIBEMBRYO_SITE = http://download.enlightenment.org/releases
 LIBEMBRYO_LICENSE = BSD-2c, Embryo license
diff --git a/package/efl/libethumb/libethumb.mk b/package/efl/libethumb/libethumb.mk
index b1719d8..314ddf9 100644
--- a/package/efl/libethumb/libethumb.mk
+++ b/package/efl/libethumb/libethumb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBETHUMB_VERSION = $(EFL_VERSION)
+LIBETHUMB_VERSION = 1.7.10
 LIBETHUMB_SOURCE = ethumb-$(LIBETHUMB_VERSION).tar.bz2
 LIBETHUMB_SITE = http://download.enlightenment.org/releases
 LIBETHUMB_LICENSE = LGPLv2.1+
diff --git a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk b/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
index 3f4e1b2..ac6b1cc 100644
--- a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
+++ b/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVAS_GENERIC_LOADERS_VERSION = $(EFL_VERSION)
+LIBEVAS_GENERIC_LOADERS_VERSION = 1.7.10
 LIBEVAS_GENERIC_LOADERS_SOURCE = evas_generic_loaders-$(LIBEVAS_GENERIC_LOADERS_VERSION).tar.bz2
 LIBEVAS_GENERIC_LOADERS_SITE = http://download.enlightenment.org/releases
 LIBEVAS_GENERIC_LOADERS_LICENSE = GPLv2
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 8113162..9adb128 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVAS_VERSION = $(EFL_VERSION)
+LIBEVAS_VERSION = 1.7.10
 LIBEVAS_SOURCE = evas-$(LIBEVAS_VERSION).tar.bz2
 LIBEVAS_SITE = http://download.enlightenment.org/releases
 LIBEVAS_LICENSE = BSD-2c
-- 
2.4.3
