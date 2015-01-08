From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 19:19:30 +0100
Subject: [Buildroot] [git commit] wireshark: security bump to version 1.12.3
Message-ID: <20150108182019.F06DB8083F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2bb550f2b9cccd9295305f376908c90e2d7f3f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-0559, CVE-2015-0560 - The WCCP dissector could crash.
CVE-2015-0561 - The LPP dissector could crash.
CVE-2015-0562 - The DEC DNA Routing Protocol dissector could crash.
CVE-2015-0563 - The SMTP dissector could crash.
CVE-2015-0564 - Wireshark could crash while decypting TLS/SSL sessions.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/wireshark.hash |    6 +++---
 package/wireshark/wireshark.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 9b0c488..f6c5434 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,3 +1,3 @@
-# From https://www.wireshark.org/download/SIGNATURES-1.12.2.txt
-md5	2f2a16be8b087227cb17733c72288ae4	wireshark-1.12.2.tar.bz2
-sha1	0598fe285725f97045d7d08e6bde04686044b335	wireshark-1.12.2.tar.bz2
+# From https://www.wireshark.org/download/SIGNATURES-1.12.3.txt
+md5	e6318b8451d4e56d39bd911da296ef19	wireshark-1.12.3.tar.bz2
+sha1	44ad77b6e80f41ba34ac0eaf477b81cb1345ceed	wireshark-1.12.3.tar.bz2
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index ae69006..d13d80c 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 1.12.2
+WIRESHARK_VERSION = 1.12.3
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
