From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jan 2018 13:39:34 +0100
Subject: [Buildroot] [git commit] netcat-openbsd: bump to version 1.187-1
Message-ID: <20180126124345.45E5D83C7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d91377c1a4236e12b0321ba2a3a65c17223b6308
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netcat-openbsd/netcat-openbsd.hash | 2 +-
 package/netcat-openbsd/netcat-openbsd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netcat-openbsd/netcat-openbsd.hash b/package/netcat-openbsd/netcat-openbsd.hash
index e90a41a..1bf62bb 100644
--- a/package/netcat-openbsd/netcat-openbsd.hash
+++ b/package/netcat-openbsd/netcat-openbsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 f587c02139aedb0bae12fdaef94f8c00649a0b4d603b5a22612e42cb317ba7cf netcat-openbsd-debian_1.178-3.tar.gz
+sha256 63d72b4e5ea629af148d6d655125dcbe48f4996a8a2a8c5e234c62eba2856b5f netcat-openbsd-debian_1.187-1.tar.gz
 sha256 e2e86d58c38f044a49f51e45515747585db58a2305419c73323eaad88fcaef5c debian/copyright
diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index a758714..6d3be50 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETCAT_OPENBSD_VERSION = debian/1.178-3
+NETCAT_OPENBSD_VERSION = debian/1.187-1
 NETCAT_OPENBSD_SITE = git://anonscm.debian.org/collab-maint/netcat-openbsd
 NETCAT_OPENBSD_LICENSE = BSD-3-Clause
 NETCAT_OPENBSD_LICENSE_FILES = debian/copyright
