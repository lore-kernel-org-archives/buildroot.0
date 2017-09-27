From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Sep 2017 17:31:04 +0200
Subject: [Buildroot] [git commit] package/opencore-amr: bump version to 0.1.5
Message-ID: <20170927152352.2F3D18110E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=548af0870c991b3e91a58ef5401fd4554cd12768
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added md5 & sha1 hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencore-amr/opencore-amr.hash | 5 ++++-
 package/opencore-amr/opencore-amr.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/opencore-amr/opencore-amr.hash b/package/opencore-amr/opencore-amr.hash
index a984514..5d11286 100644
--- a/package/opencore-amr/opencore-amr.hash
+++ b/package/opencore-amr/opencore-amr.hash
@@ -1,2 +1,5 @@
+# From https://sourceforge.net/projects/opencore-amr/files/opencore-amr/
+md5 e0798587b91411cc092aa73091a97dfc  opencore-amr-0.1.5.tar.gz
+sha1 bef4d1e3a8a155b47569b6691a223843b33e279e  opencore-amr-0.1.5.tar.gz
 # Locally computed:
-sha256  106bf811c1f36444d7671d8fd2589f8b2e0cca58a2c764da62ffc4a070595385  opencore-amr-0.1.3.tar.gz
+sha256 2c006cb9d5f651bfb5e60156dbff6af3c9d35c7bbcc9015308c0aff1e14cd341  opencore-amr-0.1.5.tar.gz
diff --git a/package/opencore-amr/opencore-amr.mk b/package/opencore-amr/opencore-amr.mk
index 8b6aa29..115f97c 100644
--- a/package/opencore-amr/opencore-amr.mk
+++ b/package/opencore-amr/opencore-amr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCORE_AMR_VERSION = 0.1.3
+OPENCORE_AMR_VERSION = 0.1.5
 OPENCORE_AMR_SITE = http://downloads.sourceforge.net/project/opencore-amr/opencore-amr
 OPENCORE_AMR_INSTALL_STAGING = YES
 OPENCORE_AMR_LICENSE = Apache-2.0
