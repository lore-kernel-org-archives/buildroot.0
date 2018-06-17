From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:16:38 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] wireshark: security bump
 to version 2.2.15
Message-ID: <20180617155626.107AE81070@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a28cf4af320e7f2ca39faecdaa3dfc63bf6c6cda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes the following security issues:

CVE-2018-11362: LDSS dissector crash
https://www.wireshark.org/security/wnpa-sec-2018-25.html

CVE-2018-11357: Multiple dissectors could consume excessive memory
https://www.wireshark.org/security/wnpa-sec-2018-28.html

CVE-2018-11356: DNS dissector crash
https://www.wireshark.org/security/wnpa-sec-2018-29.html

CVE-2018-11360: GSM A DTAP dissector crash
https://www.wireshark.org/security/wnpa-sec-2018-30.html

CVE-2018-11358: Q.931 dissector crash
https://www.wireshark.org/security/wnpa-sec-2018-31.html

CVE-2018-11359: Multiple dissectors could crash
https://www.wireshark.org/security/wnpa-sec-2018-33.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1f47aa89f9fc3d4a8f59c4890a1174c6db1e222b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 2b44cc0757..4b9c646fa9 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,4 +1,4 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.14.txt
-sha256 e7a3d4f9bbde20ea5ee09103f9f6dba38e3666dfe1d6a6a1c004602b5fac378b  wireshark-2.2.14.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.15.txt
+sha256 d73583e9282d47c42b69fc3a1ac9cafb6047d1305f5027d4cf18e95922d11844  wireshark-2.2.15.tar.bz2
 # Locally calculated
 sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index ad475803b7..c9a4ef202d 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.2.14
+WIRESHARK_VERSION = 2.2.15
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
