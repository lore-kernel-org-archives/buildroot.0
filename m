From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:10:32 +0200
Subject: [Buildroot] [git commit] package/netcat-openbsd: bump to version
 1.195-2
Message-ID: <20190602201236.7207781354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4898de2081caf6664160e96a0fc8245fe19c7153
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netcat-openbsd/netcat-openbsd.hash | 2 +-
 package/netcat-openbsd/netcat-openbsd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netcat-openbsd/netcat-openbsd.hash b/package/netcat-openbsd/netcat-openbsd.hash
index 2cf4713449..cfa65ee24b 100644
--- a/package/netcat-openbsd/netcat-openbsd.hash
+++ b/package/netcat-openbsd/netcat-openbsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 06b04b163e8c923943b9fc276eea555625f615a530d5bd8fbdbc1af9b2b0d5db netcat-openbsd-debian_1.190-1.tar.gz
+sha256 b46c11f83f66c41ad8f413e842c51a9fb2c495e9a2ed836e6ee75bc314545c30 netcat-openbsd-debian_1.195-2.tar.gz
 sha256 e2e86d58c38f044a49f51e45515747585db58a2305419c73323eaad88fcaef5c debian/copyright
diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index b313116b3f..a2333531c0 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETCAT_OPENBSD_VERSION = debian/1.190-1
+NETCAT_OPENBSD_VERSION = debian/1.195-2
 NETCAT_OPENBSD_SITE = https://salsa.debian.org/debian/netcat-openbsd.git
 NETCAT_OPENBSD_SITE_METHOD = git
 NETCAT_OPENBSD_LICENSE = BSD-3-Clause
