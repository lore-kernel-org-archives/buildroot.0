From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Mar 2016 11:17:03 +0200
Subject: [Buildroot] [PATCH v2 18/18] package/live555: bump version to
	2016.03.16
In-Reply-To: <1459070223-5901-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459070223-5901-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1459070223-5901-19-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/live555/live555.hash | 4 ++--
 package/live555/live555.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index 813a5b4..16f7077 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,4 +1,4 @@
 # From http://live555.com/liveMedia/public/live555-latest-md5.txt
-md5	6275484ab763673ad3144648bf1015cb	live.2016.01.29.tar.gz
+md5	df4ad1d60c2f5ae8155fb077bb011ab3	live.2016.03.16.tar.gz
 # Locally generated
-sha256	44243a962adae64703c00264dd2333cfee15d7edbd79de4e5b47fd486df9ecd1	live.2016.01.29.tar.gz
+sha256	6f98a96d4cf6e986c7711f0a2431c02cb807a8107d6715eb491a6ed9d0446cf6	live.2016.03.16.tar.gz
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index d40cbaa..3ccba63 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2016.01.29
+LIVE555_VERSION = 2016.03.16
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
 LIVE555_LICENSE = LGPLv2.1+
-- 
2.8.0.rc3
