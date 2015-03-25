From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 20:03:01 +0100
Subject: [Buildroot] [git commit] openntpd: bump to version 5.7p4
Message-ID: <20150325190309.53FBD7FE24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d67dc62f456e4cdc445591f3a7dac2fa0bb62e77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openntpd/openntpd.hash |    2 +-
 package/openntpd/openntpd.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openntpd/openntpd.hash b/package/openntpd/openntpd.hash
index 4889c5b..e066904 100644
--- a/package/openntpd/openntpd.hash
+++ b/package/openntpd/openntpd.hash
@@ -1,2 +1,2 @@
 # From ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD/SHA256
-sha256	4f417c8a4c21ed7ec3811107829f931404f9bf121855b8571a2ca3355695343a	openntpd-5.7p3.tar.gz
+sha256	a993d95976e375acc0ab1a677fd268f55024477835633c8ae404895046bccb23	openntpd-5.7p4.tar.gz
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 41e3399..d51f902 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENNTPD_VERSION = 5.7p3
+OPENNTPD_VERSION = 5.7p4
 OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3c
 OPENNTPD_LICENSE_FILES = COPYING
