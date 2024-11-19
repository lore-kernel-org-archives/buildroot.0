Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC05D6C29A
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 21:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1007084C18;
	Tue, 19 Nov 2024 21:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTxNsK8ZhboN; Tue, 19 Nov 2024 21:03:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 278E584C66
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 278E584C66;
	Tue, 19 Nov 2024 21:03:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 073DBDB3
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E991084C66
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-uLrURBz4Wh for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 21:03:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C62284C18
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C62284C18
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:03:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BA648642C; Tue, 19 Nov 2024 21:03:14 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 19 Nov 2024 22:00:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 353a37b04d0da29b0dfda3c98381b24839a1adc9
X-Git-Newrev: a359514630165fe03c7bd159af10b7d20d08334a
X-Patchwork-Hint: ignore
Message-Id: <20241119210314.0BA648642C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: update maintainer of Andes
 platform
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

commit: https://git.buildroot.net/buildroot/commit/?id=a359514630165fe03c7bd159af10b7d20d08334a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I will lose access to my email next week, so hand
it over to Leo Yu-Chi Liang.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index fc189fa644..d75df5cc55 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2515,7 +2515,7 @@ F:	package/dbus-broker/
 F:	package/systemd/
 F:	package/tcf-agent/
 
-N:	Yu Chien Peter Lin <peterlin@andestech.com>
+N:	Leo Yu-Chi Liang <ycliang@andestech.com>
 F:	board/andes
 F:	configs/andes_ae350_45_defconfig
 F:	package/andes-spi-burn/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
