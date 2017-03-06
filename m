From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 17:45:27 +0100
Subject: [Buildroot] [git commit] wireshark: security bump to version 2.2.5
Message-ID: <20170306164538.810F38166E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9e594d99add12ec2b10f79a351cdd8bae093d0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
wnpa-sec-2017-03 - LDSS dissector crash
wnpa-sec-2017-04 - RTMTP dissector infinite loop
wnpa-sec-2017-05 - WSP dissector infinite loop
wnpa-sec-2017-06 - STANAG 4607 file parser infinite loop
wnpa-sec-2017-07 - NetScaler file parser infinite loop
wnpa-sec-2017-08 - NetScaler file parser crash
wnpa-sec-2017-09 - K12 file parser crash
wnpa-sec-2017-10 - IAX2 dissector infinite loop
wnpa-sec-2017-11 - NetScaler file parser infinite loop

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index e3eeef3..3d1f7af 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,2 +1,2 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.4.txt
-sha256 42a7fb35eed5a32478153e24601a284bb50148b7ba919c3e8452652f4c2a3911  wireshark-2.2.4.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.5.txt
+sha256 75dd88d3d6336559e5b0b72077d8a772a988197d571f00029986225fef609ac8  wireshark-2.2.5.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index edd830d..14c2943 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.2.4
+WIRESHARK_VERSION = 2.2.5
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
