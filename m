From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 23 Apr 2019 21:48:40 +0200
Subject: [Buildroot] [PATCH v1] package/libv4l: bump version to 1.16.5
Message-ID: <20190423194840.11166-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update license hash for libv4l1-kernelcode-license.txt (Mauro Carvalho
e-mail address update).

Changelog (since 1.16.3):
  - Update my e-mail on all places
  - dvb-sat: rename Astra 1E to Astra 19.2 E and move it to beginning
  - Qt5: test for Desktop OpenGL presence
  - Qt5: fixup Qt OpenGL automake conditionals
  - dvbv5-zap.c: fix compile warning
  - dvbv5-tools: be sure to zero struct arguments
  - dvbv5-zap: improve program exit code
  - libdvbv5: leaks and double free in dvb_fe_open_fname()

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libv4l/libv4l.hash | 6 +++---
 package/libv4l/libv4l.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index 231a471b9e..99d5021939 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
-# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.16.3.tar.bz2.asc
-sha256 7c5c0d49c130cf65d384f28e9f3a53c5f7d17bf18740c48c40810e0fbbed5b54  v4l-utils-1.16.3.tar.bz2
+# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.16.5.tar.bz2.asc
+sha256 ed80242510385017a1dc566e17a285a77222bb301f5bc19386badfcc2c19df1b  v4l-utils-1.16.5.tar.bz2
 # Locally calculated
 sha256 391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
 sha256 5a7f623a50e384aaf6d2ced068339ddf93d0a50d3a0ecbe86f125b07804ecc78  COPYING.libv4l
-sha256 37d0f2c8dc3f267d864cb39d54f82c5092a599beb29cb5caa96d50d27e069a44  lib/libv4l1/libv4l1-kernelcode-license.txt
+sha256 34229b5aadfb768d0d083987cba54203a920904a3ec8320823c6125b9831acd1  lib/libv4l1/libv4l1-kernelcode-license.txt
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index fe1ffbcf5d..22895a9e2c 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-LIBV4L_VERSION = 1.16.3
+LIBV4L_VERSION = 1.16.5
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
--
2.21.0
