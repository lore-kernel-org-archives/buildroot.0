From: Geoff Levand <geoff@infradead.org>
Date: Thu, 26 Jul 2018 22:21:25 +0000
Subject: [Buildroot] [PATCH v1 1/2] linux-firmware: bump version to latest
 8d69bab
In-Reply-To: <cover.1532642378.git.geoff@infradead.org>
References: <cover.1532642378.git.geoff@infradead.org>
Message-ID: <bd49c776c2a729a54eb4a82e532129b663d906b3.1532642378.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update from 65b1c68 (2018-01-04) to 8d69bab (2018-07-17).

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/linux-firmware/linux-firmware.hash | 2 +-
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 0106db2ffb..d0dfe93f2a 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 d253f7abb32e0407bcc840a5bddba1dc20190bb4a4bb6d40512f279fde384671 linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2.tar.gz
+sha256 905be20e4e2d7628dea4e2e99195520fc0cce8b247faabdc52fc44a3ff2ceb04 linux-firmware-8d69bab7a3da1913113ea98cefb73d5fa6988286.tar.gz
 sha256 8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9 LICENCE.Abilis
 sha256 448a367f518ff62c0501ded89c3da03cd3b632aa05bf62b4d5b969b136476d96 LICENSE.amdgpu
 sha256 38f2037aa14631b4b29826d7a99379613c41a97064d1defdee30a7a022138b20 LICENCE.Marvell
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 46ab9d5ffe..8e53cacba4 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 65b1c68c63f974d72610db38dfae49861117cae2
+LINUX_FIRMWARE_VERSION = 8d69bab7a3da1913113ea98cefb73d5fa6988286
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
-- 
2.14.1
