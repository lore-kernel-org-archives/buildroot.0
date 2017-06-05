From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 14:52:34 +0200
Subject: [Buildroot] [git commit] package/libhdhomerun: bump version to
	20161117
Message-ID: <20170605125240.04A508286C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d7eec000a8df31dc2e42e6de3bf7c3dfab95009
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libhdhomerun/libhdhomerun.hash | 2 +-
 package/libhdhomerun/libhdhomerun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhdhomerun/libhdhomerun.hash b/package/libhdhomerun/libhdhomerun.hash
index 7897764..702007f 100644
--- a/package/libhdhomerun/libhdhomerun.hash
+++ b/package/libhdhomerun/libhdhomerun.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	907dfbd1eb82aebd8b09e7c00c21a02433e6baaacf4a4f99aa2511b1d5244baf	libhdhomerun_20150826.tgz
+sha256 23a3484723f3744eb38349d19cbe7d25b5bed27adf64929bd174c1669b194a8a  libhdhomerun_20161117.tgz
diff --git a/package/libhdhomerun/libhdhomerun.mk b/package/libhdhomerun/libhdhomerun.mk
index a68d928..4240ce1 100644
--- a/package/libhdhomerun/libhdhomerun.mk
+++ b/package/libhdhomerun/libhdhomerun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHDHOMERUN_VERSION = 20150826
+LIBHDHOMERUN_VERSION = 20161117
 LIBHDHOMERUN_SOURCE = libhdhomerun_$(LIBHDHOMERUN_VERSION).tgz
 LIBHDHOMERUN_SITE = http://download.silicondust.com/hdhomerun
 LIBHDHOMERUN_LICENSE = LGPL-2.1+
