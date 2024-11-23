Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AD5E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 13:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 859D5803C5;
	Sun,  8 Dec 2024 13:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sxpb6jho0UoF; Sun,  8 Dec 2024 13:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95E6681376
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95E6681376;
	Sun,  8 Dec 2024 13:07:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 053C8979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B089608B9
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q7_XEn4O6qBK for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 13:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7916A607CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7916A607CC
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7647486B73; Sun,  8 Dec 2024 13:06:52 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Nov 2024 13:13:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a156f347f6b6a6cf1ad879ff9c48e621b99cf3c
X-Git-Newrev: e495ce84a63ccdfae88c1b62c2dd809e0d002619
X-Patchwork-Hint: ignore
Message-Id: <20241208130652.7647486B73@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/xilinx/patches: add xilinx_v2024.2
 hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=e495ce84a63ccdfae88c1b62c2dd809e0d002619
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add remaining hashes for xilinx_v2024.2 release for zynqmp and versal boards.

xilinx_v2024.2 release includes:
 - atf 2.10
 - linux 6.6.40
 - uboot 2024.01
 - xilinx-prebuilt xilinx_v2024.2

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 1 +
 board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash           | 1 +
 2 files changed, 2 insertions(+)

diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index e300398541..2ef3a98196 100644
--- a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  c3369c89eab4e452bbc76c630e5dccb6c0ae588c0175b6c8549aa0241deb06ef  xlnx_rebase_v2.10_2024.1.tar.gz
+sha256  a45390c9e1d584a389abd37ee49dce3f8d3b41718b1fd7c977608b5387a38955  xlnx_rebase_v2.10_2024.2.tar.gz
diff --git a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
index c955cd79f5..3bd33a29a0 100644
--- a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
+++ b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
+sha256  ef61a4b249ecbf632a25cc34c3b03b8290be44397ff739467ac92ec1701e23bf  xilinx-prebuilt-xilinx_v2024.2.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
