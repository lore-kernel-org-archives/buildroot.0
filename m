From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 14:38:38 +0200
Subject: [Buildroot] [git commit] package/hdparm: bump version to 9.58
Message-ID: <20190903133622.B8DF28A5E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fade4c28ad60bcad9c764b7a77c50ce2ea6fb68f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://sourceforge.net/p/hdparm/news/2018/10/hdparm-957-is-released/
https://sourceforge.net/p/hdparm/news/2018/10/hdparm-958-is-released/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hdparm/hdparm.hash | 6 +++---
 package/hdparm/hdparm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/hdparm/hdparm.hash b/package/hdparm/hdparm.hash
index 2ce23cf84e..4251b5a65c 100644
--- a/package/hdparm/hdparm.hash
+++ b/package/hdparm/hdparm.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/hdparm/files/hdparm/
-md5 7900608e32834f65d2654fdb696e71a0  hdparm-9.56.tar.gz
-sha1 9e143065115229c4f929530157627dc92e5f6deb  hdparm-9.56.tar.gz
+md5 4652c49cf096a64683c05f54b4fa4679  hdparm-9.58.tar.gz
+sha1 b3425a141f1c0fe9f53b18631437129c2155ee45  hdparm-9.58.tar.gz
 # Locally computed
-sha256 6ff9ed695f1017396eec4101f990f114b7b0e0a04c5aa6369c0394053d16e4da  hdparm-9.56.tar.gz
+sha256  9ae78e883f3ce071d32ee0f1b9a2845a634fc4dd94a434e653fdbef551c5e10f hdparm-9.58.tar.gz
 sha256  eae572b06d2733f5c65fbe81680ce2b8a109afee2bdd1a161343c772af0e82e1 LICENSE.TXT
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index 7ed1ed8624..9826dde010 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HDPARM_VERSION = 9.56
+HDPARM_VERSION = 9.58
 HDPARM_SITE = http://downloads.sourceforge.net/project/hdparm/hdparm
 HDPARM_LICENSE = BSD-Style
 HDPARM_LICENSE_FILES = LICENSE.TXT
