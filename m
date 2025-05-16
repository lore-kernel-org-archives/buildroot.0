Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91FBC3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AADC847B5;
	Mon, 19 May 2025 11:00:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXHrDwV6vEHd; Mon, 19 May 2025 11:00:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69C33847A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69C33847A1;
	Mon, 19 May 2025 11:00:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E1FE193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F80540EC3
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBeJJ10MS3HW for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C77C3410DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C77C3410DF
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C493782A2E; Mon, 19 May 2025 10:40:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 12:49:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2f13e813c013560a4cc0de76db827774c7a34172
X-Git-Newrev: e9911873aa2a94af29d62b05d091a52d70ebba85
X-Patchwork-Hint: ignore
Message-Id: <20250519104003.C493782A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/freescale_imx*: bump
 BSP components to lf-6.12.3-1.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e9911873aa2a94af29d62b05d091a52d70ebba85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit U-Boot, Linux kernel and ATF (when applicable) to the
NXP BSP lf-6.12.3-1.0.0 versions.

Custom hashes are also updated accordingly.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/freescale/imx6sabre/patches/linux/linux.hash                | 2 +-
 board/freescale/imx6sabre/patches/uboot/uboot.hash                | 2 +-
 board/freescale/imx6ullevk/patches/linux/linux.hash               | 2 +-
 board/freescale/imx6ullevk/patches/uboot/uboot.hash               | 2 +-
 board/freescale/imx7dsdb/patches/linux/linux.hash                 | 2 +-
 board/freescale/imx7dsdb/patches/uboot/uboot.hash                 | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash        | 2 +-
 board/freescale/imx8dxlevk/patches/linux/linux.hash               | 2 +-
 board/freescale/imx8dxlevk/patches/uboot/uboot.hash               | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash        | 2 +-
 board/freescale/imx8mmevk/patches/linux/linux.hash                | 2 +-
 board/freescale/imx8mmevk/patches/uboot/uboot.hash                | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash        | 2 +-
 board/freescale/imx8mnevk/patches/linux/linux.hash                | 2 +-
 board/freescale/imx8mnevk/patches/uboot/uboot.hash                | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash        | 2 +-
 board/freescale/imx8mpevk/patches/linux/linux.hash                | 2 +-
 board/freescale/imx8mpevk/patches/uboot/uboot.hash                | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash        | 2 +-
 board/freescale/imx8mqevk/patches/linux/linux.hash                | 2 +-
 board/freescale/imx8mqevk/patches/uboot/uboot.hash                | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash        | 2 +-
 board/freescale/imx8qmmek/patches/linux/linux.hash                | 2 +-
 board/freescale/imx8qmmek/patches/uboot/uboot.hash                | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash        | 2 +-
 board/freescale/imx8qxpmek/patches/linux/linux.hash               | 2 +-
 board/freescale/imx8qxpmek/patches/uboot/uboot.hash               | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash        | 2 +-
 board/freescale/imx93evk/patches/linux/linux.hash                 | 2 +-
 board/freescale/imx93evk/patches/uboot/uboot.hash                 | 2 +-
 configs/freescale_imx6dlsabreauto_defconfig                       | 6 +++---
 configs/freescale_imx6dlsabresd_defconfig                         | 6 +++---
 configs/freescale_imx6qsabreauto_defconfig                        | 6 +++---
 configs/freescale_imx6qsabresd_defconfig                          | 6 +++---
 configs/freescale_imx6sxsabresd_defconfig                         | 6 +++---
 configs/freescale_imx6ullevk_defconfig                            | 6 +++---
 configs/freescale_imx7dsabresd_defconfig                          | 6 +++---
 configs/freescale_imx8dxlevk_defconfig                            | 8 ++++----
 configs/freescale_imx8mmevk_defconfig                             | 8 ++++----
 configs/freescale_imx8mnevk_defconfig                             | 8 ++++----
 configs/freescale_imx8mpevk_defconfig                             | 8 ++++----
 configs/freescale_imx8mqevk_defconfig                             | 8 ++++----
 configs/freescale_imx8qmmek_defconfig                             | 8 ++++----
 configs/freescale_imx8qxpmek_defconfig                            | 8 ++++----
 configs/freescale_imx93evk_defconfig                              | 8 ++++----
 45 files changed, 83 insertions(+), 83 deletions(-)

diff --git a/board/freescale/imx6sabre/patches/linux/linux.hash b/board/freescale/imx6sabre/patches/linux/linux.hash
index 620a7377ef..b4f534dcc8 100644
--- a/board/freescale/imx6sabre/patches/linux/linux.hash
+++ b/board/freescale/imx6sabre/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  4c1147a9bbe4bf36fbcbd8b1e6b0d73ec0da3c454821c58a61d32d3879afc146  linux-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx6sabre/patches/uboot/uboot.hash b/board/freescale/imx6sabre/patches/uboot/uboot.hash
index 4b763ba3ba..309a684c2d 100644
--- a/board/freescale/imx6sabre/patches/uboot/uboot.hash
+++ b/board/freescale/imx6sabre/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  18a32d6c79538e4f90746674873b196f9c48be24caef0ab5c1bec920a1816825  uboot-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx6ullevk/patches/linux/linux.hash b/board/freescale/imx6ullevk/patches/linux/linux.hash
index 620a7377ef..b4f534dcc8 100644
--- a/board/freescale/imx6ullevk/patches/linux/linux.hash
+++ b/board/freescale/imx6ullevk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  4c1147a9bbe4bf36fbcbd8b1e6b0d73ec0da3c454821c58a61d32d3879afc146  linux-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx6ullevk/patches/uboot/uboot.hash b/board/freescale/imx6ullevk/patches/uboot/uboot.hash
index 4b763ba3ba..309a684c2d 100644
--- a/board/freescale/imx6ullevk/patches/uboot/uboot.hash
+++ b/board/freescale/imx6ullevk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  18a32d6c79538e4f90746674873b196f9c48be24caef0ab5c1bec920a1816825  uboot-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx7dsdb/patches/linux/linux.hash b/board/freescale/imx7dsdb/patches/linux/linux.hash
index 620a7377ef..b4f534dcc8 100644
--- a/board/freescale/imx7dsdb/patches/linux/linux.hash
+++ b/board/freescale/imx7dsdb/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  4c1147a9bbe4bf36fbcbd8b1e6b0d73ec0da3c454821c58a61d32d3879afc146  linux-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx7dsdb/patches/uboot/uboot.hash b/board/freescale/imx7dsdb/patches/uboot/uboot.hash
index 4b763ba3ba..309a684c2d 100644
--- a/board/freescale/imx7dsdb/patches/uboot/uboot.hash
+++ b/board/freescale/imx7dsdb/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  18a32d6c79538e4f90746674873b196f9c48be24caef0ab5c1bec920a1816825  uboot-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8dxlevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8dxlevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 58100572e4..da0200d9ac 100644
--- a/board/freescale/imx8dxlevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx8dxlevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2b5b4a370a55b790ca318e95e2c1aac9d9166ea549179ef9929c346863b4ea57  imx-atf-lf-6.6.52-2.2.0.tar.gz
+sha256  a696ee1c75140cd5ddb9d4349c921952f80e2a8a21bc6bd92f905959a6b1798f  imx-atf-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8dxlevk/patches/linux/linux.hash b/board/freescale/imx8dxlevk/patches/linux/linux.hash
index 620a7377ef..b4f534dcc8 100644
--- a/board/freescale/imx8dxlevk/patches/linux/linux.hash
+++ b/board/freescale/imx8dxlevk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  4c1147a9bbe4bf36fbcbd8b1e6b0d73ec0da3c454821c58a61d32d3879afc146  linux-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8dxlevk/patches/uboot/uboot.hash b/board/freescale/imx8dxlevk/patches/uboot/uboot.hash
index 4b763ba3ba..309a684c2d 100644
--- a/board/freescale/imx8dxlevk/patches/uboot/uboot.hash
+++ b/board/freescale/imx8dxlevk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  18a32d6c79538e4f90746674873b196f9c48be24caef0ab5c1bec920a1816825  uboot-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8mmevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8mmevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 58100572e4..da0200d9ac 100644
--- a/board/freescale/imx8mmevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx8mmevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2b5b4a370a55b790ca318e95e2c1aac9d9166ea549179ef9929c346863b4ea57  imx-atf-lf-6.6.52-2.2.0.tar.gz
+sha256  a696ee1c75140cd5ddb9d4349c921952f80e2a8a21bc6bd92f905959a6b1798f  imx-atf-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8mmevk/patches/linux/linux.hash b/board/freescale/imx8mmevk/patches/linux/linux.hash
index 620a7377ef..b4f534dcc8 100644
--- a/board/freescale/imx8mmevk/patches/linux/linux.hash
+++ b/board/freescale/imx8mmevk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  4c1147a9bbe4bf36fbcbd8b1e6b0d73ec0da3c454821c58a61d32d3879afc146  linux-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8mmevk/patches/uboot/uboot.hash b/board/freescale/imx8mmevk/patches/uboot/uboot.hash
index 4b763ba3ba..309a684c2d 100644
--- a/board/freescale/imx8mmevk/patches/uboot/uboot.hash
+++ b/board/freescale/imx8mmevk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  18a32d6c79538e4f90746674873b196f9c48be24caef0ab5c1bec920a1816825  uboot-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8mnevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8mnevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 58100572e4..da0200d9ac 100644
--- a/board/freescale/imx8mnevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx8mnevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2b5b4a370a55b790ca318e95e2c1aac9d9166ea549179ef9929c346863b4ea57  imx-atf-lf-6.6.52-2.2.0.tar.gz
+sha256  a696ee1c75140cd5ddb9d4349c921952f80e2a8a21bc6bd92f905959a6b1798f  imx-atf-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8mnevk/patches/linux/linux.hash b/board/freescale/imx8mnevk/patches/linux/linux.hash
index 620a7377ef..b4f534dcc8 100644
--- a/board/freescale/imx8mnevk/patches/linux/linux.hash
+++ b/board/freescale/imx8mnevk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  4c1147a9bbe4bf36fbcbd8b1e6b0d73ec0da3c454821c58a61d32d3879afc146  linux-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8mnevk/patches/uboot/uboot.hash b/board/freescale/imx8mnevk/patches/uboot/uboot.hash
index 4b763ba3ba..309a684c2d 100644
--- a/board/freescale/imx8mnevk/patches/uboot/uboot.hash
+++ b/board/freescale/imx8mnevk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  18a32d6c79538e4f90746674873b196f9c48be24caef0ab5c1bec920a1816825  uboot-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8mpevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8mpevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 58100572e4..da0200d9ac 100644
--- a/board/freescale/imx8mpevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx8mpevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2b5b4a370a55b790ca318e95e2c1aac9d9166ea549179ef9929c346863b4ea57  imx-atf-lf-6.6.52-2.2.0.tar.gz
+sha256  a696ee1c75140cd5ddb9d4349c921952f80e2a8a21bc6bd92f905959a6b1798f  imx-atf-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8mpevk/patches/linux/linux.hash b/board/freescale/imx8mpevk/patches/linux/linux.hash
index 620a7377ef..b4f534dcc8 100644
--- a/board/freescale/imx8mpevk/patches/linux/linux.hash
+++ b/board/freescale/imx8mpevk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  4c1147a9bbe4bf36fbcbd8b1e6b0d73ec0da3c454821c58a61d32d3879afc146  linux-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8mpevk/patches/uboot/uboot.hash b/board/freescale/imx8mpevk/patches/uboot/uboot.hash
index 4b763ba3ba..309a684c2d 100644
--- a/board/freescale/imx8mpevk/patches/uboot/uboot.hash
+++ b/board/freescale/imx8mpevk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  18a32d6c79538e4f90746674873b196f9c48be24caef0ab5c1bec920a1816825  uboot-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8mqevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8mqevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 58100572e4..da0200d9ac 100644
--- a/board/freescale/imx8mqevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx8mqevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2b5b4a370a55b790ca318e95e2c1aac9d9166ea549179ef9929c346863b4ea57  imx-atf-lf-6.6.52-2.2.0.tar.gz
+sha256  a696ee1c75140cd5ddb9d4349c921952f80e2a8a21bc6bd92f905959a6b1798f  imx-atf-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8mqevk/patches/linux/linux.hash b/board/freescale/imx8mqevk/patches/linux/linux.hash
index 620a7377ef..b4f534dcc8 100644
--- a/board/freescale/imx8mqevk/patches/linux/linux.hash
+++ b/board/freescale/imx8mqevk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  4c1147a9bbe4bf36fbcbd8b1e6b0d73ec0da3c454821c58a61d32d3879afc146  linux-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8mqevk/patches/uboot/uboot.hash b/board/freescale/imx8mqevk/patches/uboot/uboot.hash
index 4b763ba3ba..309a684c2d 100644
--- a/board/freescale/imx8mqevk/patches/uboot/uboot.hash
+++ b/board/freescale/imx8mqevk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  18a32d6c79538e4f90746674873b196f9c48be24caef0ab5c1bec920a1816825  uboot-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8qmmek/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8qmmek/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 58100572e4..da0200d9ac 100644
--- a/board/freescale/imx8qmmek/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx8qmmek/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2b5b4a370a55b790ca318e95e2c1aac9d9166ea549179ef9929c346863b4ea57  imx-atf-lf-6.6.52-2.2.0.tar.gz
+sha256  a696ee1c75140cd5ddb9d4349c921952f80e2a8a21bc6bd92f905959a6b1798f  imx-atf-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8qmmek/patches/linux/linux.hash b/board/freescale/imx8qmmek/patches/linux/linux.hash
index 620a7377ef..b4f534dcc8 100644
--- a/board/freescale/imx8qmmek/patches/linux/linux.hash
+++ b/board/freescale/imx8qmmek/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  4c1147a9bbe4bf36fbcbd8b1e6b0d73ec0da3c454821c58a61d32d3879afc146  linux-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8qmmek/patches/uboot/uboot.hash b/board/freescale/imx8qmmek/patches/uboot/uboot.hash
index 4b763ba3ba..309a684c2d 100644
--- a/board/freescale/imx8qmmek/patches/uboot/uboot.hash
+++ b/board/freescale/imx8qmmek/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  18a32d6c79538e4f90746674873b196f9c48be24caef0ab5c1bec920a1816825  uboot-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8qxpmek/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8qxpmek/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 58100572e4..da0200d9ac 100644
--- a/board/freescale/imx8qxpmek/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx8qxpmek/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2b5b4a370a55b790ca318e95e2c1aac9d9166ea549179ef9929c346863b4ea57  imx-atf-lf-6.6.52-2.2.0.tar.gz
+sha256  a696ee1c75140cd5ddb9d4349c921952f80e2a8a21bc6bd92f905959a6b1798f  imx-atf-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8qxpmek/patches/linux/linux.hash b/board/freescale/imx8qxpmek/patches/linux/linux.hash
index 620a7377ef..b4f534dcc8 100644
--- a/board/freescale/imx8qxpmek/patches/linux/linux.hash
+++ b/board/freescale/imx8qxpmek/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  4c1147a9bbe4bf36fbcbd8b1e6b0d73ec0da3c454821c58a61d32d3879afc146  linux-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx8qxpmek/patches/uboot/uboot.hash b/board/freescale/imx8qxpmek/patches/uboot/uboot.hash
index 4b763ba3ba..309a684c2d 100644
--- a/board/freescale/imx8qxpmek/patches/uboot/uboot.hash
+++ b/board/freescale/imx8qxpmek/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  18a32d6c79538e4f90746674873b196f9c48be24caef0ab5c1bec920a1816825  uboot-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx93evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx93evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 58100572e4..da0200d9ac 100644
--- a/board/freescale/imx93evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx93evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2b5b4a370a55b790ca318e95e2c1aac9d9166ea549179ef9929c346863b4ea57  imx-atf-lf-6.6.52-2.2.0.tar.gz
+sha256  a696ee1c75140cd5ddb9d4349c921952f80e2a8a21bc6bd92f905959a6b1798f  imx-atf-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx93evk/patches/linux/linux.hash b/board/freescale/imx93evk/patches/linux/linux.hash
index 620a7377ef..b4f534dcc8 100644
--- a/board/freescale/imx93evk/patches/linux/linux.hash
+++ b/board/freescale/imx93evk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  6567dd20dbcdff19da1d005acde949b20874cace5e34bf2b8e90d14fcd130174  linux-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  4c1147a9bbe4bf36fbcbd8b1e6b0d73ec0da3c454821c58a61d32d3879afc146  linux-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx93evk/patches/uboot/uboot.hash b/board/freescale/imx93evk/patches/uboot/uboot.hash
index 4b763ba3ba..309a684c2d 100644
--- a/board/freescale/imx93evk/patches/uboot/uboot.hash
+++ b/board/freescale/imx93evk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5acad057c9c5e802536abf84b9fcb4405b8f701e13da1294e0d90bc6c186639d  uboot-imx-lf-6.6.52-2.2.0.tar.gz
+sha256  18a32d6c79538e4f90746674873b196f9c48be24caef0ab5c1bec920a1816825  uboot-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
index bf0a7786bb..ad2f41d704 100644
--- a/configs/freescale_imx6dlsabreauto_defconfig
+++ b/configs/freescale_imx6dlsabreauto_defconfig
@@ -3,14 +3,14 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.3-1.0.0)/linux-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6dl-sabreauto"
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabreauto"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.3-1.0.0)/uboot-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index 0809a5e11b..c4064f34ca 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -3,14 +3,14 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.3-1.0.0)/linux-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6dl-sabresd"
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabresd"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.3-1.0.0)/uboot-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
index 3fee47af20..ce51ad30b3 100644
--- a/configs/freescale_imx6qsabreauto_defconfig
+++ b/configs/freescale_imx6qsabreauto_defconfig
@@ -3,14 +3,14 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.3-1.0.0)/linux-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-sabreauto"
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6qsabreauto"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.3-1.0.0)/uboot-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index 1a56c0732f..ef308e7053 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -3,14 +3,14 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.3-1.0.0)/linux-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-sabresd"
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.3-1.0.0)/uboot-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
diff --git a/configs/freescale_imx6sxsabresd_defconfig b/configs/freescale_imx6sxsabresd_defconfig
index df6a34c6ff..8f3d8e9405 100644
--- a/configs/freescale_imx6sxsabresd_defconfig
+++ b/configs/freescale_imx6sxsabresd_defconfig
@@ -3,14 +3,14 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.3-1.0.0)/linux-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6sx-sdb"
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sxsabresd"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.3-1.0.0)/uboot-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
diff --git a/configs/freescale_imx6ullevk_defconfig b/configs/freescale_imx6ullevk_defconfig
index 6474228c64..3d9e0869ac 100644
--- a/configs/freescale_imx6ullevk_defconfig
+++ b/configs/freescale_imx6ullevk_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6ullevk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
@@ -8,7 +8,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.3-1.0.0)/linux-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx6ullevk/linux_sdma.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -22,7 +22,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.3-1.0.0)/uboot-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
diff --git a/configs/freescale_imx7dsabresd_defconfig b/configs/freescale_imx7dsabresd_defconfig
index 83a3f4494a..0487984a97 100644
--- a/configs/freescale_imx7dsabresd_defconfig
+++ b/configs/freescale_imx7dsabresd_defconfig
@@ -1,13 +1,13 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx7dsdb/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.3-1.0.0)/linux-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx7d-sdb"
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx7dsabresd"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.3-1.0.0)/uboot-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMX=y
diff --git a/configs/freescale_imx8dxlevk_defconfig b/configs/freescale_imx8dxlevk_defconfig
index c3017074c9..5ec0860a52 100644
--- a/configs/freescale_imx8dxlevk_defconfig
+++ b/configs/freescale_imx8dxlevk_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_cortex_a35=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx8dxlevk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8dxl-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.3-1.0.0)/linux-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8dxl-evk"
@@ -24,13 +24,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.52-2.2.0)/imx-atf-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.12.3-1.0.0)/imx-atf-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8dxl"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.3-1.0.0)/uboot-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8dxl_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/freescale_imx8mmevk_defconfig b/configs/freescale_imx8mmevk_defconfig
index 3807b8ada7..f37c9ca935 100644
--- a/configs/freescale_imx8mmevk_defconfig
+++ b/configs/freescale_imx8mmevk_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx8mmevk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mm-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.3-1.0.0)/linux-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-evk freescale/imx8mm-evk-revb-qca-wifi"
@@ -21,13 +21,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.52-2.2.0)/imx-atf-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.12.3-1.0.0)/imx-atf-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.3-1.0.0)/uboot-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/freescale_imx8mnevk_defconfig b/configs/freescale_imx8mnevk_defconfig
index 83a4357b59..057f2eff87 100644
--- a/configs/freescale_imx8mnevk_defconfig
+++ b/configs/freescale_imx8mnevk_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx8mnevk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mn-ddr4-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.3-1.0.0)/linux-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mn-ddr4-evk"
@@ -22,13 +22,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.52-2.2.0)/imx-atf-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.12.3-1.0.0)/imx-atf-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.3-1.0.0)/uboot-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_ddr4_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/freescale_imx8mpevk_defconfig b/configs/freescale_imx8mpevk_defconfig
index 894b5a2faf..9a5759ca04 100644
--- a/configs/freescale_imx8mpevk_defconfig
+++ b/configs/freescale_imx8mpevk_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx8mpevk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mp-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.3-1.0.0)/linux-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-evk"
@@ -21,13 +21,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.52-2.2.0)/imx-atf-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.12.3-1.0.0)/imx-atf-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.3-1.0.0)/uboot-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mp_evk"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imx8mpevk/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx8mqevk_defconfig b/configs/freescale_imx8mqevk_defconfig
index ddba356650..7a7d8f7e86 100644
--- a/configs/freescale_imx8mqevk_defconfig
+++ b/configs/freescale_imx8mqevk_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx8mqevk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mq-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.3-1.0.0)/linux-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-evk"
@@ -21,13 +21,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.52-2.2.0)/imx-atf-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.12.3-1.0.0)/imx-atf-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.3-1.0.0)/uboot-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mq_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/freescale_imx8qmmek_defconfig b/configs/freescale_imx8qmmek_defconfig
index 5b9c07b1f6..6740d3915f 100644
--- a/configs/freescale_imx8qmmek_defconfig
+++ b/configs/freescale_imx8qmmek_defconfig
@@ -1,13 +1,13 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx8qmmek/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8qm-mek.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.3-1.0.0)/linux-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8qm-mek"
@@ -22,13 +22,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.52-2.2.0)/imx-atf-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.12.3-1.0.0)/imx-atf-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8qm"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.3-1.0.0)/uboot-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8qm_mek"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/freescale_imx8qxpmek_defconfig b/configs/freescale_imx8qxpmek_defconfig
index 9dbc4be81b..ef5bef7dc6 100644
--- a/configs/freescale_imx8qxpmek_defconfig
+++ b/configs/freescale_imx8qxpmek_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_cortex_a35=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx8qxpmek/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8qxp-mek.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.3-1.0.0)/linux-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8qxp-mek"
@@ -24,13 +24,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.52-2.2.0)/imx-atf-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.12.3-1.0.0)/imx-atf-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8qx"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.3-1.0.0)/uboot-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8qxp_mek"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/freescale_imx93evk_defconfig b/configs/freescale_imx93evk_defconfig
index 1472914270..1140747825 100644
--- a/configs/freescale_imx93evk_defconfig
+++ b/configs/freescale_imx93evk_defconfig
@@ -1,14 +1,14 @@
 BR2_aarch64=y
 BR2_cortex_a55=y
 BR2_ARM_FPU_VFPV4D16=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx93evk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx9-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.52-2.2.0)/linux-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.3-1.0.0)/linux-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx93-11x11-evk"
@@ -22,13 +22,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.52-2.2.0)/imx-atf-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.12.3-1.0.0)/imx-atf-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.52-2.2.0)/uboot-imx-lf-6.6.52-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.3-1.0.0)/uboot-imx-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx93_11x11_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
