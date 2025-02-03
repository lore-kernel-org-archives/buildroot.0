Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5615C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 14:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F24660B6A;
	Mon,  3 Feb 2025 14:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZF23bLlI4coX; Mon,  3 Feb 2025 14:55:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4D0C60861
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4D0C60861;
	Mon,  3 Feb 2025 14:55:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90F611A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 801704064E
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BCgKPELzE_7i for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 14:54:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99E4140578
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99E4140578
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:54:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8903586940; Mon,  3 Feb 2025 14:54:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 15:54:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5ba67264c402f9e8b8f0f61edb4067083c9927a
X-Git-Newrev: 9a271f9646cfcbe494f8356dfe43dab53fdec298
X-Patchwork-Hint: ignore
Message-Id: <20250203145459.8903586940@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add myself as developer for
 raspberrypi
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5884636334157397356=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5884636334157397356==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9a271f9646cfcbe494f8356dfe43dab53fdec298
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 045d5dc2a1..746eaf5e1d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1194,6 +1194,10 @@ N:	Frank Vanbever <frank.vanbever@mind.be>
 F:	package/libmodsecurity/
 F:	package/nginx-modsecurity/
 
+N:	Gaël PORTAY <gael.portay+rtone@gmail.com>
+F:	board/raspberrypi/
+F:	configs/raspberrypi*
+
 N:	Gao Xiang <hsiangkao@aol.com>
 F:	package/erofs-utils/
 

--===============5884636334157397356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5884636334157397356==--
