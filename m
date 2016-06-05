From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 22:15:50 +0200
Subject: [Buildroot] [git commit] lvm2: bump to version 2.02.155
Message-ID: <20160605201808.B51327FA9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3af591edc52a80f96db58fe89a67c62eb70debb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.hash | 2 +-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 97b1b58..fb72358 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,2 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 aa0599d9c77099f750237ad230c91a35890b248130b81bfd81fc72f510b2b21f28a87491532f4ab1d040338fa6945af6391d032a574538f8672072ac8c185eef  LVM2.2.02.154.tgz
+sha512 f2c7bad06d443aa96961f70951b55de764a882c67e94fdeec2eba83f8a9c9b736971a58bbb01ae7c35d43b39ad2a69128369c6bd74ab81f3c5770c4b67e753f8  LVM2.2.02.155.tgz
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 1a3241d..65860b5 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.154
+LVM2_VERSION = 2.02.155
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
