From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 23:55:21 +0200
Subject: [Buildroot] [git commit] strongswan: update to 5.4.0
Message-ID: <20160413215600.633D97FD5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d78ec543bf45e1965bb65a03c0be6ba7b313a68a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to 5.4.0

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/strongswan/strongswan.hash | 6 +++---
 package/strongswan/strongswan.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index 5a353f1..97fb199 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,4 +1,4 @@
-# From http://download.strongswan.org/strongswan-5.3.5.tar.bz2.md5
-md5	a2f9ea185f27e7f8413d4cd2ee61efe4	strongswan-5.3.5.tar.bz2
+# From http://download.strongswan.org/strongswan-5.4.0.tar.bz2.md5
+md5	9d7c77b0da9b69f859624897e5e9ebbf	strongswan-5.4.0.tar.bz2
 # Calculated based on the hash above
-sha256	2c84b663da652b1ff180a1a73c24a3d7b9fc4b9b8ba6bd07f94a1e33092e6350	strongswan-5.3.5.tar.bz2
+sha256	f8288faaea6a9cd8a7d413c0b76b7922be5da3dfcd01fd05cb30d2c55d3bbe89	strongswan-5.4.0.tar.bz2
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index e435c3a..e27606c 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.3.5
+STRONGSWAN_VERSION = 5.4.0
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPLv2+
