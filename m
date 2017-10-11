From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 11 Oct 2017 15:15:39 +0200
Subject: [Buildroot] [PATCH v1] wiringpi: bump version to
	96344ff7125182989f98d3be8d111952a8f74e15 (the real 2.44)
Message-ID: <20171011131539.19407-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes bug 10391 [1].

[1] https://bugs.busybox.net/show_bug.cgi?id=10391

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/wiringpi/wiringpi.hash | 2 +-
 package/wiringpi/wiringpi.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wiringpi/wiringpi.hash b/package/wiringpi/wiringpi.hash
index 35eedb935f..f4832e5fa8 100644
--- a/package/wiringpi/wiringpi.hash
+++ b/package/wiringpi/wiringpi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 464c98ed54f5c0ad6611e270be3491c4598a32b7e86b208255862a301c564955  wiringpi-2.44.tar.gz
+sha256 4eae1d4f37f77534b1e2db4678a1003a5fd7ced4721c340527e3476d0bed1d9f wiringpi-96344ff7125182989f98d3be8d111952a8f74e15.tar.gz
diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
index cec34fadd1..f2e9e246d9 100644
--- a/package/wiringpi/wiringpi.mk
+++ b/package/wiringpi/wiringpi.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-WIRINGPI_VERSION = 2.44
+# using git commit id instead of (wrong) 2.44 git tag (Bug 10391)
+WIRINGPI_VERSION = 96344ff7125182989f98d3be8d111952a8f74e15
 WIRINGPI_SITE = git://git.drogon.net/wiringPi
 
 WIRINGPI_LICENSE = LGPL-3.0+
-- 
2.14.2
