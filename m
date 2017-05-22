From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 May 2017 14:07:50 +0200
Subject: [Buildroot] [git commit] package/biosdevname: bump to version 0.7.2
Message-ID: <20170601202852.81ECC807D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7dbd396d81ea39bf158353b67991462f922542f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed self-computed sha1 hash, we already provide a sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/biosdevname/biosdevname.hash | 3 +--
 package/biosdevname/biosdevname.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/biosdevname/biosdevname.hash b/package/biosdevname/biosdevname.hash
index a000777..57946ea 100644
--- a/package/biosdevname/biosdevname.hash
+++ b/package/biosdevname/biosdevname.hash
@@ -1,3 +1,2 @@
 # Locally computed hashes, not provided by upstream
-sha1   a926961d6adb673aed062683ab8b80e6418523ea  biosdevname-0.6.0.tar.gz
-sha256 c75bf92d3184f7dd1973af002de152498145021efdd5de46d6bf796acef43914 biosdevname-0.6.0.tar.gz
+sha256 954575f482ff5de2d49c335b563990859a3eb3506e8fa976f6915eba870d71f6  biosdevname-0.7.2.tar.gz
diff --git a/package/biosdevname/biosdevname.mk b/package/biosdevname/biosdevname.mk
index 82f3338..e0de8ef 100644
--- a/package/biosdevname/biosdevname.mk
+++ b/package/biosdevname/biosdevname.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIOSDEVNAME_VERSION = 0.6.0
+BIOSDEVNAME_VERSION = 0.7.2
 BIOSDEVNAME_SITE = http://linux.dell.com/biosdevname/biosdevname-$(BIOSDEVNAME_VERSION)
 BIOSDEVNAME_LICENSE = GPL
 BIOSDEVNAME_LICENSE_FILES = COPYING
