From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Feb 2018 20:51:14 +0100
Subject: [Buildroot] [git commit branch/next] libite: bump version to 2.0.1
Message-ID: <20180219200453.3AE2082848@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd5762538680e9d0c15b80b5da4109a24630e6a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libite/libite.hash | 2 +-
 package/libite/libite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index ec894c5e00..437127d15c 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 18c087123f02cc3cfb612bf53b12dc8a94d4d3ebf015ed5937b1f9203eef72f8  libite-v1.9.2.tar.gz
+sha256 39a4c12af30a38a813fac7c8d7512efb3692f910eba9c697a50ce0203e039dad  libite-v2.0.1.tar.gz
 sha256 0e97ab27b60e20a7ddb8e9638189ad159124e51d2c12e12735b05423df224da5  LICENSE
 sha256 9e0fb98d251dddf5ba81a355f6b4d89835ec53bc5d7f5fcd2c866b54ec5ccec8  chomp.c
 sha256 a7d29c148e057fae11a87febc3a51970a26433c35a08fc710be689394442d32d  pidfile.c
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index e88060d1dc..02ea948ef2 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBITE_VERSION = v1.9.2
+LIBITE_VERSION = v2.0.1
 LIBITE_SITE = $(call github,troglobit,libite,$(LIBITE_VERSION))
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
 LIBITE_LICENSE_FILES = LICENSE chomp.c pidfile.c
