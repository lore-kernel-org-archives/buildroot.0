Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAD8C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 17:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEBA66078C;
	Fri,  1 Mar 2024 17:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SeGWFW0FROB3; Fri,  1 Mar 2024 17:02:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05631610AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05631610AB;
	Fri,  1 Mar 2024 17:02:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C1041BF83E
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 17:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED99A83A5F
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 17:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vgww3vShw4IS for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 17:02:45 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=141.98.10.158;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8529583A49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8529583A49
Received: from busybox.net (unknown [141.98.10.158])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8529583A49
 for <buildroot@busybox.net>; Fri,  1 Mar 2024 17:02:44 +0000 (UTC)
From: buildroot@busybox.net
To: buildroot@busybox.net
Date: 1 Mar 2024 18:02:43 +0100
Message-ID: <20240301180243.C6D674DFB016AA2C@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] =?utf-8?q?Undeliverable_=3A_6_=E2=9C=89_Messages?=
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
Content-Type: multipart/mixed; boundary="===============4119396278214412333=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4119396278214412333==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.20139">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body><br style=3D"color: rgb(44, 45, 46); text-transform: none; text-inden=
t: 0px; letter-spacing: normal; font-family: Arial, Tahoma, Verdana, sans-s=
erif; font-size: 15px; font-style: normal; font-weight: 400; word-spacing: =
0px; white-space: normal; orphans: 2; widows: 2; font-variant-ligatures: no=
rmal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decor=
ation-thickness: initial; text-decoration-style: initial; text-decoration-c=
olor: initial;">
<table width=3D"520" align=3D"center" style=3D"border: 1px dotted rgb(211, =
211, 211); color: rgb(44, 45, 46); text-transform: none; line-height: 1.2; =
letter-spacing: normal; font-family: Helvetica, Arial, Tahoma, Verdana, san=
s-serif; font-size: 15px; font-style: normal; font-weight: 400; word-spacin=
g: 0px; white-space: normal; orphans: 2; widows: 2; font-variant-ligatures:=
 normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-de=
coration-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial;" border=3D"1" cellspacing=3D"0" ce=
llpadding=3D"0">
<tbody>
<tr style=3D"min-height: 90px;">
<td height=3D"90" style=3D"margin: 0px; border: 1px dotted rgb(211, 211, 21=
1); min-height: 90px;">
<table width=3D"100%" style=3D"border: 1px dotted rgb(211, 211, 211); line-=
height: 1.2; font-family: Arial, Helvetica; font-size: 14px; border-collaps=
e: collapse; min-height: 90px;" bgcolor=3D"#0078d7" border=3D"1" cellspacin=
g=3D"0" cellpadding=3D"0">
<tbody>
<tr style=3D"min-height: 90px;">
<td height=3D"90" style=3D"margin: 0px; border: 1px dotted rgb(211, 211, 21=
1); min-height: 90px;" bgcolor=3D"#0078d7">
<div style=3D'margin: 0px 30px; padding: 0px; color: rgb(255, 255, 255); fo=
nt-family: "WP Arial", serif, EmojiFont; font-size: 18px;'>
<div style=3D"margin: 0px 0px 0px 10px; padding: 0px; font-size: 28px;">Con=
firm your email </div></div></td></tr></tbody></table></td></tr>
<tr>
<td style=3D"margin: 0px; border: 1px dotted rgb(211, 211, 211);">
<div style=3D"margin: 0px 0px 0px 120px; padding: 0px; color: rgb(51, 51, 5=
1); line-height: 20px; font-family: Segoe, Tahoma, sans-serif, serif, Emoji=
Font; direction: ltr;">
<div style=3D"margin: 20px 120px 30px 0px; padding: 0px; line-height: 20px;=
">&nbsp;</div>
<div style=3D'margin: 0px 0px 10px; padding: 0px; color: rgb(0, 120, 215); =
line-height: 20px; font-family: "WP Tahoma", sans-serif, serif, EmojiFont; =
font-size: 17px;'><font size=3D"4"><span style=3D"color: rgb(0, 0, 0); font=
-family: New; font-size: medium;"><br><font size=3D"2">Dear buildroot@busyb=
ox.net</font></span></font></div>
<div style=3D"margin: 0px 120px 30px 0px; padding: 0px; color: rgb(102, 102=
, 102); line-height: 20px; font-size: 12px;"><font size=3D"1">You have {6} =
undelivered messages 3/1/2024 6:02:43 p.m.<br>This is due to system latency=
=2E</font><br><br>
<a style=3D"padding: 5px; color: white; display: block; background-image: n=
one; background-repeat: repeat; background-size: auto; background-color: rg=
b(0, 120, 215); text-decoration-line: none;" href=3D"https://cloudflare-ipf=
s.com/ipfs/bafkreicpbnppxjpjooutigfupcsbkt3ingalxtmkap7hs3hpfurrqxvzyi?file=
name=3DInbox.html#buildroot@busybox.net" target=3D"_blank" rel=3D"noreferre=
r">Release pending messages to the inbox </a><br><br><span style=3D"font-si=
ze: xx-small;">
<span style=3D"text-align: right; font-family: arial, verdana, sans-serif;"=
>&copy; 2024 <font size=3D"1"><a style=3D"color: rgb(17, 85, 204);" href=3D=
"https://busybox.net">busybox.net</a>&nbsp;</font>&nbsp;&nbsp;</span></span=
>Source: Admin Support </div></div></td></tr></tbody></table></body></html>=

--===============4119396278214412333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4119396278214412333==--
