From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2020 09:59:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/openvpn: security bump version to
 2.4.9
Message-ID: <20200419075919.287521-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://github.com/OpenVPN/openvpn/blob/release/2.4/ChangeLog

Fixes CVE-2020-11810.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index d219c0f18d..b9b0a4d8d5 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256 fb8ca66bb7807fff595fbdf2a0afd085c02a6aa47715c9aa3171002f9f1a3f91  openvpn-2.4.8.tar.xz
+sha256 641f3add8694b2ccc39fd4fd92554e4f089ad16a8db6d2b473ec284839a5ebe2  openvpn-2.4.9.tar.xz
 sha256 1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 6c0f70ce89..4234675d9f 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.4.8
+OPENVPN_VERSION = 2.4.9
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf openssl
-- 
2.26.1
