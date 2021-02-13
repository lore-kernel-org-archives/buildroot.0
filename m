From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Feb 2021 22:49:59 +0100
Subject: [Buildroot] [git commit] package/wireshark: security bump to
 version 3.4.3
Message-ID: <20210213212844.C1BB081534@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=237df117c1efb0260cda194cd2d8037498313e9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following vulnerabilities have been fixed:
 - wnpa-sec-2021-01 USB HID dissector memory leak. Bug 17124.
   CVE-2021-22173.
 - wnpa-sec-2021-02 USB HID dissector crash. Bug 17165. CVE-2021-22174.

https://www.wireshark.org/docs/relnotes/wireshark-3.4.3.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index b0e7687e1b..56a0122dd2 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.2.txt
-sha1  b33276e4e6c3d6a057da3b569b58316330a5f3e3  wireshark-3.4.2.tar.xz
-sha256  de9868729e426a469baabd8d444240d84fa5445020e92c842dd19afd0d47a4c4  wireshark-3.4.2.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.3.txt
+sha1  7dec4332f21827e360b5830d1d6d566365796a67  wireshark-3.4.3.tar.xz
+sha256  f467cc77f0fc73fce0b854cdbc292f132d4879fca69d417eccad5f967fbf262b  wireshark-3.4.3.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index de29417ccd..e751e550bc 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.4.2
+WIRESHARK_VERSION = 3.4.3
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
