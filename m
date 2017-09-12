From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Sep 2017 23:33:30 +0200
Subject: [Buildroot] [git commit] package/libsodium: bump version to 1.0.13
Message-ID: <20170912212658.B199480F8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac5cb4106fad69939bdb516544c4ee9946aa5cd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsodium/libsodium.hash | 2 +-
 package/libsodium/libsodium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsodium/libsodium.hash b/package/libsodium/libsodium.hash
index 9fdbc17..725281e 100644
--- a/package/libsodium/libsodium.hash
+++ b/package/libsodium/libsodium.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 b8648f1bb3a54b0251cf4ffa4f0d76ded13977d4fa7517d988f4c902dd8e2f95  libsodium-1.0.12.tar.gz
+sha256 9c13accb1a9e59ab3affde0e60ef9a2149ed4d6e8f99c93c7a5b97499ee323fd  libsodium-1.0.13.tar.gz
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index b951c53..b1d8a26 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSODIUM_VERSION = 1.0.12
+LIBSODIUM_VERSION = 1.0.13
 LIBSODIUM_SITE = https://download.libsodium.org/libsodium/releases
 LIBSODIUM_LICENSE = ISC
 LIBSODIUM_LICENSE_FILES = LICENSE
