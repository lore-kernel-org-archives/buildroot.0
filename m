From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 21:35:55 +0100
Subject: [Buildroot] [git commit] libsodium: bump to version 1.0.15
Message-ID: <20171206202917.32EB9825E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20b0535ea4fbd2560d8a9b98c1abd8f3955ab2cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adrien Gallou??t <adrien@gallouet.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsodium/libsodium.hash | 3 ++-
 package/libsodium/libsodium.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libsodium/libsodium.hash b/package/libsodium/libsodium.hash
index 725281e..12f332d 100644
--- a/package/libsodium/libsodium.hash
+++ b/package/libsodium/libsodium.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 9c13accb1a9e59ab3affde0e60ef9a2149ed4d6e8f99c93c7a5b97499ee323fd  libsodium-1.0.13.tar.gz
+sha256 fb6a9e879a2f674592e4328c5d9f79f082405ee4bb05cb6e679b90afe9e178f4  libsodium-1.0.15.tar.gz
+sha256 6faf327c97dca6da69acefc6d3969d7bffb70a24f0707874870fdcfd6b0acf58  LICENSE
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index b1d8a26..b45f013 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSODIUM_VERSION = 1.0.13
-LIBSODIUM_SITE = https://download.libsodium.org/libsodium/releases
+LIBSODIUM_VERSION = 1.0.15
+LIBSODIUM_SITE = https://github.com/jedisct1/libsodium/releases/download/$(LIBSODIUM_VERSION)
 LIBSODIUM_LICENSE = ISC
 LIBSODIUM_LICENSE_FILES = LICENSE
 LIBSODIUM_INSTALL_STAGING = YES
