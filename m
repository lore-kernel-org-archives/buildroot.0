From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 22:50:09 +0100
Subject: [Buildroot] [git commit] package/libite: bump version to 2.0.2
Message-ID: <20190123215314.0332D813FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbb114a64f9604ae409381b30ba6d2d48fb5cdf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libite/libite.hash | 2 +-
 package/libite/libite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index 7ef9dca57a..aac01fd36d 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 39a4c12af30a38a813fac7c8d7512efb3692f910eba9c697a50ce0203e039dad  libite-v2.0.1.tar.gz
+sha256 bd5d08066f3e53cc8967beb6f0620286aad7a24d49fb730caa1c6d09a26bb705  libite-v2.0.2.tar.gz
 sha256 0e97ab27b60e20a7ddb8e9638189ad159124e51d2c12e12735b05423df224da5  LICENSE
 sha256 9e0fb98d251dddf5ba81a355f6b4d89835ec53bc5d7f5fcd2c866b54ec5ccec8  src/chomp.c
 sha256 a7d29c148e057fae11a87febc3a51970a26433c35a08fc710be689394442d32d  src/pidfile.c
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index a128953c7a..bcda5f3f0c 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBITE_VERSION = v2.0.1
+LIBITE_VERSION = v2.0.2
 LIBITE_SITE = $(call github,troglobit,libite,$(LIBITE_VERSION))
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
 LIBITE_LICENSE_FILES = LICENSE src/chomp.c src/pidfile.c
