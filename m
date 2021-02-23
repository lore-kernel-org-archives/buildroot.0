From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2021 14:03:56 +0100
Subject: [Buildroot] [git commit] package/dav1d: bump version to 0.8.2
Message-ID: <20210308072135.966DA88971@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8939392424efb86bff02dd77994f748eac25c223
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://code.videolan.org/videolan/dav1d/-/releases

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dav1d/dav1d.hash | 2 +-
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index 45152f7a80..520e42fe90 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  842da2945afcf54e651d17112bf2823a238e6c935a6c8dff3a8e96a2eb740269  dav1d-0.8.1.tar.bz2
+sha256  78ec7a1714d98a8f4ecbc4255e83e6c4c944cdd881871ea234ce40153fd3df04  dav1d-0.8.2.tar.bz2
 sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 68f6fc8805..377bd63419 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 0.8.1
+DAV1D_VERSION = 0.8.2
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.bz2
 DAV1D_SITE = https://code.videolan.org/videolan/dav1d/-/archive/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
