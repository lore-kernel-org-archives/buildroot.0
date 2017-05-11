From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 11 May 2017 18:53:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/openvpn: security bump to 2.4.2
Message-ID: <20170511165333.4655-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-7478 & CVE-2017-7479:
https://community.openvpn.net/openvpn/wiki/QuarkslabAndCryptographyEngineerAudits

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index a03345eb4..fe054e961 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 fde9e22c6df7a335d2d58c6a4d5967be76df173c766a5c51ece57fd044c76ee5  openvpn-2.4.1.tar.xz
+sha256 df5c4f384b7df6b08a2f6fa8a84b9fd382baf59c2cef1836f82e2a7f62f1bff9  openvpn-2.4.2.tar.xz
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index aba6e30e6..ff6bcdcee 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.4.1
+OPENVPN_VERSION = 2.4.2
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf openssl
-- 
2.11.0
