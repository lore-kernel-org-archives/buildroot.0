Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11353C02197
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 14:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8ED760FF1;
	Tue,  4 Feb 2025 14:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OACrAZwGhBCd; Tue,  4 Feb 2025 14:35:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B736B60FEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B736B60FEA;
	Tue,  4 Feb 2025 14:35:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 61A09185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50889406AA
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TesDWCGiIUDi for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 14:35:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69D6940E0B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69D6940E0B
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:35:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5588F86D38; Tue,  4 Feb 2025 14:35:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 15:14:52 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: a28afd7d85cb5605cb7f86c39f58f229c6397db1
X-Git-Newrev: 6be96dee22ab948c246e23dba88be3d7cc1c48f5
X-Patchwork-Hint: ignore
Message-Id: <20250204143535.5588F86D38@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] DEVELOPERS: add myself as
 developer for raspberrypi
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
Content-Type: multipart/mixed; boundary="===============8718736855881069414=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8718736855881069414==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6be96dee22ab948c246e23dba88be3d7cc1c48f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 9a271f9646cfcbe494f8356dfe43dab53fdec298)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 847b3645eb..71289105d3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1195,6 +1195,10 @@ N:	Frank Vanbever <frank.vanbever@mind.be>
 F:	package/libmodsecurity/
 F:	package/nginx-modsecurity/
 
+N:	Gaël PORTAY <gael.portay+rtone@gmail.com>
+F:	board/raspberrypi/
+F:	configs/raspberrypi*
+
 N:	Gao Xiang <hsiangkao@aol.com>
 F:	package/erofs-utils/
 

--===============8718736855881069414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8718736855881069414==--
