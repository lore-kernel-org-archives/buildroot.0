From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 00:55:16 +0100
Subject: [Buildroot] [git commit] which: bump to version 2.21
Message-ID: <20150324235518.250A58180C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00516418a4b1e25941001dd42f37c0f0ce1d9d9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash file and switch to gnu mirror.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/which/which.hash |    2 ++
 package/which/which.mk   |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/which/which.hash b/package/which/which.hash
new file mode 100644
index 0000000..fe649ab
--- /dev/null
+++ b/package/which/which.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	f4a245b94124b377d8b49646bf421f9155d36aa7614b6ebf83705d3ffc76eaad	which-2.21.tar.gz
diff --git a/package/which/which.mk b/package/which/which.mk
index 019c479..938b770 100644
--- a/package/which/which.mk
+++ b/package/which/which.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHICH_VERSION = 2.20
-WHICH_SITE = http://carlo17.home.xs4all.nl/which
+WHICH_VERSION = 2.21
+WHICH_SITE = $(BR2_GNU_MIRROR)/which
 WHICH_LICENSE = GPLv3+
 WHICH_LICENSE_FILES = COPYING
 
