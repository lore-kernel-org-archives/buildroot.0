From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 17:58:19 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/live555: bump
 version to 2018.08.05
Message-ID: <20181024155855.270AA88D96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5672d609a02d009be0d895616eac55f81f5232f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e305ae1c1b7b2b68f28842eaf8aed7a81d07a90a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/live555/live555.hash | 4 ++--
 package/live555/live555.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index 66a7b7d74c..d74d674c7a 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,5 +1,5 @@
 # From http://live555.com/liveMedia/public/live555-latest-md5.txt
-md5 a5acd14c4fa7b50f7270304d3b4a70ae live.2017.10.28.tar.gz
+md5 93c65b0f55f37835c727bbf65c1b61b4 live.2018.08.05.tar.gz
 # Locally generated
-sha256 d8eaec9ded34321aa655d3c9007217dd447218c54cb48c97827e58ecd5edb338  live.2017.10.28.tar.gz
+sha256 c309fb6d499557250b4db8371243715b9ee2cdaa7ccacaf254bcc62e97566ae4  live.2018.08.05.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 0507ee9b1b..a5479d6d7c 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2017.10.28
+LIVE555_VERSION = 2018.08.05
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
 LIVE555_LICENSE = LGPL-2.1+
