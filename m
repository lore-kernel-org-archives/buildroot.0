From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:09:38 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] wireshark: bump version
 to 2.2.7 (security)
Message-ID: <20171126213911.3F2BC81539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5630491a8140a5acaef0dc0b071a418cd7b8fee7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Security fixes:

- wnpa-sec-2017-22
  Bazaar dissector infinite loop (Bug 13599) CVE-2017-9352
- wnpa-sec-2017-23
  DOF dissector read overflow (Bug 13608) CVE-2017-9348
- wnpa-sec-2017-24
  DHCP dissector read overflow (Bug 13609, Bug 13628) CVE-2017-9351
- wnpa-sec-2017-25
  SoulSeek dissector infinite loop (Bug 13631) CVE-2017-9346
- wnpa-sec-2017-26
  DNS dissector infinite loop (Bug 13633) CVE-2017-9345
- wnpa-sec-2017-27
  DICOM dissector infinite loop (Bug 13685) CVE-2017-9349
- wnpa-sec-2017-28
  openSAFETY dissector memory exhaustion (Bug 13649) CVE-2017-9350
- wnpa-sec-2017-29
  BT L2CAP dissector divide by zero (Bug 13701) CVE-2017-9344
- wnpa-sec-2017-30
  MSNIP dissector crash (Bug 13725) CVE-2017-9343
- wnpa-sec-2017-31
  ROS dissector crash (Bug 13637) CVE-2017-9347
- wnpa-sec-2017-32
  RGMP dissector crash (Bug 13646) CVE-2017-9354
- wnpa-sec-2017-33
  IPv6 dissector crash (Bug 13675) CVE-2017-9353

Full release notes:

  https://www.wireshark.org/docs/relnotes/wireshark-2.2.7.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c87443e65e0d25e88868d75cefba5cd901130925)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 09f6573..c61c520 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,2 +1,2 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.6.txt
-sha256 f627d51eda85f5ae5f5c8c9fc1f6539ffc2a270dd7500dc7f67490a8534ca849  wireshark-2.2.6.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.7.txt
+sha256 689ddf62221b152779d8846ab5b2063cc7fd41ec1a9f04eefab09b5d5486dbb5  wireshark-2.2.7.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index fee6a81..69e50ad 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.2.6
+WIRESHARK_VERSION = 2.2.7
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
