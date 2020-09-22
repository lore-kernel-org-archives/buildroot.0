From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Sep 2020 21:42:51 +0200
Subject: [Buildroot] [git commit] package/live555: bump to version 2020.08.19
Message-ID: <20200922193320.C958083C43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8489c6d80654b4c0ecb629f1e5b606140394006c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to changelog this version fixes memory leaks and buffer overflows.
- http://live555.com/liveMedia/public/changelog.txt

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/live555/live555.hash | 4 ++--
 package/live555/live555.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index 52ca068288..5e65cacd7b 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,5 +1,5 @@
 # From http://www.live555.com/liveMedia/public/live555-latest-md5.txt
-md5  327bc53f60361c6d703d52e86f476f11  live.2020.06.25.tar.gz
+md5  4645d2a0c865505c85b48af5317bcb4a  live.2020.08.19.tar.gz
 # Locally generated
-sha256  f206309f10d281990889b7a0c92c26a7fa55ac0e8568bf594b9b27433b4db585  live.2020.06.25.tar.gz
+sha256  af3af7f2510b0b45f38892c232abca2cee2ab36a62503e7085b47ed2c3c2c537  live.2020.08.19.tar.gz
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index e7be6024c9..4bbe35d6ea 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2020.06.25
+LIVE555_VERSION = 2020.08.19
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public
 # There is a COPYING file with the GPL-3.0 license text, but none of
