From: Jan Kiszka <jan.kiszka@siemens.com>
Date: Thu, 19 Dec 2019 09:24:32 +0100
Subject: [Buildroot] [PATCH v2 2/4] package/xenomai: bump version to 3.0.10
In-Reply-To: <cover.1576743874.git.jan.kiszka@siemens.com>
References: <cover.1576743874.git.jan.kiszka@siemens.com>
Message-ID: <4b4861bffe5eb977a77bea44ae37eab499615f17.1576743874.git.jan.kiszka@siemens.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Kiszka <jan.kiszka@siemens.com>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 package/xenomai/xenomai.hash | 2 +-
 package/xenomai/xenomai.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xenomai/xenomai.hash b/package/xenomai/xenomai.hash
index 0fc560f978..7da3d0d4a1 100644
--- a/package/xenomai/xenomai.hash
+++ b/package/xenomai/xenomai.hash
@@ -1,2 +1,2 @@
 # Locally computed;
-sha256 9e4b879ee48e6423f76cba5882f41d129164fe977119080ff41ef531ee50dc4e  xenomai-3.0.9.tar.bz2
+sha256 080f893d6ab8e3065285fbb482695477a0502b9490dccd1f744cebaac94691e5  xenomai-3.0.10.tar.bz2
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index f25adf747b..3813af707d 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -6,7 +6,7 @@
 
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
 ifeq ($(XENOMAI_VERSION),)
-XENOMAI_VERSION = 3.0.9
+XENOMAI_VERSION = 3.0.10
 else
 BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
 endif
-- 
2.16.4
