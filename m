From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2010 19:43:05 +0100
Subject: [Buildroot] [PATCH 14/16] merge with libpng for host
In-Reply-To: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <42b9bcb08222caeae4bb474848f13f922705f40e.1266691382.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpng/libpng.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 1b50707..0303d51 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -11,6 +11,7 @@ LIBPNG_INSTALL_STAGING = YES
 LIBPNG_CONF_OPT = --without-libpng-compat
 LIBPNG_DEPENDENCIES = host-pkg-config zlib
 
+HOST_LIBPNG_LIBTOOL_PATCH = NO
 HOST_LIBPNG_CONF_OPT = --without-libpng-compat
 HOST_LIBPNG_DEPENDENCIES = host-zlib
 
-- 
1.6.3.3
