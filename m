From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 25 May 2017 10:42:39 +0200
Subject: [Buildroot] [PATCH/next] package/kodi: bump version to 17.3
Message-ID: <20170525084239.24966-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk | 2 +-
 package/kodi-texturepacker/kodi-texturepacker.mk         | 2 +-
 package/kodi/kodi.hash                                   | 2 +-
 package/kodi/kodi.mk                                     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index 5f1a55dbb..217b39591 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_JSONSCHEMABUILDER_VERSION = 17.1-Krypton
+KODI_JSONSCHEMABUILDER_VERSION = 17.3-Krypton
 KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
 KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
 KODI_JSONSCHEMABUILDER_LICENSE = GPL-2.0
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index c6d3b0523..7c3e82a6c 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_TEXTUREPACKER_VERSION = 17.1-Krypton
+KODI_TEXTUREPACKER_VERSION = 17.3-Krypton
 KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
 KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
 KODI_TEXTUREPACKER_LICENSE = GPL-2.0
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index 5e76fc50c..167b17928 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 303f3903cbb57ccc2961f09cf3746505542bcb129a464f0687d7ca8601cebbee  kodi-17.1-Krypton.tar.gz
+sha256 1de8653a3729cefd1baaf09ecde5ace01a1e3a58fbf29d48c1363f2503d331a1  kodi-17.3-Krypton.tar.gz
 # Locally computed - libdvdcss
 sha256 b6eb2d929ff56cb051152c32010afc5e7cf5fe8c5ae32dca412a2b46b6b57e34  2f12236.tar.gz
 # Locally computed - libdvdnav
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 0b89bdd86..2636a0b96 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION = 17.1-Krypton
+KODI_VERSION = 17.3-Krypton
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPL-2.0
 KODI_LICENSE_FILES = LICENSE.GPL
-- 
2.11.0
