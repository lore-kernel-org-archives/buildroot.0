Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A693E74AD1
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 20:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3B2740295;
	Tue,  3 Dec 2024 20:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQQcFscdv2zH; Tue,  3 Dec 2024 20:15:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB78F40296
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB78F40296;
	Tue,  3 Dec 2024 20:15:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D8571DAA
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 383D440ADF
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1TduffdJjBfh for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 20:15:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 660514023A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 660514023A
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:15:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D212F867D7; Tue,  3 Dec 2024 20:15:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Dec 2024 21:12:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e02e59d124647af71b30eb224a78b53e77db61f5
X-Git-Newrev: 0fd5860280c2172da28aec50dfd29b7a080f6c6c
X-Patchwork-Hint: ignore
Message-Id: <20241203201547.D212F867D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove myself as maintainer of
 package/{intel-gmmlib, intel-mediadriver, intel-mediasdk}
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fd5860280c2172da28aec50dfd29b7a080f6c6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Louis-Paul CORDIER <lpdev@cordier.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d75df5cc55..c2b6b1dda5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2119,11 +2119,6 @@ F:	package/python-huepy/
 F:	package/python-tqdm/
 F:	package/rtl8189es/
 
-N:	Louis-Paul Cordier <lpdev@cordier.org>
-F:	package/intel-gmmlib/
-F:	package/intel-mediadriver/
-F:	package/intel-mediasdk/
-
 N:	Luca Ceresoli <luca.ceresoli@bootlin.com>
 F:	board/olimex/a20_olinuxino/
 F:	board/zynq/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
