From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jan 2016 17:29:28 +0100
Subject: [Buildroot] [git commit] nano: bump to version 2.5.1
Message-ID: <20160111163526.520EA826D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b128278f523ca66a5044981b1755314eba2ced8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/nano.hash | 2 +-
 package/nano/nano.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 8da4b55..8b45847 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  ff323e6fef74caf0a924304841c07ac65ec30db99dc5c1f8272b4c536a5c89ee  nano-2.5.0.tar.gz
+sha256  e06fca01bf183f4d531aa65a28dffc0e2d10185239909eb3de797023f3453bde  nano-2.5.1.tar.gz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 5bcdfd4..0fa9009 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NANO_VERSION = 2.5.0
+NANO_VERSION = 2.5.1
 NANO_SITE = $(BR2_GNU_MIRROR)/nano
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
