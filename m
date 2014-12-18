From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Dec 2014 22:55:50 +0100
Subject: [Buildroot] [git commit] tcpreplay: bump to version 4.1.0
Message-ID: <20141218220056.5F4397FED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27dde92fa8dd437cdd55b675adcfe85ae274c034
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpreplay/tcpreplay.hash |    6 +++---
 package/tcpreplay/tcpreplay.mk   |    2 +-
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
