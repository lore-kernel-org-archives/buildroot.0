Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDAEC77B7A
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 19:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B46AD841DC;
	Sat,  3 Jun 2023 19:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B46AD841DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pOR9p2c8beEw; Sat,  3 Jun 2023 19:01:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8883B839B4;
	Sat,  3 Jun 2023 19:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8883B839B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE6AB1BF489
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 877CD611F3
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 877CD611F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SH05Ubc1-Uwu for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 19:01:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D2C9611E0
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 19:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D2C9611E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4330886405; Sat,  3 Jun 2023 19:01:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jun 2023 20:59:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ba8a13d7bbfcdfce85f6a38ec4f5df291f25c7b
X-Git-Newrev: 6aa637737fd04cbf0f69fb0d2b9eeeba029c8570
X-Patchwork-Hint: ignore
Message-Id: <20230603190109.4330886405@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/kria/kv260/kv260.sh: remove trailing
 spaces
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6aa637737fd04cbf0f69fb0d2b9eeeba029c8570
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Neal Frager <neal.frager@amd.com>
[Arnout: update .checkpackageignore]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore              | 2 +-
 board/zynqmp/kria/kv260/kv260.sh | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d6d8d886b4..567e22520c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -103,7 +103,7 @@ board/versal/post-build.sh Shellcheck
 board/versal/post-image.sh Shellcheck TrailingSpace
 board/zynq/post-build.sh Shellcheck
 board/zynq/post-image.sh Shellcheck
-board/zynqmp/kria/kv260/kv260.sh Shellcheck TrailingSpace
+board/zynqmp/kria/kv260/kv260.sh Shellcheck
 board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch ApplyOrder Upstream
 board/zynqmp/post-build.sh Shellcheck
 board/zynqmp/post-image.sh Shellcheck
diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
index e3467f3068..e03d67d8b0 100755
--- a/board/zynqmp/kria/kv260/kv260.sh
+++ b/board/zynqmp/kria/kv260/kv260.sh
@@ -1,8 +1,8 @@
 #!/bin/sh
 
 # This is a temporary work around for generating kv260 u-boot.itb.
-# The problem is there is no way to currently configure u-boot to apply 
-# the carrier board dtb overlay during build, so all kv260 carrier board 
+# The problem is there is no way to currently configure u-boot to apply
+# the carrier board dtb overlay during build, so all kv260 carrier board
 # drivers are missing.
 # This will be removed when u-boot can build the kv260 u-boot.itb natively.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
