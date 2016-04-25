From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 24 Apr 2016 22:34:42 -0300
Subject: [Buildroot] [PATCH] wireshark: security bump to version 2.0.3
Message-ID: <1461548082-31673-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
WNPA-SEC-2016-19 - The NCP dissector could crash.
WNPA-SEC-2016-20 - TShark could crash due to a packet reassembly bug.
WNPA-SEC-2016-21 - The IEEE 802.11 dissector could crash.
WNPA-SEC-2016-22 - The PKTC dissector could crash.
WNPA-SEC-2016-23 - The PKTC dissector could crash.
WNPA-SEC-2016-24 - The IAX2 dissector could go into an infinite loop.
WNPA-SEC-2016-25 - Wireshark and TShark could exhaust the stack.
WNPA-SEC-2016-26 - The GSM CBCH dissector could crash.
WNPA-SEC-2016-27 - MS-WSP dissector crash.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index ed0d2ef..a9d4a29 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,2 +1,2 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.0.2.txt
-sha256	e921fb072085a5654d899949bb561d0687f4819f7b63ba35777bb949a9b6b9c1	wireshark-2.0.2.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.0.3.txt
+sha256	e196376e75fe21fdef41b4eaa27ce2e1b2b561e7f7b20328a8e96657cc4465fc	wireshark-2.0.3.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 34a5a85..c7bf6c2 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.0.2
+WIRESHARK_VERSION = 2.0.3
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.7.3
