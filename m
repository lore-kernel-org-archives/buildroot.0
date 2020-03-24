From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 21:28:50 +0100
Subject: [Buildroot] [git commit] package/{openjdk,
 openjdk-bin}: bump version to 14+36
Message-ID: <20200324202307.CABF2880D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8082a8082f6408b1fd504efe24b671a671abcf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openjdk-bin/openjdk-bin.hash | 2 +-
 package/openjdk-bin/openjdk-bin.mk   | 8 ++++----
 package/openjdk/openjdk.hash         | 2 +-
 package/openjdk/openjdk.mk           | 6 +++---
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index 3e4df59236..98e039c17e 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,5 +1,5 @@
 # From https://github.com/AdoptOpenJDK/openjdk12-binaries/releases
-sha256  9ccc063569f19899fd08e41466f8c4cd4e05058abdb5178fa374cb365dcf5998	OpenJDK13U-jdk_x64_linux_hotspot_13.0.2_8.tar.gz
+sha256  6c06853332585ab58834d9e8a02774b388e6e062ef6c4084b4f058c67f2e81b5	OpenJDK14U-jdk_x64_linux_hotspot_14_36.tar.gz
 
 # Locally calculated
 sha256	4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726	legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index e780a797e6..31dc4a4666 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-HOST_OPENJDK_BIN_VERSION_MAJOR = 13.0.2
-HOST_OPENJDK_BIN_VERSION_MINOR = 8
+HOST_OPENJDK_BIN_VERSION_MAJOR = 14
+HOST_OPENJDK_BIN_VERSION_MINOR = 36
 HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
-HOST_OPENJDK_BIN_SOURCE = OpenJDK13U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
-HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk13-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
+HOST_OPENJDK_BIN_SOURCE = OpenJDK14U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
+HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
 HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
 HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
 
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index ca282591ef..d5be642052 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d38fb17795782dffe84e98f21f1d6293b0a45ea8f1e9c81e99cd71acac03a4e0  jdk-13.0.2+8.tar.gz
+sha256 6815dbac7dd0f86291254e84ed17565c89477eeb6b0847a9648b00ecb4f07634  jdk-14+36.tar.gz
 sha256 4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 030a205228..edc86c6fbe 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-OPENJDK_VERSION_MAJOR = 13.0.2
-OPENJDK_VERSION_MINOR = 8
+OPENJDK_VERSION_MAJOR = 14
+OPENJDK_VERSION_MINOR = 36
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
 OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
-OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk13u/archive
+OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk14u/archive
 OPENJDK_LICENSE = GPL-2.0+ with exception
 OPENJDK_LICENSE_FILES = LICENSE
 
