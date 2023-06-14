Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB89EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 11:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC16A41D85;
	Wed, 14 Jun 2023 11:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC16A41D85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uDKDNm-llrWM; Wed, 14 Jun 2023 11:54:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF02F41D60;
	Wed, 14 Jun 2023 11:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF02F41D60
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2192D1BF966
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDACE83313
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDACE83313
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qd-L5noIMOt for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 334DA832E7
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 334DA832E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30F5783630; Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 13:48:54 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: b81ac67a1c0b70bffc8de2a7a940ea95558b9b9d
X-Git-Newrev: f69bf649fc94c167df0ec05ed8803eb99622eb22
X-Patchwork-Hint: ignore
Message-Id: <20230614115310.30F5783630@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 board/kria/kv260/kv260.sh: remove trailing spaces
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f69bf649fc94c167df0ec05ed8803eb99622eb22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Neal Frager <neal.frager@amd.com>
[Arnout: update .checkpackageignore]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 6aa637737fd04cbf0f69fb0d2b9eeeba029c8570)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/zynqmp/kria/kv260/kv260.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
