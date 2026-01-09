Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD48D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E959B60DCA;
	Tue, 13 Jan 2026 19:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGrvlzzTBKSE; Tue, 13 Jan 2026 19:37:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4CAA60DC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333045;
	bh=H389nB4G5/IfVPKMJ044FlxKcljFeI8EBTwB2GIolJ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pJ4dF0Qj4+iuKxiInp+hDPAyU91aIFIdfu/Lb/yfvaFjyjChefJQ+XtuwCx+a4PKl
	 E/Hq+PRramWbG30WI67zpCr1oXagGT9v5sHn3d7a8S1DuG8uxrtinCYh0s04as79os
	 M36n6tdP4m/yqHvMQbmo5ZBtcSMEj3YZPbtvx9Q4PtW0sxl3XhRMBwzofiR6zmFEql
	 3ITj36nXi4QHgfioOHVoqY8RDe/sRQIQ6MzOq7wo+XcOH9SlZvlywy+O5+y3bhQXVi
	 mOVR2Dl4l+3kiy527ln9SnntdMluT4qX1TGwsDG+H9p24Sx6OJvU+phGJmswUo49Bl
	 abr98jJzF3CkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4CAA60DC4;
	Tue, 13 Jan 2026 19:37:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3610A1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BBA54047A
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCp3ZndGm34D for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31DAC404D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31DAC404D0
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FC6E86184; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:51:31 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3dc3519eed97fa31f39bec8c86e56feaffd0e9e1
X-Git-Newrev: 49c9f10bac10cc153e29d932d2e9a4b5eeb90d2f
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.2FC6E86184@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libdill: update
 project URL
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=49c9f10bac10cc153e29d932d2e9a4b5eeb90d2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

https://github.com/sustrik/libdill/pull/228

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f615dcb271aef7e7ca56ff83c8f88b78dcc7e906)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libdill/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdill/Config.in b/package/libdill/Config.in
index 2376fc9698..ec649c6600 100644
--- a/package/libdill/Config.in
+++ b/package/libdill/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBDILL
 	  Libdill is a C library that makes writing structured
 	  concurrent programs easy.
 
-	  http://libdill.org
+	  https://sustrik.github.io/libdill/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
