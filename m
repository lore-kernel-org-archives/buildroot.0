From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 21:14:59 +0100
Subject: [Buildroot] [git commit] strongswan: security bump to version 5.3.4
Message-ID: <20151116201506.0467F81D82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8963207bf6837fb19ff811d87486cf10d790cc38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-8023 - authentication bypass vulnerability in the eap-mschapv2
plugin that was caused by insufficient verification of the internal
state when handling EAP-MSCHAPv2 Success messages received by the
client.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/strongswan/strongswan.hash |    6 +++---
 package/strongswan/strongswan.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index 5e1cf4d..4d6fd07 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,4 +1,4 @@
-# From http://download.strongswan.org/strongswan-5.3.3.tar.bz2.md5
-md5	5a25f3d1c31a77ef44d14a2e7b3eaad0	strongswan-5.3.3.tar.bz2
+# From http://download.strongswan.org/strongswan-5.3.4.tar.bz2.md5
+md5	655a632a515c74a99f2e9cc337ab2f33	strongswan-5.3.4.tar.bz2
 # Calculated based on the hash above
-sha256	39d2e8f572a57a77dda8dd8bdaf2ee47ad3cefeb86bbb840d594aa75f00f33e2	strongswan-5.3.3.tar.bz2
+sha256	938ad1f7b612e039f1d32333f4865160be70f9fb3c207a31127d0168116459aa	strongswan-5.3.4.tar.bz2
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index ff4c072..b4003d3 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.3.3
+STRONGSWAN_VERSION = 5.3.4
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPLv2+
