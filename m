From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Mar 2020 00:04:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/rygel: bump to version 0.38.3
Message-ID: <20200329220428.35062-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update indentation of hash file (two spaces)
- Fix build with gssdp/gupnp 1.2 thanks to:
  https://github.com/GNOME/rygel/commit/791b688d8ac3f8da4d162b1935871d16fe8e16fd

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rygel/rygel.hash | 8 ++++----
 package/rygel/rygel.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/rygel/rygel.hash b/package/rygel/rygel.hash
index 0d8c95a697..33b44aecc2 100644
--- a/package/rygel/rygel.hash
+++ b/package/rygel/rygel.hash
@@ -1,6 +1,6 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/rygel/0.36/rygel-0.36.2.sha256sum:
-sha256	d332c76c76716de1e5085f0ca0c152174352efd652a80e5b94ec7df797f92244	rygel-0.36.2.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/rygel/0.38/rygel-0.38.3.sha256sum:
+sha256  08c21a577f7bdad26446a75ffa32778b26842c3b1188165f0b19818559747d00  rygel-0.38.3.tar.xz
 
 # Locally calculated
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
-sha256	c7d881be8ae01162510e982a32001446c6d6d18a9cecc89cc41a28bd215a0262	COPYING.logo
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  c7d881be8ae01162510e982a32001446c6d6d18a9cecc89cc41a28bd215a0262  COPYING.logo
diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
index d87beda8c9..c43030d69f 100644
--- a/package/rygel/rygel.mk
+++ b/package/rygel/rygel.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RYGEL_VERSION_MAJOR = 0.36
-RYGEL_VERSION = $(RYGEL_VERSION_MAJOR).2
+RYGEL_VERSION_MAJOR = 0.38
+RYGEL_VERSION = $(RYGEL_VERSION_MAJOR).3
 RYGEL_SOURCE = rygel-$(RYGEL_VERSION).tar.xz
 RYGEL_SITE = http://ftp.gnome.org/pub/gnome/sources/rygel/$(RYGEL_VERSION_MAJOR)
 RYGEL_LICENSE = LGPL-2.1+, CC-BY-SA-3.0 (logo)
-- 
2.25.1
