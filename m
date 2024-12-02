Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6B2D7833A
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 16:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7A17406A5;
	Mon,  2 Dec 2024 16:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2JBYelaWqYF; Mon,  2 Dec 2024 16:54:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CDA540732
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CDA540732;
	Mon,  2 Dec 2024 16:54:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B6431DAA
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 16:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59CAB81D11
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 16:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CRfbXxVf9ZHL for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 16:54:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.182.54.12;
 helo=mailo.com; envelope-from=lpdev@cordier.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7954581BC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7954581BC6
Received: from mailo.com (msg-2.mailo.com [213.182.54.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7954581BC6
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 16:54:08 +0000 (UTC)
Received: by b221-7.in.mailobj.net [192.168.90.27] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Mon,  2 Dec 2024 17:54:06 +0100 (CET)
X-EA-Auth: ghHxG+ZLiSrmr93SYEaAIecTNbxVcbO+qFCTURKzFuyUxpX8bjdOvOtbCt7Is265kdGyWXijWpvfpXMmFkC8cOtrXJOqUlA4
Date: Mon, 2 Dec 2024 17:54:04 +0100
From: LP C <lpdev@cordier.org>
To: "=?utf-8?Q?buildroot=40buildroot.org?=" <buildroot@buildroot.org>
Message-ID: <DDAD80D6-F42C-4D97-9876-FEB2021F2F02@getmailspring.com>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=cordier.org
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove myself as maintainer of
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Louis-Paul CORDIER <lpdev@cordier.org>
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
-- 
2.47.0



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
