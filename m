From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 21:49:40 +0100
Subject: [Buildroot] [git commit] xz: bump version to 5.2.0
Message-ID: <20150106205009.04FED807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95806a5fe1ac0f43f4e20cc0ac7036029e8d94a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-Bump version to 5.2.0
-Update hash file
-Use xz tarball instead of bz2 to save space and bandwidth

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xz/xz.hash |    2 +-
 package/xz/xz.mk   |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 6169b83..f76b9ac 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	166c48d2842519bc4f96333bff9e265f8cdda44d38e40594ef3f9bbb52890490	xz-5.0.5.tar.bz2
+sha256  5962fe32e0b42c7065b4410b7d8ffbf2895e197e97d410c4fc374ea0d7610a14  xz-5.2.0.tar.xz
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index fbcd276..1b44678 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.0.5
-XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
+XZ_VERSION = 5.2.0
+XZ_SOURCE = xz-$(XZ_VERSION).tar.xz
 XZ_SITE = http://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
