From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 14:50:29 +0200
Subject: [Buildroot] [git commit] package/boinc: bump version to 7.16.1
Message-ID: <20190903133623.00D778A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3cf36896ee514ac83629e6d1b0da4c13f5619574
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boinc/boinc.hash | 2 +-
 package/boinc/boinc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/boinc/boinc.hash b/package/boinc/boinc.hash
index eeaaf68edd..df30a5c508 100644
--- a/package/boinc/boinc.hash
+++ b/package/boinc/boinc.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 970aedb9e25afa20be67f125ab05435df8eb2e66a3ac30ad316c54085e397c88  boinc-7.14.2.tar.gz
+sha256 a886257cdf6beeb39536849bb21d8c0731a8e551b15c56f6949c65b140c6febf  boinc-7.16.1.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256 a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
index dd468c7678..789a01ffef 100644
--- a/package/boinc/boinc.mk
+++ b/package/boinc/boinc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BOINC_VERSION_MAJOR = 7.14
-BOINC_VERSION = $(BOINC_VERSION_MAJOR).2
+BOINC_VERSION_MAJOR = 7.16
+BOINC_VERSION = $(BOINC_VERSION_MAJOR).1
 # client_release can be used to build the Client and Manager but not the Server
 # part. The Server currently has no versioning (see
 # https://github.com/BOINC/boinc/pull/1798).
