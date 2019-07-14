From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jul 2019 12:35:10 +0200
Subject: [Buildroot] [git commit] package/iozone: bump to version 3_487
Message-ID: <20190714103359.54CDA814DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d766a61c788c42a37d64cef73103ac31ffc5cc90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iozone/iozone.hash | 2 +-
 package/iozone/iozone.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
index 2a027317fc..29dba67b32 100644
--- a/package/iozone/iozone.hash
+++ b/package/iozone/iozone.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	eeaf16cfbee095b16e4934180c6c7438539629489ce42ef4ace48feb23916b12	iozone3_483.tar
+sha256	2c488a7ccddd624fd557af16e71442c367b131d6178e1b4023bbd532bacdda59	iozone3_487.tar
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index 903d2a1882..00573d933d 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3_483
+IOZONE_VERSION = 3_487
 IOZONE_SOURCE = iozone$(IOZONE_VERSION).tar
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
