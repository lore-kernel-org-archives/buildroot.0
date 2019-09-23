From: =?utf-8?B?U8O4cmVuc2VuLCBTdGVmYW4=?= <Stefan.Sorensen@spectralink.com>
Date: Mon, 23 Sep 2019 08:41:49 +0000
Subject: [Buildroot] [PATCH] package/libpwquality: bump version to 1.4.1
Message-ID: <20190923084133.21385-1-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/libpwquality/libpwquality.hash | 2 +-
 package/libpwquality/libpwquality.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpwquality/libpwquality.hash b/package/libpwquality/libpwquality.hash
index 97490f818a..b63501fa16 100644
--- a/package/libpwquality/libpwquality.hash
+++ b/package/libpwquality/libpwquality.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha2561de6ff046cf2172d265a2cb6f8da439d894f3e4e8157b056c515515232fade6blibpwquality-1.4.0.tar.bz2
+sha256a97d72b5c56b7e279c6e86dad70c1493ea5796f00a596fb9f3173b96f9bf5e46libpwquality-1.4.1.tar.bz2
 sha256aa44d09f651bf99b56253187c7778a240740c767d28453ab7fdc9804c842baeeCOPYING
diff --git a/package/libpwquality/libpwquality.mk b/package/libpwquality/libpwquality.mk
index 59b0e955fd..bddafd59ca 100644
--- a/package/libpwquality/libpwquality.mk
+++ b/package/libpwquality/libpwquality.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-LIBPWQUALITY_VERSION = 1.4.0
+LIBPWQUALITY_VERSION = 1.4.1
 LIBPWQUALITY_SOURCE = libpwquality-$(LIBPWQUALITY_VERSION).tar.bz2
 LIBPWQUALITY_SITE = https://github.com/libpwquality/libpwquality/releases/download/libpwquality-$(LIBPWQUALITY_VERSION)
 LIBPWQUALITY_LICENSE = BSD-3-Clause or GPL-2.0+
--
2.21.0



Spectralink Disclaimer:
"The information transmitted by this email is intended only for the person or entity to which it is addressed. This email may contain proprietary, confidential and/or privileged material. If you are not the intended recipient of this message, please notify the sender by reply email immediately and delete this message without reading further or forwarding to others. The contents of this email may be protected by copyright law. This email is not intended to be a contract or other legally binding obligation".
