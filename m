Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58C2CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC434414BE;
	Thu, 27 Nov 2025 20:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L12o3SreQ310; Thu, 27 Nov 2025 20:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E005A414BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E005A414BF;
	Thu, 27 Nov 2025 20:36:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1425FDE
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAC3D6178C
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLkO7-al8jkD for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:36:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 429D461AB5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 429D461AB5
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4154883CC9; Thu, 27 Nov 2025 20:36:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:41:42 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 5c18a56ffb8d25b7a4753a5d5daf69d36b2ba273
X-Git-Newrev: e3b869530152f09be9a054dc0f21906eec449844
X-Patchwork-Hint: ignore
Message-Id: <20251127203603.4154883CC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] DEVELOPERS: add Thomas
 Perale to cve-check & cve.py
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

commit: https://git.buildroot.net/buildroot/commit/?id=e3b869530152f09be9a054dc0f21906eec449844
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 51558fa3ea8e0ad445a192536375bf930f103a92)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c7aab803be..bb23d93de4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3186,6 +3186,8 @@ F:	package/xorcurses/
 N:	Thomas Perale <thomas.perale@mind.be>
 F:	package/go/
 F:	utils/generate-cyclonedx
+F:	support/scripts/cve-check
+F:	support/scripts/cve.py
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
