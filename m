From: Ryan Coe <bluemrp9@gmail.com>
Date: Fri,  3 Nov 2017 06:30:03 -0700
Subject: [Buildroot] [PATCH 2/3] libite: bump version to 1.9.2
In-Reply-To: <20171103133004.8083-1-bluemrp9@gmail.com>
References: <20171103133004.8083-1-bluemrp9@gmail.com>
Message-ID: <20171103133004.8083-2-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hashes for license files.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/libite/libite.hash | 5 ++++-
 package/libite/libite.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index 67ad009bf5..ec894c5e00 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,2 +1,5 @@
 # Locally calculated
-sha256 b27e4af69e9e5b4d00924538d3a41b53752082cc439b9246edec5501aff2f22f libite-v1.8.2.tar.gz
+sha256 18c087123f02cc3cfb612bf53b12dc8a94d4d3ebf015ed5937b1f9203eef72f8  libite-v1.9.2.tar.gz
+sha256 0e97ab27b60e20a7ddb8e9638189ad159124e51d2c12e12735b05423df224da5  LICENSE
+sha256 9e0fb98d251dddf5ba81a355f6b4d89835ec53bc5d7f5fcd2c866b54ec5ccec8  chomp.c
+sha256 a7d29c148e057fae11a87febc3a51970a26433c35a08fc710be689394442d32d  pidfile.c
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index 56b0d5c105..e88060d1dc 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBITE_VERSION = v1.8.2
+LIBITE_VERSION = v1.9.2
 LIBITE_SITE = $(call github,troglobit,libite,$(LIBITE_VERSION))
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
 LIBITE_LICENSE_FILES = LICENSE chomp.c pidfile.c
-- 
2.15.0
