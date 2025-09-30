Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60769CCA471
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 332F0614BA;
	Wed,  1 Oct 2025 20:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fY8Q5jNYNK0E; Wed,  1 Oct 2025 20:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4DA461469
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4DA461469;
	Wed,  1 Oct 2025 20:01:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EF5B72
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1B1484047
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ioJxkMqeyQJB for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 261B18404F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 261B18404F
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24300866FE; Wed,  1 Oct 2025 20:01:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:07:08 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 41db4f560fba2de4f5afa155a086a982916335b9
X-Git-Newrev: a433ca99c7a8d55a33676e783ff960ac2ba67507
X-Patchwork-Hint: ignore
Message-Id: <20251001200130.24300866FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] board/xilinx: migrate
 board web links to amd.com
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a433ca99c7a8d55a33676e783ff960ac2ba67507
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

As the xilinx.com website will soon be going away, migrate all xilinx board
web links from xilinx.com to amd.com.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 74dcda25449b4d40a5f48820f0e53bf97315972d)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 board/versal/readme.txt      | 6 +++---
 board/zynq/readme.txt        | 4 ++--
 board/zynqmp/kria/readme.txt | 6 +++---
 board/zynqmp/readme.txt      | 6 +++---
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/board/versal/readme.txt b/board/versal/readme.txt
index 4d8406fb1f..e1edbace11 100644
--- a/board/versal/readme.txt
+++ b/board/versal/readme.txt
@@ -11,13 +11,13 @@ Xilinx VPK180 board
 Evaluation board features can be found here with the links below.
 
 VCK190:
-https://www.xilinx.com/products/boards-and-kits/vck190.html
+https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vck190.html
 
 VEK280:
-https://www.xilinx.com/products/boards-and-kits/vek280.html
+https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vek280.html
 
 VPK180:
-https://www.xilinx.com/products/boards-and-kits/vpk180.html
+https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vpk180.html
 
 
 How to build it
diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
index b2a4cefedd..54e01c9d8c 100644
--- a/board/zynq/readme.txt
+++ b/board/zynq/readme.txt
@@ -36,11 +36,11 @@ myboot=...
 References:
  - ZC702 information including schematics, reference designs, and manuals are
    available from
-   https://www.xilinx.com/products/boards-and-kits/ek-z7-zc702-g.html
+   https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/ek-z7-zc702-g.html
 
  - ZC706 information including schematics, reference designs, and manuals are
    available from
-   http://www.xilinx.com/products/boards-and-kits/ek-z7-zc706-g.html.
+   https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/ek-z7-zc706-g.html
 
  - Zedboard/Microzed information including schematics, reference designs, and
    manuals are available from http://www.zedboard.org .
diff --git a/board/zynqmp/kria/readme.txt b/board/zynqmp/kria/readme.txt
index 6fd7ca61ca..8d008332bf 100644
--- a/board/zynqmp/kria/readme.txt
+++ b/board/zynqmp/kria/readme.txt
@@ -10,13 +10,13 @@ the KD240, KR260 and KV260 production boards.
 Evaluation board features can be found here with the links below.
 
 KD240:
-https://www.xilinx.com/products/som/kria/kd240-drives-starter-kit.html
+https://www.amd.com/en/products/system-on-modules/kria/k24/kd240-drives-starter-kit.html
 
 KR260:
-https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html
+https://www.amd.com/en/products/system-on-modules/kria/k26/kr260-robotics-starter-kit.html
 
 KV260:
-https://www.xilinx.com/products/som/kria/kv260-vision-starter-kit.html
+https://www.amd.com/en/products/system-on-modules/kria/k26/kv260-vision-starter-kit.html
 
 How to build it
 ===============
diff --git a/board/zynqmp/readme.txt b/board/zynqmp/readme.txt
index 3f1b3a80c2..0360ec5f77 100644
--- a/board/zynqmp/readme.txt
+++ b/board/zynqmp/readme.txt
@@ -10,13 +10,13 @@ boards.
 Evaluation board features can be found here with the links below.
 
 ZCU102:
-https://www.xilinx.com/products/boards-and-kits/zcu102.html
+https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/ek-u1-zcu102-g.html
 
 ZCU104:
-https://www.xilinx.com/products/boards-and-kits/zcu104.html
+https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/zcu104.html
 
 ZCU106:
-https://www.xilinx.com/products/boards-and-kits/zcu106.html
+https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/zcu106.html
 
 
 How to build it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
