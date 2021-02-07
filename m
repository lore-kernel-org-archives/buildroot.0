From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 23:14:21 +0100
Subject: [Buildroot] [git commit] package/pigz: bump version to 2.6
Message-ID: <20210207215411.0997F81481@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef6778f2e466096a864169b3dd9675c60c80018b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to various commits bumping the version number:
https://github.com/madler/pigz/commits/master/README

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pigz/pigz.hash | 4 ++--
 package/pigz/pigz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pigz/pigz.hash b/package/pigz/pigz.hash
index ec75b4e530..512bf785c7 100644
--- a/package/pigz/pigz.hash
+++ b/package/pigz/pigz.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e228e7d18b34c4ece8d596eb6eee97bde533c6beedbb728d07d3abe90b4b1b52  pigz-2.4.tar.gz
-sha256	dc8f78258cdb4478b5922f4c00eb63d3cbac06c171dc829648fd414bb0cf4493  README
+sha256  577673676cd5c7219f94b236075451220bae3e1ca451cf849947a2998fbf5820  pigz-2.6.tar.gz
+sha256  830b3e1b05cc20f443d89d7d8703a3c63fd64c57ab716f5e81fd178517df1e11  README
diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
index 23df0f5fcb..fdf5fa40e8 100644
--- a/package/pigz/pigz.mk
+++ b/package/pigz/pigz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGZ_VERSION = 2.4
+PIGZ_VERSION = 2.6
 PIGZ_SITE = $(call github,madler,pigz,v$(PIGZ_VERSION))
 PIGZ_DEPENDENCIES = zlib
 HOST_PIGZ_DEPENDENCIES = host-zlib
