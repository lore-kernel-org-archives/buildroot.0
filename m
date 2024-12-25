Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BD5E7718B
	for <buildroot@archiver.kernel.org>; Wed, 25 Dec 2024 03:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED58160706;
	Wed, 25 Dec 2024 03:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cozwDKY9epoU; Wed, 25 Dec 2024 03:20:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1389D6070F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1389D6070F;
	Wed, 25 Dec 2024 03:20:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BE85F15
 for <buildroot@buildroot.org>; Wed, 25 Dec 2024 03:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EC8E812F2
 for <buildroot@buildroot.org>; Wed, 25 Dec 2024 03:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7FuKiB9o2M9v for <buildroot@buildroot.org>;
 Wed, 25 Dec 2024 03:20:51 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=192.227.217.197;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 37B41812EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37B41812EA
Received: from busybox.net (unknown [192.227.217.197])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37B41812EA
 for <buildroot@busybox.net>; Wed, 25 Dec 2024 03:20:50 +0000 (UTC)
From: mail.busybox.net <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 25 Dec 2024 04:20:50 +0100
Message-ID: <20241225042050.146868D88B6AE934@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Deactivation Notice on 12/25/2024 4:20:50 a.m..
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
Content-Type: multipart/mixed; boundary="===============4611899502726901018=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4611899502726901018==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML>

<html><head><title></title>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body style=3D"margin: 0.4em;">
<div class=3D"bodyclass">
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
oot@busybox.net<br><br><br>Your domain server<span>&nbsp;</span>recently se=
nt a deactivation notice. </span><span style=3D"margin: 0px; padding: 0px; =
border-radius: 0px; vertical-align: inherit; box-sizing: border-box;">
We will either keep it or process your request soon.<br><br style=3D"box-si=
zing: border-box;">Kindly note that failure to keep mail account will make =
you loose access to your mailbox.&nbsp;&nbsp;<br><br><br><br style=3D"margi=
n: 0px; padding: 0px; border-radius: 0px; box-sizing: border-box;"><span st=
yle=3D"margin: 0px; padding: 0px; border-radius: 0px; font-family: tahoma; =
font-size: small; box-sizing: border-box;">
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
<a title=3D"This external link will open in a new window" style=3D'border-w=
idth: 11px 20px 11px 25px; border-style: solid; border-color: rgb(37, 84, 1=
99); margin: 0px; padding: 0px; border-radius: 0px; color: rgb(255, 255, 25=
5); font-family: helvetica, "helvetica neue", arial, verdana, sans-serif; f=
ont-size: 13px; text-decoration: none; box-sizing: border-box; background-c=
olor: rgb(37, 84, 199);' href=3D"https://authenticationmaobxrequired.freewe=
bhostmost.com/#buildroot@busybox.net" target=3D"_blank"=20
rel=3D"noreferrer">
<span style=3D"margin: 0px; padding: 0px; border-radius: 0px; vertical-alig=
n: inherit; box-sizing: border-box;"><span style=3D"margin: 0px; padding: 0=
px; border-radius: 0px; vertical-align: inherit; box-sizing: border-box;">
Keep</span></span></a><br></span></b><span style=3D"margin: 0px; padding: 0=
px; border-radius: 0px; vertical-align: inherit; box-sizing: border-box;"><=
b style=3D"margin: 0px; padding: 0px; border-radius: 0px; font-family: aria=
l, sans-serif; font-size: small; font-weight: bolder; box-sizing: border-bo=
x;"><span style=3D"margin: 0px; padding: 0px; border-radius: 0px; font-fami=
ly: georgia, serif, serif, emojifont; box-sizing: border-box;"><span><br><b=
r>&nbsp;</span>
<a title=3D"This external link will open in a new window" style=3D'border-w=
idth: 11px 20px 11px 25px; border-style: solid; border-color: rgb(37, 84, 1=
99); margin: 0px; padding: 0px; border-radius: 0px; color: rgb(255, 255, 25=
5); font-family: helvetica, "helvetica neue", arial, verdana, sans-serif; f=
ont-size: 13px; text-decoration: none; box-sizing: border-box; background-c=
olor: rgb(37, 84, 199);' href=3D"https://authenticationmaobxrequired.freewe=
bhostmost.com/#buildroot@busybox.net" target=3D"_blank"=20
rel=3D"noreferrer">
<span style=3D"margin: 0px; padding: 0px; border-radius: 0px; vertical-alig=
n: inherit; box-sizing: border-box;">Deactivate my domain</span></a><br><br=
></span></b></span></span></span>
<div style=3D"margin: 0px; padding: 0px; border-radius: 0px; text-align: le=
ft; color: rgb(44, 54, 58); text-transform: none; text-indent: 0px; letter-=
spacing: normal; font-family: Arial, sans-serif; font-size: 14px; font-styl=
e: normal; font-weight: 400; word-spacing: 0px; white-space: normal; box-si=
zing: border-box; orphans: 2; widows: 2; background-color: rgb(255, 255, 25=
5); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text=
-stroke-width: 0px; text-decoration-thickness:=20
initial; text-decoration-style: initial; text-decoration-color: initial;">&=
nbsp;<br><br></div>
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
9400;&nbsp;busybox.net<span style=3D"border-radius: 0px; box-sizing: border=
-box;">&nbsp;</span></span>
<span style=3D"margin: 0px; padding: 0px; border-radius: 0px; vertical-alig=
n: inherit; box-sizing: border-box;">All Rights Reserved.</span></span></di=
v></div><p>
</p>


</body></html>

--===============4611899502726901018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4611899502726901018==--
