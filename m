From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Jun 2020 22:55:16 +0200
Subject: [Buildroot] [git commit] package/stellarium: bump version to 0.20.2
Message-ID: <20200625205908.34BD9820FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9fa269a087c791de0c830189e9e904feb1ce54b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/stellarium/stellarium.hash | 6 +++---
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index 76da2d0b3b..7f29290aee 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,6 +1,6 @@
 # From https://github.com/Stellarium/stellarium/releases
-md5  19422ba4800fbede0a71a723cf3df10f  stellarium-0.20.1.tar.gz
-sha1  20d89ff8e26bb8cef71796d138176be2602e6327   stellarium-0.20.0.tar.gz
-sha256  154e7bd9d4b914a99c40eab86d05b78e43040d657844ee665ebb2aa55a9e920c  stellarium-0.20.0.tar.gz
+md5  12b87785efdc52c1682bb6f3c37bd85d  stellarium-0.20.2.tar.gz
+sha1  308fd0878d2126878d769d66cac1f00b3dccf819   stellarium-0.20.2.tar.gz
+sha256 400ef964c2a1612157a4b219464ea919b4e330322a0db894835b6e11c4af5e9b  stellarium-0.20.2.tar.gz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 72e762b65e..543e6fa23d 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 0.20.1
+STELLARIUM_VERSION = 0.20.2
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
