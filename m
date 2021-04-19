From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 23:21:26 +0200
Subject: [Buildroot] [git commit] package/linux-serial-test: bump version
Message-ID: <20210419205647.84BC983D90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd82bedfd1b0da171b9fde0af92b36116bdf8adb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Give this package some love and update to the newest version. There are
no released versions, though. Therefore, use the latest commit.

Notable changes:
 - RS485 support fixes and features
 - internal loopback support

Signed-off-by: Michael Walle <michael@walle.cc>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-serial-test/linux-serial-test.hash | 2 +-
 package/linux-serial-test/linux-serial-test.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-serial-test/linux-serial-test.hash b/package/linux-serial-test/linux-serial-test.hash
index 5cbf00a7e4..38b98a610f 100644
--- a/package/linux-serial-test/linux-serial-test.hash
+++ b/package/linux-serial-test/linux-serial-test.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bfc25088e960c18e151f978b13d893dbee9a3e377e062bd56caab1bd409e4dcb  linux-serial-test-13bea838f2a7573d2a68a6d95fc9d1f153b580be.tar.gz
+sha256  bd612ad9c10cb8090765487d5e2969be09dd0d024e7215dc764e770fbb5cc9e0  linux-serial-test-bf865c37ccf9cbb1826ada61037c036dc1990b7b.tar.gz
 sha256  a2a6760c2c6fa779a635e4a7ad00f668862ebcadb2a8a57d16662543e103e08c  LICENSES/MIT
diff --git a/package/linux-serial-test/linux-serial-test.mk b/package/linux-serial-test/linux-serial-test.mk
index b0f5fe4ebf..ccb39280ec 100644
--- a/package/linux-serial-test/linux-serial-test.mk
+++ b/package/linux-serial-test/linux-serial-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_SERIAL_TEST_VERSION = 13bea838f2a7573d2a68a6d95fc9d1f153b580be
+LINUX_SERIAL_TEST_VERSION = bf865c37ccf9cbb1826ada61037c036dc1990b7b
 LINUX_SERIAL_TEST_SITE = $(call github,cbrake,linux-serial-test,$(LINUX_SERIAL_TEST_VERSION))
 LINUX_SERIAL_TEST_LICENSE = MIT
 LINUX_SERIAL_TEST_LICENSE_FILES = LICENSES/MIT
