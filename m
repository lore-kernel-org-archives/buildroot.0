From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Jan 2015 12:06:21 +0100
Subject: [Buildroot] [git commit] libsepol: change to github location
Message-ID: <20150102110711.2E71180806@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a68bc8c6f8fb0f6944b16ae6b852da2d5321bdf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old location doesn't seem active any more. Even though this github URL
looks a bit odd, it is linked from
https://github.com/SELinuxProject/selinux/wiki/Releases

Also add a .hash file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsepol/libsepol.hash |    2 ++
 package/libsepol/libsepol.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
new file mode 100644
index 0000000..df5dabd
--- /dev/null
+++ b/package/libsepol/libsepol.hash
@@ -0,0 +1,2 @@
+# From https://github.com/SELinuxProject/selinux/wiki/Releases
+sha256	290d17f583635a4a5d8a2141511272adf0571c4205cdea38b5a68df20d58a70b  libsepol-2.1.9.tar.gz
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 356f137..1e709c6 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSEPOL_VERSION = 2.1.9
-LIBSEPOL_SITE = http://userspace.selinuxproject.org/releases/20130423
+LIBSEPOL_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
 LIBSEPOL_LICENSE = LGPLv2.1+
 LIBSEPOL_LICENSE_FILES = COPYING
 
