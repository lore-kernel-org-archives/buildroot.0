From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Nov 2014 16:29:14 +0100
Subject: [Buildroot] [git commit] wireshark: security bump to version 1.12.2
Message-ID: <20141113153637.D7093B444A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2689ffbd3dccac361213a25ce2047fe1c6bb406f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2014-8710 - SigComp UDVM buffer overflow.
CVE-2014-8711 - AMQP crash.
CVE-2014-8712 - NCP crashes.
CVE-2014-8713 - NCP crashes.
CVE-2014-8714 - TN5250 infinite loops.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash |    6 +++---
 package/wireshark/wireshark.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 00d3861..9b0c488 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,3 +1,3 @@
-# From https://www.wireshark.org/download/SIGNATURES-1.12.1.txt
-md5	14b3e3d8979d1eb27ff085bb5f400e67	wireshark-1.12.1.tar.bz2
-sha1	e1508ea25ccf077c5a7fa2af3b88f3ae199f77fb	wireshark-1.12.1.tar.bz2
+# From https://www.wireshark.org/download/SIGNATURES-1.12.2.txt
+md5	2f2a16be8b087227cb17733c72288ae4	wireshark-1.12.2.tar.bz2
+sha1	0598fe285725f97045d7d08e6bde04686044b335	wireshark-1.12.2.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index ccf5a56..095050a 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 1.12.1
+WIRESHARK_VERSION = 1.12.2
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
