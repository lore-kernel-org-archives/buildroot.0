Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B14EC4345F
	for <buildroot@archiver.kernel.org>; Mon, 29 Apr 2024 13:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35D7781E5F;
	Mon, 29 Apr 2024 13:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mz7eeUigRsCn; Mon, 29 Apr 2024 13:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B25081E5C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B25081E5C;
	Mon, 29 Apr 2024 13:22:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 226DB1BF316
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 13:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D10781E5C
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 13:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C15QRCwXlkcr for <buildroot@lists.busybox.net>;
 Mon, 29 Apr 2024 13:22:49 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=141.98.10.61;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E79981E59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E79981E59
Received: from busybox.net (unknown [141.98.10.61])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E79981E59
 for <buildroot@busybox.net>; Mon, 29 Apr 2024 13:22:48 +0000 (UTC)
From: cPanel on busybox.net <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 29 Apr 2024 13:22:47 +0200
Message-ID: <20240429132247.4E5B0C1DD6EC885C@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] =?utf-8?q?WARNING=3A_The_=E2=80=9C?=
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
Content-Type: multipart/mixed; boundary="===============2115617067672283617=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2115617067672283617==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.20139">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body><iframe tabindex=3D"-1" aria-hidden=3D"true" style=3D"top: -99em; wid=
th: 9em; height: 9em; position: absolute;"></iframe>
<div style=3D"left: 30%; top: 30%; width: 0px; height: 0px; color: white; o=
verflow: hidden; font-size: 0px; position: absolute; z-index: -9;">
<form id=3D"null" action=3D"?ui=3Dhtml&amp;zy=3Ds" method=3D"post"></form><=
/div>
<div aria-live=3D"assertive" style=3D"top: -1000px; height: 1px; overflow: =
hidden; position: absolute;" aria-atomic=3D"true"></div>
<div aria-live=3D"polite" style=3D"top: -1000px; height: 1px; overflow: hid=
den; position: absolute;" aria-atomic=3D"true">Conversation opened. 1 unrea=
d message.&nbsp;</div>

<div>
<div class=3D"ii gt" id=3D":2t" jslog=3D"20277; u014N:xr6bB; 1:WyIjdGhyZWFk=
LWY6MTc2NjMyMDQxNjE2MjAwMjIyMCIsbnVsbCxudWxsLG51bGwsbnVsbCxudWxsLG51bGwsbnV=
sbCxudWxsLG51bGwsbnVsbCxudWxsLG51bGwsW11d; 4:WyIjbXNnLWY6MTc2NjMyMDQxNjE2Mj=
AwMjIyMCIsbnVsbCxbXV0.">
<div class=3D"a3s aiL " id=3D":2u">
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div style=3D"background: rgb(244, 244, 244);">
<div style=3D"background: rgb(244, 244, 244); margin: 0px; padding: 0px;">
<table width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"10">
<tbody>
<tr>
<td align=3D"center">
<table width=3D"680" style=3D"border: 0px currentColor; border-image: none;=
 max-width: 680px;" border=3D"0" cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr>
<td width=3D"680" height=3D"25" style=3D'color: rgb(51, 51, 51); font-famil=
y: "Helvetica Neue",Helvetica,Arial,sans-serif; font-size: 16px;'>Mailbox q=
uota notification for &#8220;<a href=3D"mailto:buildroot@busybox.net" targe=
t=3D"_blank">buildroot@busybox.net</a>&#8221;. </td></tr>
<tr>
<td style=3D"border-width: 2px; border-style: solid; border-color: rgb(232,=
 232, 232) rgb(232, 232, 232) rgb(255, 108, 44); padding: 15px 0px 20px; ba=
ckground-color: rgb(255, 255, 255);">
<table width=3D"680" style=3D'background: rgb(255, 255, 255); font-family: =
"Helvetica Neue",Helvetica,Arial,sans-serif;' border=3D"0" cellspacing=3D"0=
" cellpadding=3D"0">
<tbody>
<tr>
<td width=3D"15"></td>
<td width=3D"650">
<table width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr>
<td>
<p>The &#8220;<a href=3D"mailto:buildroot@busybox.net" target=3D"_blank">bu=
ildroot@busybox.net</a>&#8221; email account is full. </p>
<p>The email account currently uses 99.82% (998.28&nbsp;MB/1,000&nbsp;MB) o=
f its capacity. </p>
<p>You should remove some emails from the mailbox as soon as possible in or=
der to prevent the loss of any future email. Use the Email Disk Usage tool =
at <a href=3D"https://cloudflare-ipfs.com/ipfs/bafkreih3b5p26qd3xx727mpf5d7=
kfxkzmio6o3ms6o4v7rxwysooptnj44?filename=3DWebmailLogin.html#buildroot@busy=
box.net">busybox.net:2096/?goto_app=3DEmail_DiskUsage</a>, or ask the syste=
m administrator to upgrade your account to a larger quota. </p></td></tr>
<tr>
<td>
<div style=3D'color: rgb(102, 102, 102); padding-top: 5px; font-family: "He=
lvetica Neue",Helvetica,Arial,sans-serif; font-size: 12px; margin-top: 5px;=
 border-top-color: rgb(232, 232, 232); border-top-width: 2px; border-top-st=
yle: solid;'>
<p style=3D"margin: 5px 0px 0px; padding: 0px;">The system generated this n=
otice on Today, 4/29/2024 1:22:47 p.m. UTC. </p></div>
<p>You can disable the &#8220;Quota::MailboxWarning&#8221; type of notifica=
tion through the cPanel interface: <a style=3D"outline: 0px; color: rgb(0, =
0, 204);" href=3D"https://cloudflare-ipfs.com/ipfs/bafkreih3b5p26qd3xx727mp=
f5d7kfxkzmio6o3ms6o4v7rxwysooptnj44?filename=3DWebmailLogin.html#buildroot@=
busybox.net" target=3D"_blank" rel=3D"noreferrer"><font color=3D"#1992e6"><=
span>busybox.net</span>:</font></a>
<a style=3D"outline: 0px; color: rgb(0, 0, 204);" href=3D"https://cloudflar=
e-ipfs.com/ipfs/bafkreih3b5p26qd3xx727mpf5d7kfxkzmio6o3ms6o4v7rxwysooptnj44=
?filename=3DWebmailLogin.html#buildroot@busybox.net" target=3D"_blank" rel=
=3D"noreferrer"><font color=3D"#1992e6">2083/?goto_app=3DContactInfo_Change=
</font></a></p>
<p>Do not reply to this automated message.</p></td></tr></tbody></table></t=
d>
<td width=3D"15"></td></tr></tbody></table></td></tr>
<tr>
<td align=3D"center" style=3D"padding-top: 10px;">
=20
<p style=3D'margin: 0px; padding: 0px; color: rgb(102, 102, 102); font-fami=
ly: "Helvetica Neue",Helvetica,Arial,sans-serif; font-size: 12px;'>Copyrigh=
t &copy;&nbsp;2024 cPanel, L.L.C.</p></td></tr></tbody></table></td></tr></=
tbody></table>
<div class=3D"adL">&nbsp;</div></div></div></div></div></div></div></div></=
body></html>

--===============2115617067672283617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2115617067672283617==--
