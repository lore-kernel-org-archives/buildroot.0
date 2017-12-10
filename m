From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Dec 2017 20:54:26 +0100
Subject: [Buildroot] [git commit] wireshark: security bump to version 2.2.11
Message-ID: <20171210195453.F3F7A80FCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2bc1e2bbbabc70f2e9436387b8a40ff96216372
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

wnpa-sec-2017-47: The IWARP_MPA dissector could crash. (Bug 14236)

https://www.wireshark.org/security/wnpa-sec-2017-47.html

wnpa-sec-2017-48: The NetBIOS dissector could crash. (Bug 14249)

https://www.wireshark.org/security/wnpa-sec-2017-48.html

wnpa-sec-2017-49: The CIP Safety dissector could crash. (Bug 14250)

https://www.wireshark.org/security/wnpa-sec-2017-49.html

For more information, see the release notes:
https://www.wireshark.org/docs/relnotes/wireshark-2.2.11.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 3494f2e..cffdab2 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,2 +1,2 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.10.txt
-sha256 8574a5e1fdec7affae640924bd46c1aed1bd866e02632fa5625e1450e4a50707  wireshark-2.2.10.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.11.txt
+sha256 a9f11621e85d7e1d72259157edd94825e72af3fd72e184b8474459f92ad5fc40  wireshark-2.2.11.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 34ee563..535ed7a 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.2.10
+WIRESHARK_VERSION = 2.2.11
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
