From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Apr 2016 21:15:24 +0200
Subject: [Buildroot] [git commit] wireshark: security bump to version 2.0.3
Message-ID: <20160425192429.A16D4805F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b077348197497b7ca1ff11d8bafc6dee947bacb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
