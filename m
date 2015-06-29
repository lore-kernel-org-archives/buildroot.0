From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 29 Jun 2015 08:01:09 +0200
Subject: [Buildroot] [PATCH 1/1] live555: bump to version 2015.06.25
Message-ID: <1435557669-3194-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/live555/live555.hash | 4 ++--
 package/live555/live555.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index d05b18b..e6d9f53 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,4 +1,4 @@
 # From http://live555.com/liveMedia/public/live555-latest-md5.txt
-md5	61ec3927fdff01fdaa831238a857b660	live.2014.11.01.tar.gz
+md5 7c13d58c020efa42369b5f23a839be0c live.2015.06.25.tar.gz
 # Locally generated
-sha256	0896b3b787771496436fd0fad4a6a6905c46d4df50088a412216bf360975ca99	live.2014.11.01.tar.gz
+sha256 c769542f930840ac246155558e163cd94b119f4f6b9e102b6b5b063f9f055875 live.2015.06.25.tar.gz
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index f90d5a4..ab80fb1 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2014.11.01
+LIVE555_VERSION = 2015.06.25
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
 LIVE555_LICENSE = LGPLv2.1+
-- 
1.9.1
