From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2016 21:37:20 +0100
Subject: [Buildroot] [git commit] tcpreplay: bump to version 4.1.1
Message-ID: <20160112204022.B6D5C8274C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2741d20d64ce08ea7ef60807e65567bd2c1598ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpreplay/tcpreplay.hash | 5 ++---
 package/tcpreplay/tcpreplay.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index 7d153e5..95d6d5d 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,3 +1,2 @@
-# From http://sourceforge.net/projects/tcpreplay/files/tcpreplay/4.1.0/
-md5	fd48d73d84ade30ece0a9abb538c82d5	tcpreplay-4.1.0.tar.gz
-sha1	9723d82a0136d963bcc2665d562cb562d216a1c1	tcpreplay-4.1.0.tar.gz
+# Locally calculated after checking pgp signature
+sha256	61b916ef91049cad2a9ddc8de6f5e3e3cc5d9998dbb644dc91cf3a798497ffe4	tcpreplay-4.1.1.tar.gz
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index f6bd08f..b32810f 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.1.0
-TCPREPLAY_SITE = http://downloads.sourceforge.net/project/tcpreplay/tcpreplay/$(TCPREPLAY_VERSION)
+TCPREPLAY_VERSION = 4.1.1
+TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_LICENSE = GPLv3
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
 TCPREPLAY_CONF_ENV = \
