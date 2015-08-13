From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 13 Aug 2015 08:04:55 -0300
Subject: [Buildroot] [PATCH] wireshark: security bump to version 1.12.7
Message-ID: <1439463895-29663-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
wnpa-sec-2015-21 - Protocol tree crash.
wnpa-sec-2015-22 - Memory manager crash.
wnpa-sec-2015-23 - Dissector table crash.
wnpa-sec-2015-24 - ZigBee crash.
wnpa-sec-2015-25 - GSM RLC/MAC inifite loop.
wnpa-sec-2015-26 - WaveAgent crash.
wnpa-sec-2015-27 - OpenFlow infinite loop.
wnpa-sec-2015-28 - Ptvcursor crash.
wnpa-sec-2015-29 - WCCP crash.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index b8368b3..ad1b043 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,3 +1,3 @@
-# From https://www.wireshark.org/download/SIGNATURES-1.12.6.txt
-md5  25ad2bc1c2a21396827c238fcff51bf3  wireshark-1.12.6.tar.bz2
-sha1  5b592bd0389b76d3bdee6a7336e9492f8162c94d  wireshark-1.12.6.tar.bz2
+# From https://www.wireshark.org/download/SIGNATURES-1.12.7.txt
+md5	c8ae53f648b1dcbf6e74495401a0f1ab	wireshark-1.12.7.tar.bz2
+sha1	bed365bacfd0b5c653d8568ad25e52957659bd9f	wireshark-1.12.7.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index af3d67c..a2b7d1d 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 1.12.6
+WIRESHARK_VERSION = 1.12.7
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.4.6
