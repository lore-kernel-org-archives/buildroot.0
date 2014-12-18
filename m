From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 18 Dec 2014 15:26:51 -0300
Subject: [Buildroot] [PATCH] tcpreplay: bump to version 4.1.0
Message-ID: <1418927211-23461-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tcpreplay/tcpreplay.hash | 6 +++---
 package/tcpreplay/tcpreplay.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index d7e8f1d..7d153e5 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/tcpreplay/files/tcpreplay/4.0.5/
-md5	1a6f108a62bf526eeffa2998a6f311af	tcpreplay-4.0.5.tar.gz
-sha1	878970d77e1482c9b26ac19eb2d125915a900f9b	tcpreplay-4.0.5.tar.gz
+# From http://sourceforge.net/projects/tcpreplay/files/tcpreplay/4.1.0/
+md5	fd48d73d84ade30ece0a9abb538c82d5	tcpreplay-4.1.0.tar.gz
+sha1	9723d82a0136d963bcc2665d562cb562d216a1c1	tcpreplay-4.1.0.tar.gz
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index e937af9..1dbe453 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.0.5
+TCPREPLAY_VERSION = 4.1.0
 TCPREPLAY_SITE = http://downloads.sourceforge.net/project/tcpreplay/tcpreplay/$(TCPREPLAY_VERSION)
 TCPREPLAY_LICENSE = GPLv3
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
-- 
2.0.4
