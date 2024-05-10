Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC075C25B74
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5869C42BED;
	Fri, 10 May 2024 21:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id exbXZY7kkg8B; Fri, 10 May 2024 21:03:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E41EA404A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E41EA404A3;
	Fri, 10 May 2024 21:03:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F4111BF295
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B8F8404A3
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjk4nj0_i7Fy for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:03:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1EA34040A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1EA34040A
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:03:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC0FF86F43; Fri, 10 May 2024 21:03:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 23:02:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c8cc1dfc4aacdf247a4ba4a730a74118849c828
X-Git-Newrev: 09f0f116a39645cbd4fd51cc70a77f8688ac9fbd
X-Patchwork-Hint: ignore
Message-Id: <20240510210303.BC0FF86F43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils-bare-metal: apply
 binutils 2.42 patches
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=09f0f116a39645cbd4fd51cc70a77f8688ac9fbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Apply the same patches to binutils-bare-metal as binutils.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils-bare-metal/2.42 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils-bare-metal/2.42 b/package/binutils-bare-metal/2.42
new file mode 120000
index 0000000000..dfad0ed2f4
--- /dev/null
+++ b/package/binutils-bare-metal/2.42
@@ -0,0 +1 @@
+../binutils/2.42
\ No newline at end of file
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
