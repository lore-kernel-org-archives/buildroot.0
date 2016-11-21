From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 23:17:34 +0100
Subject: [Buildroot] [git commit] wireshark: bump version to 2.2.2 (security)
Message-ID: <20161121221739.C965C81992@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a01c4cda3e738d19898244bf09fcb317dada32d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
  https://www.wireshark.org/docs/relnotes/wireshark-2.2.2.html

Security fixes:
  wnpa-sec-2016-62. DTN infinite loop.
  wnpa-sec-2016-61. DCERPC crash.
  wnpa-sec-2016-60. OpenFlow crash.
  wnpa-sec-2016-59. AllJoyn crash.
  wnpa-sec-2016-58. Profinet I/O long loop.

  For more details: https://www.wireshark.org/security/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 21c003f..c90f5bb 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,2 +1,2 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.1.txt
-sha256 900e22af04c8b35e0d02a25a360ab1fb7cfe5ac18fc48a9afd75a7103e569149  wireshark-2.2.1.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.2.txt
+sha256 f9acef5e9a9021a400b4244fafc06969f41ec594ec57fd7f0ff63bafca0055b3  wireshark-2.2.2.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 227ead6..6a40b8e 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.2.1
+WIRESHARK_VERSION = 2.2.2
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
