From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Sep 2016 13:39:18 +0200
Subject: [Buildroot] [git commit] bind: bump version to 9.10.4-P3
Message-ID: <20160928123808.98AD1805EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a808500f2a189e1d4b079ac1d6a2eaa3a0bb59d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 0fb4eb4..8acfda5 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/bind9/9.10.4-P2/bind-9.10.4-P2.tar.gz.sha256.asc
-sha256 b35b8af8fe030196d03b3e487f5ecd0c0836b5e124abc7a3ecd184740b444423  bind-9.10.4-P2.tar.gz
+# Verified from ftp://ftp.isc.org/isc/bind9/9.10.4-P3/bind-9.10.4-P3.tar.gz.sha256.asc
+sha256 a075e5ce89fddccb0e64d1777d59161387dd5151cf4e7d1a93875a487812baef  bind-9.10.4-P3.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index fc9e30e..e6bf204 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.10.4-P2
+BIND_VERSION = 9.10.4-P3
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
