Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9ACCA0EFF
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC3A061B62;
	Thu, 21 Aug 2025 19:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5C8t5LNTDMuQ; Thu, 21 Aug 2025 19:20:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B01961B58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B01961B58;
	Thu, 21 Aug 2025 19:20:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16E1B1C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9B2A4194D
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNobb_Bky3fL for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 249E241921
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 249E241921
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1572F87880; Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:54:48 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 3eac6e8bca0b02793d23084ca531c4bab49639b4
X-Git-Newrev: ca84c57b2856a1ada6ee832107f354c9bd2c70c0
X-Patchwork-Hint: ignore
Message-Id: <20250821192018.1572F87880@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] DEVELOPERS: remove Suniel
 Mahesh, boucing e-mail
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca84c57b2856a1ada6ee832107f354c9bd2c70c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Suniel's e-mail address at Amarula Solutions is bouncing, so let's
drop this stale entry:

<sunil@amarulasolutions.com>: host aspmx.l.google.com[142.250.27.26] said:
    550-5.1.1 The email account that you tried to reach does not exist. Please
    try 550-5.1.1 double-checking the recipient's email address for typos or
    550-5.1.1 unnecessary spaces. For more information, go to 550 5.1.1
    https://support.google.com/mail/?p=NoSuchUser
    a640c23a62f3a-afcdce6d5e1si493680166b.9 - gsmtp (in reply to RCPT TO
    command)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3c93cf106caeb9bda4ddfd81c5c377e9bc461bfb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9b47b25bc1..7e73d9b2bd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3163,13 +3163,6 @@ N:	Steven Noonan <steven@uplinklabs.net>
 F:	package/hwloc/
 F:	package/powertop/
 
-N:	Suniel Mahesh <sunil@amarulasolutions.com>
-F:	board/pine64/rockpro64
-F:	board/radxa/rockpi-n8
-F:	configs/rock_pi_n8_defconfig
-F:	configs/rockpro64_defconfig
-F:	package/arm-gnu-toolchain/
-
 N:	Sven Oliver Moll <svolli@svolli.de>
 F:	package/most/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
