From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Oct 2017 09:45:49 +0200
Subject: [Buildroot] [git commit] s6-rc: bump version to 0.3.0.0
Message-ID: <20171025073940.EE9D47F9BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68cd9373f88c8c4cea79f342d18bb75c742767bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/s6-rc/s6-rc.hash | 2 +-
 package/s6-rc/s6-rc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-rc/s6-rc.hash b/package/s6-rc/s6-rc.hash
index c39629b..7ee1387 100644
--- a/package/s6-rc/s6-rc.hash
+++ b/package/s6-rc/s6-rc.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 4fa35cf8af41498c9fa0c21220dcdc7595a18ebc2975a254d719f7e1c864b1f0  s6-rc-0.2.1.2.tar.gz
+sha256 78266a397330d35d5eac9e99d1436feba58e36f41bfe1db0fd16c4b6cc73c999  s6-rc-0.3.0.0.tar.gz
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 9330c03..e651814 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_RC_VERSION = 0.2.1.2
+S6_RC_VERSION = 0.3.0.0
 S6_RC_SITE = http://skarnet.org/software/s6-rc
 S6_RC_LICENSE = ISC
 S6_RC_LICENSE_FILES = COPYING
