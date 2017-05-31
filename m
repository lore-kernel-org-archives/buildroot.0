From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 22:38:21 +0200
Subject: [Buildroot] [git commit branch/next] package/monolite: bump to
	version 156
Message-ID: <20170531204055.5002382A49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7aa50798d1a24470b59f83c1be09c4468b7ef372
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch bumps monolite to version 156.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/monolite/monolite.hash | 2 +-
 package/monolite/monolite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
index 621e5e4..09f9554 100644
--- a/package/monolite/monolite.hash
+++ b/package/monolite/monolite.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 c01e9ba37d8d8f9ef68e08170b2582cc710a8a77756e2412dff298a39b3c4d2b  monolite-149-latest.tar.gz
+sha256 2cdf6cff1d82d76412461a4c8a3616bb2aa1e835fb55479941662dec3799c924  monolite-156-latest.tar.gz
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index 6b982b3..73f2352 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONOLITE_VERSION = 149
+MONOLITE_VERSION = 156
 MONOLITE_SITE = http://download.mono-project.com/monolite/
 MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPL-2.0 or commercial
