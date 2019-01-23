From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 16:06:56 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/wireshark:
 security bump to version 2.6.5
Message-ID: <20190123151352.AE600849D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f5c1f82464d97120f40fc80d8d5879da554656c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The following vulnerabilities have been fixed:

- wnpa-sec-2018-51 The Wireshark dissection engine could crash. Bug 14466. CVE-2018-19625.
- wnpa-sec-2018-52 The DCOM dissector could crash. Bug 15130. CVE-2018-19626.
- wnpa-sec-2018-53 The LBMPDM dissector could crash. Bug 15132. CVE-2018-19623.
- wnpa-sec-2018-54 The MMSE dissector could go into an infinite loop. Bug 15250. CVE-2018-19622.
- wnpa-sec-2018-55 The IxVeriWave file parser could crash. Bug 15279. CVE-2018-19627.
- wnpa-sec-2018-56 The PVFS dissector could crash. Bug 15280. CVE-2018-19624.
- wnpa-sec-2018-57 The ZigBee ZCL dissector could crash. Bug 15281. CVE-2018-19628.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2ec38321d6643202c122297878bba88785795a96)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index a0178b9f56..7748dd8409 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,4 +1,4 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.6.4.txt
-sha256 a06b007e6343f148b8b93443b2fcfc9bb3204311cd268565d54d1b71660bc861  wireshark-2.6.4.tar.xz
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.6.5.txt
+sha256 93155b798544b2f07693920f4ac1b531c952965ee4eb1d98419961240177438a  wireshark-2.6.5.tar.xz
 # Locally calculated
 sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index f67368ae43..632a7a6aa8 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.6.4
+WIRESHARK_VERSION = 2.6.5
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
