Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A220E9D41A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CA25611A5;
	Wed,  4 Feb 2026 17:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqNlCOCJb2_v; Wed,  4 Feb 2026 17:07:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14ED6611C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224879;
	bh=IkVVZThhlRIu5MwUUh0s+lVgqhcOxgLc5wlRzWIBdu8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PavhuhKNN4IgvJbFPJ/DSTD7ymyGHylnvwI2lUSDgEg9wmr3lD5KkN6rzkYHBZZEl
	 JVcQa25jNdl1dVUrWoUc733JExH7yYTg7k9WJHbXTqzQasicb7IY97vxL8i4abSNxq
	 sIbDcu6oxoZ4ZBpIzvr8DaX0t118WkXAfnM0Qg4NLm9qGMYbpgcdpn7f0BJy2DRCEs
	 W1DA+Jf9MjQleHGrcTSvP71mix4vC9TnDcgT8tPkeiwCRCKHi3EEZHaFgAOmFAXkpc
	 UOX3OaAEPsuXHQxiU5Ed5z6+CHJIzJcEDjSzaGR7NapVtE/OMaTTJhXsj/t/EkdQuM
	 zg6ejyCFhfffw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14ED6611C1;
	Wed,  4 Feb 2026 17:07:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED8BF173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F4AD83E0A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtsDQLL-q_Jb for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F8F683C48
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F8F683C48
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7627586975; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:45:19 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b74b2b790bc18ae58384a76cf2107840fe522cab
X-Git-Newrev: 5cd1cc9f8b061c7d39fc66cb85f070502c28ea53
X-Patchwork-Hint: ignore
Message-Id: <20260204170638.7627586975@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: update e-mail
 for Frank Vanbever
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5cd1cc9f8b061c7d39fc66cb85f070502c28ea53
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Frank Vanbever <fvb@funkworks.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2f6062b7a8e91a763994b8fa1b5804a25a2be9cc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index eba18334e0..d9ab74a96a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1180,7 +1180,7 @@ F:	package/sane-backends/
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
