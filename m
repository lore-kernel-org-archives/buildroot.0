From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 30 Nov 2012 22:46:28 +0100
Subject: [Buildroot] [PATCH v2] efl packages: add license info
In-Reply-To: <1354311995-21598-1-git-send-email-s.martin49@gmail.com>
References: <1354311995-21598-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1354311995-21598-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
v2: fix license according to Arnout's comments
---
 package/efl/expedite/expedite.mk           | 3 +++
 package/efl/libecore/libecore.mk           | 3 +++
 package/efl/libedbus/libedbus.mk           | 3 +++
 package/efl/libedje/libedje.mk             | 3 +++
 package/efl/libeet/libeet.mk               | 3 +++
 package/efl/libefreet/libefreet.mk         | 3 +++
 package/efl/libeina/libeina.mk             | 3 +++
 package/efl/libelementary/libelementary.mk | 3 +++
 package/efl/libembryo/libembryo.mk         | 3 +++
 package/efl/libethumb/libethumb.mk         | 3 +++
 package/efl/libevas/libevas.mk             | 3 +++
 11 files changed, 33 insertions(+)

diff --git a/package/efl/expedite/expedite.mk b/package/efl/expedite/expedite.mk
index a841ac9..26d25f5 100644
--- a/package/efl/expedite/expedite.mk
+++ b/package/efl/expedite/expedite.mk
@@ -6,6 +6,9 @@
 
 EXPEDITE_VERSION = 1.1.0
 EXPEDITE_SITE = http://download.enlightenment.org/releases/
+EXPEDITE_LICENSE = BSD-2c
+EXPEDITE_LICENSE_FILES = COPYING
+
 EXPEDITE_DEPENDENCIES = libevas libeina libeet
 
 $(eval $(autotools-package))
diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index b495bdb..9eb09ac 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -7,6 +7,9 @@
 LIBECORE_VERSION = 1.1.0
 LIBECORE_SOURCE = ecore-$(LIBECORE_VERSION).tar.bz2
 LIBECORE_SITE = http://download.enlightenment.org/releases/
+LIBECORE_LICENSE = BSD-2c
+LIBECORE_LICENSE_FILES = COPYING
+
 LIBECORE_INSTALL_STAGING = YES
 
 LIBECORE_DEPENDENCIES = host-pkgconf libeina
diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
index 4ecb0f8..60651e3 100644
--- a/package/efl/libedbus/libedbus.mk
+++ b/package/efl/libedbus/libedbus.mk
@@ -7,6 +7,9 @@
 LIBEDBUS_VERSION = 1.1.0
 LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
 LIBEDBUS_SITE = http://download.enlightenment.org/releases/
+LIBEDBUS_LICENSE = BSD-2c
+LIBEDBUS_LICENSE_FILES = COPYING
+
 LIBEDBUS_INSTALL_STAGING = YES
 
 LIBEDBUS_DEPENDENCIES = host-pkgconf dbus libeina libecore
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
index 8b4814e..ce17da5 100644
--- a/package/efl/libedje/libedje.mk
+++ b/package/efl/libedje/libedje.mk
@@ -7,6 +7,9 @@
 LIBEDJE_VERSION = 1.1.0
 LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
 LIBEDJE_SITE =  http://download.enlightenment.org/releases/
+LIBEDJE_LICENSE = GPLv2+ (epp binary), BSD-2c (everything else)
+LIBEDJE_LICENSE_FILES = COPYING
+
 LIBEDJE_INSTALL_STAGING = YES
 
 LIBEDJE_DEPENDENCIES = host-pkgconf lua libeina libeet libecore libevas \
diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
index cb64675..ccb3501 100644
--- a/package/efl/libeet/libeet.mk
+++ b/package/efl/libeet/libeet.mk
@@ -7,6 +7,9 @@
 LIBEET_VERSION = 1.5.0
 LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
 LIBEET_SITE = http://download.enlightenment.org/releases/
+LIBEET_LICENSE = BSD-2c
+LIBEET_LICENSE_FILES = COPYING
+
 LIBEET_INSTALL_STAGING = YES
 
 LIBEET_DEPENDENCIES = host-pkgconf zlib jpeg libeina
diff --git a/package/efl/libefreet/libefreet.mk b/package/efl/libefreet/libefreet.mk
index 2f00bcf..c0d7397 100644
--- a/package/efl/libefreet/libefreet.mk
+++ b/package/efl/libefreet/libefreet.mk
@@ -7,6 +7,9 @@
 LIBEFREET_VERSION = 1.1.0
 LIBEFREET_SOURCE = efreet-$(LIBEFREET_VERSION).tar.bz2
 LIBEFREET_SITE = http://download.enlightenment.org/releases/
+LIBEFREET_LICENSE = BSD-2c
+LIBEFREET_LICENSE_FILES = COPYING
+
 LIBEFREET_INSTALL_STAGING = YES
 
 LIBEFREET_DEPENDENCIES = libeina libeet libecore
diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
index 465fee1..e5b89c1 100644
--- a/package/efl/libeina/libeina.mk
+++ b/package/efl/libeina/libeina.mk
@@ -7,6 +7,9 @@
 LIBEINA_VERSION = 1.1.0
 LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
 LIBEINA_SITE = http://download.enlightenment.org/releases/
+LIBEINA_LICENSE = LGPLv2.1+
+LIBEINA_LICENSE_FILES = COPYING
+
 LIBEINA_INSTALL_STAGING = YES
 
 LIBEINA_DEPENDENCIES = host-pkgconf
diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
index 83c9005..8957d03 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -7,6 +7,9 @@
 LIBELEMENTARY_VERSION = 0.8.0.65643
 LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.bz2
 LIBELEMENTARY_SITE = http://download.enlightenment.org/snapshots/2011-11-28
+LIBELEMENTARY_LICENSE = LGPLv2.1
+LIBELEMENTARY_LICENSE_FILES = COPYING
+
 LIBELEMENTARY_INSTALL_STAGING = YES
 
 LIBELEMENTARY_DEPENDENCIES = libeina libevas libecore libedje host-libedje \
diff --git a/package/efl/libembryo/libembryo.mk b/package/efl/libembryo/libembryo.mk
index 5484ccf..9cab5aa 100644
--- a/package/efl/libembryo/libembryo.mk
+++ b/package/efl/libembryo/libembryo.mk
@@ -7,6 +7,9 @@
 LIBEMBRYO_VERSION = 1.1.0
 LIBEMBRYO_SOURCE = embryo-$(LIBEMBRYO_VERSION).tar.bz2
 LIBEMBRYO_SITE = http://download.enlightenment.org/releases/
+LIBEMBRYO_LICENSE = BSD-2c, Embryo license
+LIBEMBRYO_LICENSE_FILES = COPYING
+
 LIBEMBRYO_INSTALL_STAGING = YES
 
 LIBEMBRYO_DEPENDENCIES = host-pkgconf libeina
diff --git a/package/efl/libethumb/libethumb.mk b/package/efl/libethumb/libethumb.mk
index 92e4c83..ba77e4c 100644
--- a/package/efl/libethumb/libethumb.mk
+++ b/package/efl/libethumb/libethumb.mk
@@ -7,6 +7,9 @@
 LIBETHUMB_VERSION = 0.1.1.65643
 LIBETHUMB_SOURCE = ethumb-$(LIBETHUMB_VERSION).tar.bz2
 LIBETHUMB_SITE = http://download.enlightenment.org/snapshots/2011-11-28
+LIBETHUMB_LICENSE = LGPLv2.1+
+LIBETHUMB_LICENSE_FILES = COPYING
+
 LIBETHUMB_INSTALL_STAGING = YES
 
 LIBETHUMB_DEPENDENCIES = libeina libevas libecore libedje host-libedje
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 594db60..402aa48 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -7,6 +7,9 @@
 LIBEVAS_VERSION = 1.1.0
 LIBEVAS_SOURCE = evas-$(LIBEVAS_VERSION).tar.bz2
 LIBEVAS_SITE = http://download.enlightenment.org/releases/
+LIBEVAS_LICENSE = BSD-2c
+LIBEVAS_LICENSE_FILES = COPYING
+
 LIBEVAS_INSTALL_STAGING = YES
 
 LIBEVAS_DEPENDENCIES = host-pkgconf zlib libeina freetype
-- 
1.8.0.1
