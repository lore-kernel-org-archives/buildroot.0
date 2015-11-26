From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 21:23:18 +0100
Subject: [Buildroot] [git commit] strongswan: bump to version 5.3.5
Message-ID: <20151126202329.1054381F64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66fb7028ed2779fcba45221143d6d2c5b9084303
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes only one connection regresssion in 5.3.4, see
https://wiki.strongswan.org/issues/1213

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strongswan/strongswan.hash |    6 +++---
 package/strongswan/strongswan.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index 4d6fd07..5a353f1 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,4 +1,4 @@
-# From http://download.strongswan.org/strongswan-5.3.4.tar.bz2.md5
-md5	655a632a515c74a99f2e9cc337ab2f33	strongswan-5.3.4.tar.bz2
+# From http://download.strongswan.org/strongswan-5.3.5.tar.bz2.md5
+md5	a2f9ea185f27e7f8413d4cd2ee61efe4	strongswan-5.3.5.tar.bz2
 # Calculated based on the hash above
-sha256	938ad1f7b612e039f1d32333f4865160be70f9fb3c207a31127d0168116459aa	strongswan-5.3.4.tar.bz2
+sha256	2c84b663da652b1ff180a1a73c24a3d7b9fc4b9b8ba6bd07f94a1e33092e6350	strongswan-5.3.5.tar.bz2
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index b4003d3..e435c3a 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.3.4
+STRONGSWAN_VERSION = 5.3.5
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPLv2+
