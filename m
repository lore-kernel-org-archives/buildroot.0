From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Apr 2017 17:28:00 +0200
Subject: [Buildroot] [git commit] package/live555: bump version to 2017.04.26
Message-ID: <20170427152846.341CE825D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=833082fdb4c7c242a24486cffffc1e9a6f597732
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/live555/live555.hash | 4 ++--
 package/live555/live555.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index 16f7077..c06e13b 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,4 +1,4 @@
 # From http://live555.com/liveMedia/public/live555-latest-md5.txt
-md5	df4ad1d60c2f5ae8155fb077bb011ab3	live.2016.03.16.tar.gz
+md5 7155e2d7313ef92929a8268856f0551c live.2017.04.26.tar.gz
 # Locally generated
-sha256	6f98a96d4cf6e986c7711f0a2431c02cb807a8107d6715eb491a6ed9d0446cf6	live.2016.03.16.tar.gz
+sha256 a97372c84d49520dbaa595b65c39800fbd7813e717b5df9cd6c70308ce1a6033  live.2017.04.26.tar.gz
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index a6dd13c..e51b588 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2016.03.16
+LIVE555_VERSION = 2017.04.26
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
 LIVE555_LICENSE = LGPL-2.1+
