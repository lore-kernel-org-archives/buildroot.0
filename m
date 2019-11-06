From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2019 15:46:16 +0100
Subject: [Buildroot] [git commit] package/linux-serial-test: bump version
Message-ID: <20191106144146.580B18E8AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef17e5a15eb9769c29db6c46b8e2da228e0c6e94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest version specifies the CMake project type as C-only.
Otherwise the build will fail for configurations without C++ compiler.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-serial-test/linux-serial-test.hash | 2 +-
 package/linux-serial-test/linux-serial-test.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-serial-test/linux-serial-test.hash b/package/linux-serial-test/linux-serial-test.hash
index 64340d3e52..e8844528b9 100644
--- a/package/linux-serial-test/linux-serial-test.hash
+++ b/package/linux-serial-test/linux-serial-test.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d04f4420abfeda5ee62662e790ea6ae5ddc2e758870e04ab76fa35d6de9cdce0  linux-serial-test-9965dad53ba63eea0eea05a0f9d5cb851425fcba.tar.gz
+sha256  edbb3ec1f287ec0fb96bac4e6a580a024af1d16b767a15f3c1b0163ff518fb71  linux-serial-test-5d11b31d9c9807cd58e53a8628bc6402b6fe7fac.tar.gz
 sha256  a2a6760c2c6fa779a635e4a7ad00f668862ebcadb2a8a57d16662543e103e08c  LICENSES/MIT
diff --git a/package/linux-serial-test/linux-serial-test.mk b/package/linux-serial-test/linux-serial-test.mk
index e10a45ce90..42894ed181 100644
--- a/package/linux-serial-test/linux-serial-test.mk
+++ b/package/linux-serial-test/linux-serial-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_SERIAL_TEST_VERSION = 9965dad53ba63eea0eea05a0f9d5cb851425fcba
+LINUX_SERIAL_TEST_VERSION = 5d11b31d9c9807cd58e53a8628bc6402b6fe7fac
 LINUX_SERIAL_TEST_SITE = $(call github,cbrake,linux-serial-test,$(LINUX_SERIAL_TEST_VERSION))
 LINUX_SERIAL_TEST_LICENSE = MIT
 LINUX_SERIAL_TEST_LICENSE_FILES = LICENSES/MIT
