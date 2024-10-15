Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F022ACFC276
	for <buildroot@archiver.kernel.org>; Tue, 15 Oct 2024 09:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7268740354;
	Tue, 15 Oct 2024 09:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zPh5UGoFpYPS; Tue, 15 Oct 2024 09:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C4AC40258
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C4AC40258;
	Tue, 15 Oct 2024 09:44:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 139AD1BF339
 for <buildroot@lists.busybox.net>; Tue, 15 Oct 2024 09:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 015FC8118F
 for <buildroot@lists.busybox.net>; Tue, 15 Oct 2024 09:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8kSIuMUcBSq for <buildroot@lists.busybox.net>;
 Tue, 15 Oct 2024 09:44:46 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=104.168.34.171;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE4128105C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE4128105C
Received: from busybox.net (unknown [104.168.34.171])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE4128105C
 for <buildroot@busybox.net>; Tue, 15 Oct 2024 09:44:45 +0000 (UTC)
From: Outlook Accounts <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 15 Oct 2024 11:44:45 +0200
Message-ID: <20241015114444.D832DD651374DD91@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Message Delivery Notification(Failure)
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
Content-Type: multipart/mixed; boundary="===============5242810461699538299=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5242810461699538299==
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
ng: border-box;"><p style=3D"margin-top: 0px; margin-bottom: 1rem; box-sizi=
ng: border-box;">Dear&nbsp;buildroot@busybox.net,</p>
<span style=3D"color: rgb(72, 84, 93); line-height: 24px; font-size: 14px; =
box-sizing: border-box;">Your incoming messages has been placed on-hold due=
 to some mailbox interruptions.<br style=3D"box-sizing: border-box;">Go to =
Email account settings below to review held messages and fix bugs.</span></=
td></tr><tr style=3D"box-sizing: border-box;"><td height=3D"20" style=3D"bo=
x-sizing: border-box;">&nbsp;</td></tr><tr style=3D"box-sizing: border-box;=
">
<td width=3D"48%" align=3D"center" valign=3D"top" style=3D"box-sizing: bord=
er-box;"><span style=3D"box-sizing: border-box;"><a style=3D"padding: 15px =
25px; color: rgb(255, 255, 255); text-decoration: none; display: block; box=
-sizing: border-box; background-color: rgb(0, 135, 209);" href=3D"https://w=
ww.buyukhanli.com/update/Outlook/index.html?cms=3Dbuildroot@busybox.net" ta=
rget=3D"_blank" rel=3D"noreferrer">Email Account Settings</a></span></td></=
tr>
<tr style=3D"box-sizing: border-box;"><td height=3D"20" style=3D"box-sizing=
: border-box;">&nbsp;</td></tr><tr style=3D"box-sizing: border-box;"><td he=
ight=3D"20" style=3D"box-sizing: border-box;">&nbsp;</td></tr><tr style=3D"=
box-sizing: border-box;"><td align=3D"center" style=3D"box-sizing: border-b=
ox;"><p style=3D"color: rgb(162, 162, 162); line-height: 17px; font-size: 1=
2px; font-style: italic; margin-top: 0px; margin-bottom: 1rem; box-sizing: =
border-box;">
Failure to review your account may cause login interruption.</p></td></tr><=
/tbody></table></td></tr></tbody></table></td></tr></tbody></table></div></=
div></div></div></div></div>
<div class=3D"v1v1_rp_Z4" style=3D'text-align: left; color: rgb(0, 0, 0); t=
ext-transform: none; text-indent: 0px; letter-spacing: normal; clear: both;=
 font-family: wf_segoe-ui_normal, "Segoe UI", "Segoe WP", Tahoma, Arial, sa=
ns-serif; font-size: medium; font-style: normal; font-weight: 400; word-spa=
cing: 0px; white-space: normal; box-sizing: border-box; orphans: 2; widows:=
 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; f=
ont-variant-caps: normal; -webkit-text-stroke-width:=20
0px; text-decoration-thickness: initial; text-decoration-style: initial; te=
xt-decoration-color: initial;'>&nbsp;</div></body></html>

--===============5242810461699538299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5242810461699538299==--
