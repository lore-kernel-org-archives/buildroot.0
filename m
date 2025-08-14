Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E51CA0EE8
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 19:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E51480E42;
	Thu, 14 Aug 2025 19:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MaPC-xG6abXH; Thu, 14 Aug 2025 19:57:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE11F80DFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE11F80DFC;
	Thu, 14 Aug 2025 19:56:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BEB8228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD74E40486
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrUf7F-z64GP for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 19:56:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFB2E404AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFB2E404AE
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD84487606; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:26:45 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cf2ea88f485a75c1c89a8ecc42d2e6305f1ba3e4
X-Git-Newrev: 73f722ad09ffb4a05feddbd7f6614f1aee28ebdc
X-Patchwork-Hint: ignore
Message-Id: <20250814195612.DD84487606@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: Update email
 address of Thomas Huth
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

commit: https://git.buildroot.net/buildroot/commit/?id=73f722ad09ffb4a05feddbd7f6614f1aee28ebdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since tuxfamily.org is slowly fading away, update my mail address
to something that is more future-proof.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b7f7bd44f9c32a3ab49dae453256d04d7e66a630)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 152d97ee39..52069b3d96 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3177,7 +3177,7 @@ N:	Thomas Devoogdt <thomas@devoogdt.com>
 F:	package/fluent-bit/
 F:	package/libsoup3/
 
-N:	Thomas Huth <huth@tuxfamily.org>
+N:	Thomas Huth <th.huth+br@posteo.eu>
 F:	package/ascii-invaders/
 F:	package/kvm-unit-tests/
 F:	package/xorcurses/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
