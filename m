From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 07:28:03 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] wireshark: security bump
	to version 2.2.4
Message-ID: <20170125064905.CD38181EC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e08b1f94841f30302c7ae433bea0f8cf0f6d1f61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Fixes:
wnpa-sec-2017-01 - The ASTERIX dissector could go into an infinite loop.
wnpa-sec-2017-02 - The DHCPv6 dissector could go into a large loop.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2515437e51036f0ad2d89ca16d07cd5b022fdbe9)
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index c6d398a..e3eeef3 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,2 +1,2 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.3.txt
-sha256 97bac89e88892054a5848a9f7e0c36aa399a2008900829b078e29cab0ddd593b  wireshark-2.2.3.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.2.4.txt
+sha256 42a7fb35eed5a32478153e24601a284bb50148b7ba919c3e8452652f4c2a3911  wireshark-2.2.4.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 07a3044..edd830d 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.2.3
+WIRESHARK_VERSION = 2.2.4
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
