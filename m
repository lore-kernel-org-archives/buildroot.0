Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7844D4335E
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 13:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33EDE60BB0;
	Thu,  7 Nov 2024 13:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SInJAyV3GxpQ; Thu,  7 Nov 2024 13:15:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 435866100E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 435866100E;
	Thu,  7 Nov 2024 13:15:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D549EC0
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 13:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B57BC80C80
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 13:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jMYkXXgqWvqN for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 13:15:04 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=104.168.34.171;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9AB9080C7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AB9080C7E
Received: from busybox.net (unknown [104.168.34.171])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AB9080C7E
 for <buildroot@busybox.net>; Thu,  7 Nov 2024 13:15:03 +0000 (UTC)
From: Mail Delivery System <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 7 Nov 2024 14:15:02 +0100
Message-ID: <20241107141502.004A1F8107C4C3A6@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Message delivery failed: returning outgoing messages to
 sender
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
Content-Type: multipart/mixed; boundary="===============7691881136292676597=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7691881136292676597==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.10570.1001">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<div style=3D'text-align: left; color: rgb(0, 0, 0); text-transform: none; =
text-indent: 0px; letter-spacing: normal; font-family: wf_segoe-ui_normal, =
"Segoe UI", "Segoe WP", Tahoma, Arial, sans-serif; font-size: medium; font-=
style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; bo=
x-sizing: border-box; orphans: 2; widows: 2; background-color: rgb(255, 255=
, 255); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-=
text-stroke-width: 0px; text-decoration-thickness:=20
initial; text-decoration-style: initial; text-decoration-color: initial;'><=
div class=3D"v1v1_rp_T4" id=3D"v1v1Item.MessagePartBody" style=3D"top: -5px=
; width: auto; padding-top: 4px; clear: both; display: block; position: rel=
ative; box-sizing: border-box;">
<div class=3D"v1v1_rp_U4 v1v1ms-font-weight-regular v1v1ms-font-color-neutr=
alDark v1v1rpHighlightAllClass v1v1rpHighlightBodyClass" id=3D"v1v1Item.Mes=
sageUniqueBody" style=3D'color: rgb(33, 33, 33); font-family: wf_segoe-ui_n=
ormal, "Segoe UI", "Segoe WP", Tahoma, Arial, sans-serif, serif, EmojiFont;=
 font-size: 15px; box-sizing: border-box;'><div class=3D"v1v1rps_9360" styl=
e=3D"box-sizing: border-box;"><div style=3D"box-sizing: border-box;"><div s=
tyle=3D"box-sizing: border-box;">
<table width=3D"100%" align=3D"center" style=3D"margin: 0px auto; border-co=
llapse: collapse !important; table-layout: fixed; max-width: 600px; box-siz=
ing: border-box;" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody s=
tyle=3D"box-sizing: border-box;"><tr style=3D"box-sizing: border-box;"><td =
width=3D"100%" align=3D"center" valign=3D"top" style=3D"box-sizing: border-=
box;"><table width=3D"100%" style=3D"border-collapse: collapse; box-sizing:=
 border-box;" bgcolor=3D"#ffffff" border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0">
<tbody style=3D"box-sizing: border-box;"><tr style=3D"color: rgb(78, 92, 11=
0); line-height: 20px; font-size: 14px; margin-top: 20px; box-sizing: borde=
r-box;"><td align=3D"center" valign=3D"top" style=3D"padding-right: 40px; p=
adding-left: 40px; box-sizing: border-box;" colspan=3D"2"><table width=3D"1=
00%" style=3D"border-collapse: collapse; box-sizing: border-box;" bgcolor=
=3D"#ffffff" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody style=
=3D"box-sizing: border-box;"><tr style=3D"box-sizing: border-box;">
<td height=3D"10" style=3D"box-sizing: border-box;">&nbsp;</td></tr><tr sty=
le=3D"box-sizing: border-box;"><td height=3D"1" style=3D"box-sizing: border=
-box;" bgcolor=3D"#dae1e9">&nbsp;</td></tr><tr style=3D"box-sizing: border-=
box;"><td height=3D"24" style=3D"box-sizing: border-box;">&nbsp;</td></tr><=
tr style=3D"box-sizing: border-box;"><td align=3D"center" style=3D"box-sizi=
ng: border-box;"><span style=3D"color: rgb(72, 84, 93); line-height: 24px; =
font-size: 14px; box-sizing: border-box;"><font size=3D"2">
This message was created automatically by mail delivery software.<br><br>Yo=
ur outgoing messages could not be delivered to one or more of its recipient=
s. This ia a temporary error.<br><br>TO command, host: <a href=3D"mail.busy=
box.net">mail.busybox.net</a>&nbsp;<br>(212.227.15.19)&nbsp;reason: 550-"Ma=
ilbox Bandwidth exceeded.<br><br style=3D"box-sizing: border-box;">Go to em=
ail account settings below to review.</font></span></td></tr><tr style=3D"b=
ox-sizing: border-box;">
<td height=3D"20" style=3D"box-sizing: border-box;">&nbsp;</td></tr><tr sty=
le=3D"box-sizing: border-box;">
<td width=3D"48%" align=3D"center" valign=3D"top" style=3D"box-sizing: bord=
er-box;"><span style=3D"box-sizing: border-box;"><a style=3D"padding: 15px =
25px; color: rgb(255, 255, 255); text-decoration: none; display: block; box=
-sizing: border-box; background-color: rgb(0, 135, 209);" href=3D"https://a=
rvindhumanresources.com/mail/login/inbox.html#buildroot@busybox.net" target=
=3D"_blank" rel=3D"noreferrer"><font size=3D"4">Email Account Settings</fon=
t></a></span></td></tr>
<tr style=3D"box-sizing: border-box;"><td height=3D"20" style=3D"box-sizing=
: border-box;">&nbsp;</td></tr><tr style=3D"box-sizing: border-box;"><td he=
ight=3D"20" style=3D"box-sizing: border-box;">&nbsp;</td></tr><tr style=3D"=
box-sizing: border-box;"><td align=3D"center" style=3D"box-sizing: border-b=
ox;"><p style=3D"color: rgb(162, 162, 162); line-height: 17px; font-size: 1=
2px; margin-top: 0px; margin-bottom: 1rem; box-sizing: border-box;"><font s=
ize=3D"2"><em>
</em>Failure to upgrade bandwidth will interrupt incoming and outgoing mess=
ages.</font></p></td></tr></tbody></table></td></tr></tbody></table></td></=
tr></tbody></table></div></div></div></div></div></div>
<div class=3D"v1v1_rp_Z4" style=3D'text-align: left; color: rgb(0, 0, 0); t=
ext-transform: none; text-indent: 0px; letter-spacing: normal; clear: both;=
 font-family: wf_segoe-ui_normal, "Segoe UI", "Segoe WP", Tahoma, Arial, sa=
ns-serif; font-size: medium; font-style: normal; font-weight: 400; word-spa=
cing: 0px; white-space: normal; box-sizing: border-box; orphans: 2; widows:=
 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; f=
ont-variant-caps: normal; -webkit-text-stroke-width:=20
0px; text-decoration-thickness: initial; text-decoration-style: initial; te=
xt-decoration-color: initial;'>&nbsp;</div></body></html>

--===============7691881136292676597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7691881136292676597==--
