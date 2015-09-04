From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Sep 2015 17:02:34 +0200
Subject: [Buildroot] [git commit] dos2unix: bump to version 7.3
Message-ID: <20150904150747.806248016D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99ff3896fd9243a95c2136e8ced9f528250adcf9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dos2unix/dos2unix.hash |    2 +-
 package/dos2unix/dos2unix.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index 7880f1d..b22b6fc 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	551afe005a86e58664b4f41327408e73afafe92400488dd0aab1dad6deb4e72b	dos2unix-7.0.tar.gz
+sha256	8175f7552a72edaaa8918fdee68ce2cbc982dc25452f33d4dc611d769f4944d1	dos2unix-7.3.tar.gz
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index b1d21f2..0d5a674 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.0
+DOS2UNIX_VERSION = 7.3
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2c
 DOS2UNIX_LICENSE_FILES = COPYING.txt
