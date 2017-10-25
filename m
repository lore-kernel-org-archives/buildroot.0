From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Oct 2017 09:45:43 +0200
Subject: [Buildroot] [git commit] s6: bump version to 2.6.1.1
Message-ID: <20171025073940.DBAD17F9BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c43ed8d9d08ddab85373460e697a56311d663155
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/s6/s6.hash | 2 +-
 package/s6/s6.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6/s6.hash b/package/s6/s6.hash
index 41f3dff..2f498b0 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 f0de303791134302f2630b9fe76a936b064e1e3aa772c8ae1b891155a6ea2c79  s6-2.6.1.0.tar.gz
+sha256 0172b7293d4d5607ca3ca77382fee9b87c10bd58680720b29625cf35afc75c5c  s6-2.6.1.1.tar.gz
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index da9917c..3cf3885 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_VERSION = 2.6.1.0
+S6_VERSION = 2.6.1.1
 S6_SITE = http://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
