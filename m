From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Jun 2016 09:13:57 -0300
Subject: [Buildroot] [PATCH] wireshark: security bump to version 2.0.4
Message-ID: <1465388037-26167-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
WNPA-SEC-2016-29 - The SPOOLS dissector could go into an infinite loop.
WNPA-SEC-2016-30 - The IEEE 802.11 dissector could crash.
WNPA-SEC-2016-31 - The IEEE 802.11 dissector could crash.
WNPA-SEC-2016-32 - The UMTS FP dissector could crash.
WNPA-SEC-2016-33 - Some USB dissectors could crash.
WNPA-SEC-2016-34 - The Toshiba file parser could crash.
WNPA-SEC-2016-35 - The CoSine file parser could crash.
WNPA-SEC-2016-36 - The NetScreen file parser could crash.
WNPA-SEC-2016-37 - The Ethernet dissector could crash.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wireshark/wireshark.hash | 4 ++--
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index a9d4a29..abe961b 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,2 +1,2 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.0.3.txt
-sha256	e196376e75fe21fdef41b4eaa27ce2e1b2b561e7f7b20328a8e96657cc4465fc	wireshark-2.0.3.tar.bz2
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.0.4.txt
+sha256	9ea9c82da9942194ebc8fc5c951a02e6d179afa7472cb6d96ca76154510de1a5	wireshark-2.0.4.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index c7bf6c2..59670f9 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 2.0.3
+WIRESHARK_VERSION = 2.0.4
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.7.3
