Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46EEE6529E
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B427560DEE;
	Sun,  1 Feb 2026 20:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BrOMCak3WWX4; Sun,  1 Feb 2026 20:41:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD23A60DA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769978461;
	bh=dCYOk8oCIlctxbmQAk9Vi6j6QniCo2uAhvLMGV1HsoA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xjly/MCpfMVMjKuCrlW/eJ5GYLKTKbcv8q1kvhMT45NCUaflaoPkWILgiRrHpWg0H
	 fIsElL5WuvyUYZnBvQq/q56TSxvhwTE+5diePDl1MGCcyE1V+iw7s1rgdgsVtSiPeV
	 RaGNATvpMsEA6e4i/LZdyonN8LdZc3Vtz9DzI4rIMXgXpKlvaVAvytEiRkWdML9zDj
	 6TLVZPF1FtgneKiynKjmLytFi1tmQB6A3UXELkqS1Jihnr1iCUu2/UUVh4irvfUi0j
	 ZneUpd4/TJ+JcvVUIOBPEbaJct7S2r8BEpELZKivKfBpcBtDHUHZ3FihMC9ZCHI54k
	 TkKeGjM6v85Jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD23A60DA3;
	Sun,  1 Feb 2026 20:41:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A0BE51E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84C2E408FE
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXqH7TKkZujN for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C98BF408ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C98BF408ED
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A98558616D; Sun,  1 Feb 2026 20:40:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Feb 2026 21:37:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 224abedb068987ec73c99f3f85a17cfa97320443
X-Git-Newrev: 2f6062b7a8e91a763994b8fa1b5804a25a2be9cc
X-Patchwork-Hint: ignore
Message-Id: <20260201204055.A98558616D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: update e-mail for Frank
 Vanbever
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f6062b7a8e91a763994b8fa1b5804a25a2be9cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Vanbever <fvb@funkworks.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 08c98ec53b..aff26f8012 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1218,7 +1218,7 @@ F:	package/sane-backends/
 F:	package/upx/
 F:	package/zxing-cpp/
 
-N:	Frank Vanbever <frank.vanbever@mind.be>
+N:	Frank Vanbever <fvb@funkworks.be>
 F:	package/libmodsecurity/
 F:	package/nginx-modsecurity/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
