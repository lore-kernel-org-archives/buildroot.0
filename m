From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Feb 2016 16:27:40 +0100
Subject: [Buildroot] [git commit] wireshark: security bump to version 2.0.2
Message-ID: <20160227152748.3EBAA80746@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1a3c0abac0dadec8de0fc5f64c2237d340d6579
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2016-2521 - DLL hijacking vulnerability.
CVE-2016-2522 - ASN.1 BER dissector crash.
CVE-2016-2523 - DNP dissector infinite loop.
CVE-2016-2524 - X.509AF dissector crash.
CVE-2016-2525 - HTTP/2 dissector crash.
CVE-2016-2526 - HiQnet dissector crash.
CVE-2016-2527 - 3GPP TS 32.423 Trace file parser crash.
CVE-2016-2528 - LBMC dissector crash.
CVE-2016-2529 - iSeries file parser crash.
CVE-2016-2530 - RSL dissector crash.
CVE-2016-2531 - RSL dissector crash.
CVE-2016-2532 - LLRP dissector crash.
wnpa-sec-2016-12 - Ixia IxVeriWave file parser crash.
wnpa-sec-2016-13 - IEEE 802.11 dissector crash.
wnpa-sec-2016-14 - GSM A-bis OML dissector crash.
wnpa-sec-2016-15 - ASN.1 BER dissector crash.
wnpa-sec-2016-16 - SPICE dissector large loop.
wnpa-sec-2016-17 - NFS dissector crash.
wnpa-sec-2016-18 - ASN.1 BER dissector crash.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index d95eaa9..ed0d2ef 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,2 +1,2 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.0.1.txt
-sha256	c9bd07dd0d0045d6ca7537390a1afbcdf33716d193ea7d7084ae4f6c30b683ab	wireshark-2.0.1.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.0.2.txt
+sha256	e921fb072085a5654d899949bb561d0687f4819f7b63ba35777bb949a9b6b9c1	wireshark-2.0.2.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index b624e2b..34a5a85 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.0.1
+WIRESHARK_VERSION = 2.0.2
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
