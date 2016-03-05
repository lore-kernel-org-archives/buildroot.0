From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 14:50:46 +0100
Subject: [Buildroot] [git commit] package/transmission: bump version to 2.90
Message-ID: <20160305135201.06A627FAC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4867887e3f4597dc7fe7c0d06d1ef9c8bc0b9490
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/transmission/transmission.hash | 2 +-
 package/transmission/transmission.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index 4199b37..0dc816d 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a9fc1936b4ee414acc732ada04e84339d6755cd0d097bcbd11ba2cfc540db9eb	transmission-2.84.tar.xz
+sha256	69ff8caf81684155926f437f46bf7df1b1fb304f52c7809f546257e8923f2fd2	transmission-2.90.tar.xz
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index efc00a1..6aecf60 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 2.84
+TRANSMISSION_VERSION = 2.90
 TRANSMISSION_SITE = http://download.transmissionbt.com/files
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_DEPENDENCIES = \
