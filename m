From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Sep 2019 23:30:45 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/samba4: security
 bump to version 4.9.13
Message-ID: <20190904212815.CB9578B682@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ba993ea5c35fadccba5b111ff5be3909937aaa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Release notes: https://www.samba.org/samba/history/samba-4.9.13.html

Fixes CVE-2019-10197
 Combination of parameters and permissions can allow user
 to escape from the share path definition.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 60c724e4b8..d225112cb0 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.9.9.tar.asc
-sha256 af0bf46abc74c62c5a8fe7b567103684b7bf4ce086d32bcd2f6681f592bf63ca  samba-4.9.9.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.9.13.tar.asc
+sha256 ab18331e37766b13dbb07d1f115bda3d794917baf502d0ca2b2b8fff014b88f2  samba-4.9.13.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 063f06d728..0e3c66e178 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.9.9
+SAMBA4_VERSION = 4.9.13
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
