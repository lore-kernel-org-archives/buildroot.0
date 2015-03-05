From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Mar 2015 07:29:34 -0300
Subject: [Buildroot] [PATCH] wireshark: security bump to version 1.12.4
Message-ID: <1425551374-11049-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2015-2187 - The ATN-CPDLC dissector could crash.
CVE-2015-2188 - The WCP dissector could crash.
CVE-2015-2189 - The pcapng file parser could crash.
CVE-2015-2190 - The LLDP dissector could crash.
CVE-2015-2191 - The TNEF dissector could go into an infinite loop.
CVE-2015-2192 - The SCSI OSD dissector could go into an infinite loop.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index f6c5434..fa4cf18 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,3 +1,3 @@
-# From https://www.wireshark.org/download/SIGNATURES-1.12.3.txt
-md5	e6318b8451d4e56d39bd911da296ef19	wireshark-1.12.3.tar.bz2
-sha1	44ad77b6e80f41ba34ac0eaf477b81cb1345ceed	wireshark-1.12.3.tar.bz2
+# From https://www.wireshark.org/download/SIGNATURES-1.12.4.txt
+md5	acfa156fd35cb66c867b1ace992e4b5b	wireshark-1.12.4.tar.bz2
+sha1	dbbd4090c02fe170f35b26fa26d8aba0b399c659	wireshark-1.12.4.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index d13d80c..434687c 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 1.12.3
+WIRESHARK_VERSION = 1.12.4
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.0.5
