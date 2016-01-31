From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 21:08:44 +0100
Subject: [Buildroot] [git commit] package/openswan: bump version to 2.6.46
Message-ID: <20160201224709.BFE727F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cefcb852cfaac99cdba3d202ff1ad0618a3a5cad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openswan/openswan.hash | 4 ++--
 package/openswan/openswan.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openswan/openswan.hash b/package/openswan/openswan.hash
index ef4e18b..5929f8d 100644
--- a/package/openswan/openswan.hash
+++ b/package/openswan/openswan.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	b657b4a3828fc6e9830aabeabec047a71993daeb9dd2607f321e355bc5a53e1e	openswan-2.6.45.tar.gz
+# Locally calculated
+sha256	c1605c96d3c3cf357cefea7622f3acbc7a02d6a3cebfb76979327b566084a5ea	openswan-2.6.46.tar.gz
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 7fa945f..54bd4b3 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSWAN_VERSION = 2.6.45
+OPENSWAN_VERSION = 2.6.46
 OPENSWAN_SITE = http://download.openswan.org/openswan
 OPENSWAN_LICENSE = GPLv2+, BSD-3c
 OPENSWAN_LICENSE_FILES = COPYING LICENSE
