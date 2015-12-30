From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 14:53:22 +0100
Subject: [Buildroot] [git commit] wireshark: security bump to version 2.0.1
Message-ID: <20151230135325.9221D8274C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd054fed265590a18d0eeacbeb996dd697aa2284
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
wnpa-sec-2015-31 - NBAP dissector crashes
wnpa-sec-2015-37 - NLM dissector crashes
wnpa-sec-2015-39 - BER dissector crashes
wnpa-sec-2015-40 - Zlib decompression crash
wnpa-sec-2015-41 - SCTP dissector crashes
wnpa-sec-2015-42 - 802.11 decryption crash
wnpa-sec-2015-43 - DIAMETER dissector crash
wnpa-sec-2015-44 - VeriWave file parser crashes
wnpa-sec-2015-45 - RSVP dissector crash
wnpa-sec-2015-46 - ANSI A & GSM A dissector crashes
wnpa-sec-2015-47 - Ascend file parser crash
wnpa-sec-2015-48 - NBAP dissector crash
wnpa-sec-2015-49 - RSL dissector crash
wnpa-sec-2015-50 - ZigBee ZCL dissector crash
wnpa-sec-2015-51 - Sniffer file parser crash
wnpa-sec-2015-52 - NWP dissector crash
wnpa-sec-2015-53 - BT ATT disector crash
wnpa-sec-2015-54 - MP2T file parser crash
wnpa-sec-2015-55 - MP2T file parser crash
wnpa-sec-2015-56 - S7COMM disector crash
wnpa-sec-2015-57 - IPMI dissector crash
wnpa-sec-2015-58 - TDS dissector crash
wnpa-sec-2015-59 - PPI dissector crash
wnpa-sec-2015-60 - MS-WSP dissector crash

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index c1e1d58..d95eaa9 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,2 +1,2 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.0.0.txt
-sha256 90026c761a85701d7783c7e2eaa4c1de247dfbadbd53221df355f121e42691dd  wireshark-2.0.0.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.0.1.txt
+sha256	c9bd07dd0d0045d6ca7537390a1afbcdf33716d193ea7d7084ae4f6c30b683ab	wireshark-2.0.1.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 02f37da..b624e2b 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.0.0
+WIRESHARK_VERSION = 2.0.1
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
