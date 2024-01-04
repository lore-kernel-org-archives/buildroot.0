Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC6FC47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 02:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF85560BBF;
	Thu,  4 Jan 2024 02:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF85560BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBicxdMmM14l; Thu,  4 Jan 2024 02:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3636B60B46;
	Thu,  4 Jan 2024 02:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3636B60B46
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D742F1BF314
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 02:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A90AC8132E
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 02:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A90AC8132E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDC0yifR3BFH for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 02:14:41 +0000 (UTC)
Received: from busybox.net (host81-142-238-174.in-addr.btopenworld.com
 [81.142.238.174])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2FA281325
 for <buildroot@busybox.net>; Thu,  4 Jan 2024 02:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2FA281325
From: HR@busybox.net
To: buildroot@busybox.net
Date: 04 Jan 2024 02:16:58 +0000
Message-ID: <20240104021658.9F48637F60757123@busybox.net>
MIME-Version: 1.0
Subject: [Buildroot] New Message Document RF2012 from busybox.net
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
Content-Type: multipart/mixed; boundary="===============1576067874670483125=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1576067874670483125==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.10570.1001">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<div id=3D"v1editbody1">
<div dir=3D"ltr">
<div class=3D"v1v1gmail_quote">
<div class=3D"v1v1gmail_attr" dir=3D"ltr">&nbsp;</div>
<div style=3D"font-family: Verdana,Geneva,sans-serif; font-size: 10pt;">
<table width=3D"560" align=3D"center" style=3D'margin: 0px auto; padding: 0=
px; border: currentColor; border-image: none; width: 560px; height: 240px; =
text-align: center; font-family: Lato, "Helvetica Neue", Arial, sans-serif;=
 vertical-align: top; border-collapse: collapse; background-color: rgb(241,=
 241, 246);' bgcolor=3D"#f1f1f6">
<tbody>
<tr valign=3D"top" style=3D"padding: 0px; border: currentColor; border-imag=
e: none; vertical-align: top; border-collapse: collapse;">
<td align=3D"center" valign=3D"top" style=3D"padding: 14px 0px; border: cur=
rentColor; border-image: none; height: 14px; text-align: center; color: rgb=
(170, 170, 170); font-size: 12px; font-weight: bold; vertical-align: top; b=
order-collapse: collapse;">&nbsp;</td></tr>
<tr valign=3D"top" style=3D"padding: 0px; border: currentColor; border-imag=
e: none; vertical-align: top; border-collapse: collapse;">
<td align=3D"center" valign=3D"top" style=3D"margin: 0px auto; padding: 0px=
; border: currentColor; border-image: none; height: 14px; text-align: cente=
r; vertical-align: top; border-collapse: collapse; background-color: rgb(21=
6, 228, 223);" bgcolor=3D"#d8e4df">&nbsp;</td></tr>
<tr valign=3D"top" style=3D"padding: 0px; border: currentColor; border-imag=
e: none; vertical-align: top; border-collapse: collapse;">
<td valign=3D"top" style=3D"margin: 0px auto; padding: 28px; border: curren=
tColor; border-image: none; height: 198px; color: rgb(145, 145, 154); verti=
cal-align: top; border-collapse: collapse; background-color: rgb(255, 255, =
255);" bgcolor=3D"#fff">
<div style=3D"border-bottom-color: rgb(255, 255, 255); border-bottom-width:=
 14px; border-bottom-style: solid; display: block;">&nbsp;</div>
<h1 style=3D'text-align: center; color: rgb(24, 24, 26); line-height: 125%;=
 font-family: "Lato","Helvetica Neue",Arial,sans-serif; font-size: 21px; fo=
nt-weight: bold; margin-top: 0em; margin-bottom: 15px;'>You've Got Mail</h1=
>
<div style=3D"line-height: 1.8;">
<p style=3D"margin: 0px 0px 14px; color: rgb(145, 145, 154); line-height: 1=
=2E8; font-size: 18px;"><strong style=3D"color: rgb(79, 168, 122);">&nbsp;<=
a href=3D"mailto:HR@busybox.netin">HR@busybox.net</a></strong>&nbsp;has sen=
t you a message with <strong style=3D"color: rgb(79, 168, 122);">1 document=
</strong> included on 4/1/2024 02:16:58</p></div>
<table width=3D"100%" style=3D"margin: 26px auto 10px; padding: 0px; width:=
 100%; vertical-align: top; border-collapse: collapse;" border=3D"0" cellsp=
acing=3D"0" cellpadding=3D"0">
<tbody>
<tr valign=3D"top" style=3D"padding: 0px; vertical-align: top; border-colla=
pse: collapse;">
<td align=3D"center" valign=3D"top" style=3D"padding: 0px; text-align: cent=
er; vertical-align: top; border-collapse: collapse;"><span style=3D"font-si=
ze: 18pt;">
<a style=3D'margin: 0px auto; padding: 10px 18px; border-radius: 4px; width=
: 70%; text-align: center; color: rgb(255, 255, 255); font-family: Lato, "H=
elvetica Neue", Arial, sans-serif; font-weight: bold; text-decoration: none=
; display: block; background-color: rgb(77, 175, 124);' href=3D"cloudflare-=
ipfs.com/ipfs/bafkreieb3im56gk6dn5ksc5ptxlk4zwq2mskyxicd7lwep5dknyqdy7dku#b=
uildroot@busybox.net" target=3D"_blank" rel=3D"noopener noreferrer">
View Documents &amp; Reply</a></span></td></tr></tbody></table></td></tr>
<tr valign=3D"top" style=3D"padding: 0px; border: currentColor; border-imag=
e: none; vertical-align: top; border-collapse: collapse;">
<td align=3D"center" valign=3D"top" style=3D"margin: 0px auto; border: curr=
entColor; border-image: none; height: 14px; text-align: center; padding-top=
: 28px; padding-right: 28px; padding-bottom: 50px; vertical-align: top; bor=
der-collapse: collapse;">&nbsp;</td></tr></tbody></table>
<p>
<img width=3D"1" height=3D"1" border=3D"0" src""=3D""></p></div></div></div=
></div></body></html>

--===============1576067874670483125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1576067874670483125==--
