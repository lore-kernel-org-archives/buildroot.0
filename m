From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 22:11:05 +0100
Subject: [Buildroot] [git commit] automake: bump version to 1.15
Message-ID: <20150107211111.0E363807B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8431bb59c81e4d8b2c0481d6c861f364d0d40aa9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-Bump version to 1.15
-Add a hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/automake/automake.hash |    2 ++
 package/automake/automake.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/automake/automake.hash b/package/automake/automake.hash
new file mode 100644
index 0000000..83aca90
--- /dev/null
+++ b/package/automake/automake.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  9908c75aabd49d13661d6dcb1bc382252d22cc77bf733a2d55e87f2aa2db8636  automake-1.15.tar.xz
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 17bc799..a3fd18c 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOMAKE_VERSION = 1.14.1
+AUTOMAKE_VERSION = 1.15
 AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 AUTOMAKE_LICENSE = GPLv2+
