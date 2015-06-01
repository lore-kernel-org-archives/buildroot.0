From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2015 00:02:00 +0200
Subject: [Buildroot] [git commit] strongswan: security bump to version 5.3.1
Message-ID: <20150601220249.B1ED781D62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=373031bfd82c1386f5abb0f2ca49376571917cc5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

CVE-2015-3991 - denial-of-service and potential remote code execution
vulnerability triggered by IKEv1/IKEv2 messages that contain payloads
for the respective other IKE version.
other IKE version

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strongswan/strongswan.hash |    4 ++--
 package/strongswan/strongswan.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index 626356a..e38c736 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,2 +1,2 @@
-# From http://download.strongswan.org/strongswan-5.3.0.tar.bz2.md5
-md5	c52d4228231c2025d9c320d0e9990327	strongswan-5.3.0.tar.bz2
+# From http://download.strongswan.org/strongswan-5.3.1.tar.bz2.md5
+md5	66f258901a3d6c271da1a0c7fb3e5013	strongswan-5.3.1.tar.bz2
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index af21dda..f165eb1 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.3.0
+STRONGSWAN_VERSION = 5.3.1
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPLv2+
