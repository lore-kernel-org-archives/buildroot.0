From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jan 2017 07:17:25 -0300
Subject: [Buildroot] [PATCH] wireshark: security bump to version 2.2.4
Message-ID: <20170124101725.16296-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
wnpa-sec-2017-01 - The ASTERIX dissector could go into an infinite loop.
wnpa-sec-2017-02 - The DHCPv6 dissector could go into a large loop.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.10.2
