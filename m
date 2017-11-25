From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Nov 2017 17:10:31 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/avahi: bump version to 0.7
Message-ID: <20171125161031.24150-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash, removed license text in avahi.mk added in 2006:
https://git.buildroot.net/buildroot/commit/package/avahi?id=21e97d3e155f4d9604f729698cdfff3c40eefbe7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/avahi/avahi.hash | 3 ++-
 package/avahi/avahi.mk   | 9 +--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/avahi/avahi.hash b/package/avahi/avahi.hash
index 09c5d42433..b4d36ffe50 100644
--- a/package/avahi/avahi.hash
+++ b/package/avahi/avahi.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454	avahi-0.6.32.tar.gz
+sha256 57a99b5dfe7fdae794e3d1ee7a62973a368e91e414bd0dfa5d84434de5b14804  avahi-0.7.tar.gz
+sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LICENSE
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 94b6292b5d..b89887b4c7 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -4,14 +4,7 @@
 #
 ################################################################################
 
-#
-# This program is free software; you can redistribute it
-# and/or modify it under the terms of the GNU Lesser General
-# Public License as published by the Free Software Foundation
-# either version 2.1 of the License, or (at your option) any
-# later version.
-
-AVAHI_VERSION = 0.6.32
+AVAHI_VERSION = 0.7
 AVAHI_SITE = https://github.com/lathiat/avahi/releases/download/v$(AVAHI_VERSION)
 AVAHI_LICENSE = LGPL-2.1+
 AVAHI_LICENSE_FILES = LICENSE
-- 
2.11.0
