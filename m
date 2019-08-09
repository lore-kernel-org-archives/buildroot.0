From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 10 Aug 2019 00:54:19 +0200
Subject: [Buildroot] [PATCH v1] package/evtest: bump version to 1.34
Message-ID: <20190809225419.7951-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- bump version to 1.34 (for details see [1])
- add hash for license file

[1] https://lists.freedesktop.org/archives/input-tools/2019-August/001517.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
--
2.22.0
