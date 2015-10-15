From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 13:27:44 +0200
Subject: [Buildroot] [git commit] wireshark: security bump to version 1.12.8
Message-ID: <20151015112748.45C4C8076D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f63dc20700da5bf5b7373a73c435f0019d26f097
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-7830 - Pcapng file parser crash.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/wireshark.hash |    7 ++++---
 package/wireshark/wireshark.mk   |    2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index ad1b043..ee50e3f 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,3 +1,4 @@
-# From https://www.wireshark.org/download/SIGNATURES-1.12.7.txt
-md5	c8ae53f648b1dcbf6e74495401a0f1ab	wireshark-1.12.7.tar.bz2
-sha1	bed365bacfd0b5c653d8568ad25e52957659bd9f	wireshark-1.12.7.tar.bz2
+# From https://www.wireshark.org/download/SIGNATURES-1.12.8.txt
+sha1	d8c23120525a2f3505e822b7684e7367bcd0ba70	wireshark-1.12.8.tar.bz2
+# Calculated based on the hash above
+sha256	357e0a4e49525d80cdc740bb16539fcdb526ad38cc2ed6cabedafc9bdee5c7e7	wireshark-1.12.8.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index a2b7d1d..045fad3 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 1.12.7
+WIRESHARK_VERSION = 1.12.8
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
