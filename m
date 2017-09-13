From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Sep 2017 22:33:12 +0200
Subject: [Buildroot] [git commit] package/nmon: bump version to 16g
Message-ID: <20170913202737.64F6F80F9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=128d233a060172a21787b53b7fe6efa3f6a6e0b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched _SITE to https

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nmon/nmon.hash | 6 +++---
 package/nmon/nmon.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/nmon/nmon.hash b/package/nmon/nmon.hash
index f3a073f..432f71d 100644
--- a/package/nmon/nmon.hash
+++ b/package/nmon/nmon.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/nmon/files/
-md5 a72e3eb737c230cd309329330a5545bd    lmon16f.c
-sha1    b69fdddf86ffe674e0133426fa09935ed678ab7d    lmon16f.c
+md5 246ccfc74d5af55d992601fc4d3d4a72  lmon16g.c
+sha1 926217a98f78dd398d4d5690d7b10b8b2b620168  lmon16g.c
 # Locally computed
-sha256  280a371e17488f8a2c5e0c64273155789be6fa5b937ab5c465488e591bdc5cd9    lmon16f.c
+sha256 da82dd693b503b062854dfe7dbb5d36b347872ab44a4aa05b97e9d577747f688  lmon16g.c
diff --git a/package/nmon/nmon.mk b/package/nmon/nmon.mk
index 2c1ff02..f561d6d 100644
--- a/package/nmon/nmon.mk
+++ b/package/nmon/nmon.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NMON_VERSION = 16f
-NMON_SITE = http://sourceforge.net/projects/nmon/files
+NMON_VERSION = 16g
+NMON_SITE = https://sourceforge.net/projects/nmon/files
 NMON_SOURCE = lmon$(NMON_VERSION).c
 NMON_LICENSE = GPL-3.0+
 NMON_LICENSE_FILES = $(NMON_SOURCE)
