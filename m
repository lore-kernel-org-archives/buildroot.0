From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Oct 2018 16:31:03 +0200
Subject: [Buildroot] [git commit] package/live555: security bump to version
 2018.10.17
Message-ID: <20181023143007.6C16A885F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01d7686c907eab026781d700999ba09dec29b48e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: http://www.live555.com/liveMedia/public/changelog.txt

Fixes CVE-2018-4013:
https://security-tracker.debian.org/tracker/CVE-2018-4013

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/live555/live555.hash | 4 ++--
 package/live555/live555.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index d74d674c7a..024dcac124 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,5 +1,5 @@
 # From http://live555.com/liveMedia/public/live555-latest-md5.txt
-md5 93c65b0f55f37835c727bbf65c1b61b4 live.2018.08.05.tar.gz
+md5 3383dea853735b7a73eda6ddb52b6372 live.2018.10.17.tar.gz
 # Locally generated
-sha256 c309fb6d499557250b4db8371243715b9ee2cdaa7ccacaf254bcc62e97566ae4  live.2018.08.05.tar.gz
+sha256 7c68d9c95b39acd309a2b6a4fc14c3837544a9be3f64062ed38d1ad6f68dc9e8  live.2018.10.17.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index a5479d6d7c..6a6d353650 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2018.08.05
+LIVE555_VERSION = 2018.10.17
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
 LIVE555_LICENSE = LGPL-2.1+
