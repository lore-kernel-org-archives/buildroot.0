From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 09:46:55 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/wireshark:
 security bump to version 3.2.10
Message-ID: <20201222091353.F383B82846@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b550a71e33a928c3cd0c1fbf2eeede81c3d86c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The following vulnerabilities have been fixed:
- wnpa-sec-2020-16 Kafka dissector memory leak. Bug 16739.
  CVE-2020-26418.
- wnpa-sec-2020-17 USB HID dissector crash. Bug 16958. CVE-2020-26421.
- wnpa-sec-2020-18 RTPS dissector memory leak. Bug 16994.
  CVE-2020-26420.

https://www.wireshark.org/docs/relnotes/wireshark-3.2.9.html
https://www.wireshark.org/docs/relnotes/wireshark-3.2.10.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 8d1a3b3a2e..8d4b0c6347 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.8.txt
-sha1  5fdcbbe3a50cea38a8fa5f10b21f58cbef31793e  wireshark-3.2.8.tar.xz
-sha256  a8a595d08f38c6bd083886f6c199b9d4fb007e363031b263667c7da72323cc32  wireshark-3.2.8.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.10.txt
+sha1  691bd151d0d5e7a23b73e7972490947c0af9cf1d  wireshark-3.2.10.tar.xz
+sha256  1e9e239f2449f240a7910ed598084ccaf8ea308b2b46b196c5adbec59612226c  wireshark-3.2.10.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 0d4fedb3f0..91c4420251 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.2.8
+WIRESHARK_VERSION = 3.2.10
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
