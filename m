From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 16:22:31 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] wireshark: bump version
	to 2.2.6 (security)
Message-ID: <20170424193337.B6676821A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a29fa4bb774c4d0a192248e0369f9b31c8b23e9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Security fixes:

- wnpa-sec-2017-12
  IMAP dissector crash (Bug 13466) CVE-2017-7703
- wnpa-sec-2017-13
  WBMXL dissector infinite loop (Bug 13477) CVE-2017-7702
- wnpa-sec-2017-14
  NetScaler file parser infinite loop (Bug 13478) CVE-2017-7700
- wnpa-sec-2017-15
  RPCoRDMA dissector infinite loop (Bug 13558) CVE-2017-7705
- wnpa-sec-2017-16
  BGP dissector infinite loop (Bug 13557) CVE-2017-7701
- wnpa-sec-2017-17
  DOF dissector infinite loop (Bug 13453) CVE-2017-7704
- wnpa-sec-2017-18
  PacketBB dissector crash (Bug 13559)
- wnpa-sec-2017-19
  SLSK dissector long loop (Bug 13576)
- wnpa-sec-2017-20
  SIGCOMP dissector infinite loop (Bug 13578)
- wnpa-sec-2017-21
  WSP dissector infinite loop (Bug 13581)

Full release notes:

  https://www.wireshark.org/docs/relnotes/wireshark-2.2.6.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 156e31e5b32bff6e3e0684fc8aa182c97da3e651)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 3d1f7af..09f6573 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,2 +1,2 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.5.txt
-sha256 75dd88d3d6336559e5b0b72077d8a772a988197d571f00029986225fef609ac8  wireshark-2.2.5.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.6.txt
+sha256 f627d51eda85f5ae5f5c8c9fc1f6539ffc2a270dd7500dc7f67490a8534ca849  wireshark-2.2.6.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 14c2943..fee6a81 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.2.5
+WIRESHARK_VERSION = 2.2.6
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
