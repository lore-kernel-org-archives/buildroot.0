From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 10:47:06 +0100
Subject: [Buildroot] [git commit] package/live555: bump version to 2017.10.28
Message-ID: <20171218095730.1281C7FD0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd42a19a04965859ef0c1fbfa35548089d425e3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/live555/live555.hash | 5 +++--
 package/live555/live555.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index 67500fb..66a7b7d 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,4 +1,5 @@
 # From http://live555.com/liveMedia/public/live555-latest-md5.txt
-md5 890ee3a3ea7a1df5843df9f9429170d7 live.2017.07.18.tar.gz
+md5 a5acd14c4fa7b50f7270304d3b4a70ae live.2017.10.28.tar.gz
 # Locally generated
-sha256 b2e857e47a9bac09958cbf313f160265067555f66f9282f10c6419d63c620ab6  live.2017.07.18.tar.gz
+sha256 d8eaec9ded34321aa655d3c9007217dd447218c54cb48c97827e58ecd5edb338  live.2017.10.28.tar.gz
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index dcd8a95..0507ee9 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2017.07.18
+LIVE555_VERSION = 2017.10.28
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
 LIVE555_LICENSE = LGPL-2.1+
