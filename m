From: Ryan Coe <bluemrp9@gmail.com>
Date: Wed, 23 Jan 2019 07:09:11 -0800
Subject: [Buildroot] [PATCH 2/2] package/inadyn: bump version to 2.5
In-Reply-To: <20190123150911.3321-1-bluemrp9@gmail.com>
References: <20190123150911.3321-1-bluemrp9@gmail.com>
Message-ID: <20190123150911.3321-2-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/inadyn/inadyn.hash | 6 +++---
 package/inadyn/inadyn.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index 742b6f226f..2691ba0ef9 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,5 +1,5 @@
-# From https://github.com/troglobit/inadyn/releases/download/v2.3/inadyn-2.3.tar.xz.md5
-md5 63efb284b7f3f389c01bad19ee28407e  inadyn-2.3.tar.xz
+# From https://github.com/troglobit/inadyn/releases/download/v2.5/inadyn-2.5.tar.xz.md5
+md5 8a864d5186e54d24de2d7554fc01b3ec  inadyn-2.5.tar.xz
 # Locally computed
-sha256 4a98b80d8565b9e4cb32b19b7a8b06a22a7d9a6f4f03a5298a8d441b6187c760  inadyn-2.3.tar.xz
+sha256 4a9ad208671f62912428413da0282450b2d2c4da38f3c95c4ac975d048c41fcd  inadyn-2.5.tar.xz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 0b1f82dae8..96a37d4768 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.3
+INADYN_VERSION = 2.5
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
 INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.xz
 INADYN_LICENSE = GPL-2.0+
-- 
2.20.1
