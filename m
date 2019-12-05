From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  5 Dec 2019 12:06:37 -0800
Subject: [Buildroot] [PATCH 2/2] package/mender: bump to version 2.1.2
In-Reply-To: <20191205200637.1404431-1-aduskett@gmail.com>
References: <20191205200637.1404431-1-aduskett@gmail.com>
Message-ID: <20191205200637.1404431-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/mender/mender.hash | 2 +-
 package/mender/mender.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index 780ef25d1e..6d0a64da95 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 bf5b35c18fa33707b28caa9352fe3cbb663f616d639600bf1c2bf3efe4ac21f2 2.1.1.tar.gz
+sha256 eb288eaee8be4d58edeef7c8d1c3caa8fea94740a2002520ed43bc717c01dca6 2.1.2.tar.gz
 
 # Apache-2.0 license, locally computed
 sha256 beb140be4cd64599bedc691a55b2729c9cc611a4b9d6ec44e01270105daf18a2 LICENSE
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index e085d542c9..fded7fa943 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_VERSION = 2.1.1
+MENDER_VERSION = 2.1.2
 MENDER_SITE = https://github.com/mendersoftware/mender/archive
 MENDER_SOURCE = $(MENDER_VERSION).tar.gz
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
-- 
2.23.0
