From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:33 -0000
Subject: [Buildroot] [git commit] package/evtest: bump version to 1.34
Message-ID: <20190903133617.8990B8A5E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46151403c858962995efda44166fe8ea8f998942
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- bump version to 1.34 (for details see [1])
- add hash for license file

[1] https://lists.freedesktop.org/archives/input-tools/2019-August/001517.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/evtest/evtest.hash | 5 ++++-
 package/evtest/evtest.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/evtest/evtest.hash b/package/evtest/evtest.hash
index e131318f47..566d423fcd 100644
--- a/package/evtest/evtest.hash
+++ b/package/evtest/evtest.hash
@@ -1,2 +1,5 @@
 # locally computed
-sha256  9fb68236a6871c163e52433ba8f2cce142c0f4208163a2962768c13f262d549f  evtest-1.33.tar.gz
+sha256 73d5b604d57551418d282fedee3deae9f851afb3c355dccc87153364c046efd3 evtest-1.34.tar.gz
+
+# License files
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6 COPYING
diff --git a/package/evtest/evtest.mk b/package/evtest/evtest.mk
index d00d4cb624..d2fd01c2d9 100644
--- a/package/evtest/evtest.mk
+++ b/package/evtest/evtest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVTEST_VERSION = 1.33
+EVTEST_VERSION = 1.34
 EVTEST_SITE = http://cgit.freedesktop.org/evtest/snapshot
 EVTEST_LICENSE = GPL-2.0+
 EVTEST_LICENSE_FILES = COPYING
