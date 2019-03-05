From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  5 Mar 2019 22:05:46 +0100
Subject: [Buildroot] [PATCH 2/2] package/wireshark: security bump to version
 2.6.7
In-Reply-To: <20190305210546.9200-1-fontaine.fabrice@gmail.com>
References: <20190305210546.9200-1-fontaine.fabrice@gmail.com>
Message-ID: <20190305210546.9200-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2019-9208, CVE-2019-9209 and CVE-2019-9214

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index bad0a0fd45..071940e1c1 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,4 +1,4 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.6.6.txt
-sha256 487933ea075bdbb25d8df06017d9c4f49fc20eb7f6ec80af086718ed5550e863  wireshark-2.6.6.tar.xz
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.6.7.txt
+sha256 747b3e7a37414942959f76f198be49dcbcca936bda538c4408942ce71bfd2b71  wireshark-2.6.7.tar.xz
 # Locally calculated
 sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index c01238826b..5f04af1f29 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.6.6
+WIRESHARK_VERSION = 2.6.7
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.14.1
