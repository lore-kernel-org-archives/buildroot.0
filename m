From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 03:11:06 +0200
Subject: [Buildroot] [git commit] package/live555: bump version to 2016.03.16
Message-ID: <20160329011110.A1724817F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=715ecdfc794a8074715b17a58d3b0e4d606cc25a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
