From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 21:44:23 +0200
Subject: [Buildroot] [git commit branch/next] package/bustle: bump version
	to 0.5.4
Message-ID: <20170522194427.C74C48288B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7ed468baf6d8cc9f2ae30be5a052bfc7d567f08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bustle/bustle.hash | 2 +-
 package/bustle/bustle.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bustle/bustle.hash b/package/bustle/bustle.hash
index 9c6df56..49890f7 100644
--- a/package/bustle/bustle.hash
+++ b/package/bustle/bustle.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	6c76cb5182c20b8ce7d6911f8aebc4fae43f919e747a003f1a66698628b27682  bustle-0.4.3.tar.gz
+sha256 921c2cbbb957dcb02c3aa8fd1eeff3534cb437fa9eeca1c25206ad1e741a3f14  bustle-0.5.4.tar.gz
diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index 4cd4460..ffbfbe4 100644
--- a/package/bustle/bustle.mk
+++ b/package/bustle/bustle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSTLE_VERSION = 0.4.3
+BUSTLE_VERSION = 0.5.4
 BUSTLE_SITE = http://www.willthompson.co.uk/bustle/releases/$(BUSTLE_VERSION)
 BUSTLE_LICENSE = LGPL-2.1+
 BUSTLE_LICENSE_FILES = LICENSE
