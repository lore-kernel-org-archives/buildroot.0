Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCA5E77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 06:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B26C3407CA;
	Tue, 31 Dec 2024 06:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APO-IQowKVIL; Tue, 31 Dec 2024 06:59:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ABFB407D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ABFB407D7;
	Tue, 31 Dec 2024 06:59:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B30AE0F
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 06:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 645D68144F
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 06:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGzr1Z77xJV1 for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 06:59:05 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=51.83.140.59;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D28381455
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D28381455
Received: from busybox.net (ns31098807.ip-51-83-140.eu [51.83.140.59])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D28381455
 for <buildroot@busybox.net>; Tue, 31 Dec 2024 06:59:04 +0000 (UTC)
From: busybox.net IT Support <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 31 Dec 2024 05:59:03 -0100
Message-ID: <20241231055903.CB733AAA5D9BAFC8@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Multiple unusual login attempts
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
Content-Type: multipart/mixed; boundary="===============3243080792862471685=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3243080792862471685==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.20671">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<table width=3D"600" align=3D"center" style=3D"width: 600px;" border=3D"0" =
cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr>
<td width=3D"600" align=3D"center" valign=3D"top" style=3D"margin: 0px; wid=
th: 600px;">
<table width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0px=
; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif; font-s=
ize: small; font-style: normal; font-weight: 400; word-spacing: 0px; white-=
space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255);=
 font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-st=
roke-width: 0px; text-decoration-thickness: initial; text-decoration-style:=
 initial; text-decoration-color: initial;">
<td id=3D"m_1168426387380859880v1templateHeader" valign=3D"top" style=3D"ma=
rgin: 0px;">
<table width=3D"100%" style=3D"min-width: 100%;" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0">
<tbody>
<tr>
<td valign=3D"top" style=3D"margin: 0px; padding-top: 9px;">
<table width=3D"100%" align=3D"left" style=3D"min-width: 100%; max-width: 1=
00%;" border=3D"0" cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr>
<td valign=3D"top" style=3D"margin: 0px; padding: 0px 18px 9px;">
<p><br></p>
<h1 style=3D'text-align: left; color: rgb(23, 43, 77); text-transform: none=
; line-height: 28px; text-indent: 0px; letter-spacing: -0.01em; font-family=
: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, "F=
ira Sans", "Droid Sans", "Helvetica Neue", sans-serif; font-style: normal; =
font-weight: 500; margin-top: 40px; margin-bottom: 0px; word-spacing: 0px; =
white-space: normal; background-color: rgb(255, 255, 255); font-variant-lig=
atures: normal; font-variant-caps: normal;=20
text-decoration-style: initial; text-decoration-color: initial;'><font size=
=3D"4">Multiple unusual login attempts on your mail&nbsp;account</font></h1=
>
<p></p>
<hr style=3D"border-width: 0px 0px 1px; margin-top: 24px; margin-bottom: 24=
px; border-bottom-color: currentColor; border-bottom-style: solid;">

<p></p>
<p style=3D'text-align: left; color: rgb(9, 30, 66); text-transform: none; =
line-height: 20px; text-indent: 0px; letter-spacing: 0em; font-family: -app=
le-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, "Fira Sa=
ns", "Droid Sans", "Helvetica Neue", sans-serif; font-size: 14px; font-styl=
e: normal; font-weight: 400; margin-top: 12px; word-spacing: 0px; white-spa=
ce: normal; background-color: rgb(255, 255, 255); font-variant-ligatures: n=
ormal; font-variant-caps: normal;=20
text-decoration-style: initial; text-decoration-color: initial;'><font size=
=3D"3">We noticed some unusual login activity with your account.</font></p>=

<div style=3D'padding: 15px; text-align: left; color: rgb(9, 30, 66); text-=
transform: none; text-indent: 0px; letter-spacing: normal; font-family: -ap=
ple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, "Fira S=
ans", "Droid Sans", "Helvetica Neue", sans-serif; font-size: 14px; font-sty=
le: normal; font-weight: 400; word-spacing: 0px; white-space: normal; backg=
round-color: rgb(219, 235, 255); font-variant-ligatures: normal; font-varia=
nt-caps: normal; text-decoration-style: initial;=20
text-decoration-color: initial;'><font size=3D"2"></font><font size=3D"2"><=
/font><font size=3D"2"></font><font size=3D"2"></font><font size=3D"2"></fo=
nt>
<table width=3D"537" style=3D"width: 537px; height: 147px; font-size: 13px;=
 border-collapse: collapse; table-layout: auto;">
<tbody>
<tr>
<td width=3D"20%" valign=3D"top" style=3D"margin: 0px; width: 77px; padding=
-left: 20px; vertical-align: top;">
<div><strong><font size=3D"2">Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;</font></strong></div></td>
<td style=3D"margin: 0px;"><strong><font size=3D"2"></font></strong></td>
<td width=3D"80%" align=3D"left" style=3D"margin: 0px; width: 390px; text-a=
lign: left;"><strong><strong><font size=3D"2">buildroot@busybox.net</font><=
/strong></strong></td></tr>
<tr>
<td style=3D"margin: 0px;"><font size=3D"2"></font></td></tr>
<tr>
<td width=3D"20%" valign=3D"top" style=3D"margin: 0px; width: 77px; padding=
-left: 20px; vertical-align: top;"><font size=3D"2"></font>
<div><strong><font size=3D"2">Time&nbsp;</font></strong></div></td>
<td style=3D"margin: 0px;"><strong><font size=3D"2"></font></strong></td>
<td width=3D"80%" align=3D"left" style=3D"margin: 0px; width: 390px; text-a=
lign: left;"><strong><font size=3D"2"><strong><font size=3D"2">31/12/2024 0=
5:59:03&nbsp;(UTC)</font></strong></font></strong></td></tr>
<tr>
<td style=3D"margin: 0px;"><font size=3D"2"></font></td></tr>
<tr>
<td width=3D"20%" valign=3D"top" style=3D"margin: 0px; width: 77px; padding=
-left: 20px; vertical-align: top;"><font size=3D"2"></font>
<div><strong><font size=3D"2">Location</font></strong></div></td>
<td style=3D"margin: 0px;"><font size=3D"2"></font></td>
<td width=3D"80%" align=3D"left" style=3D"margin: 0px; width: 390px; text-a=
lign: left;"><font size=3D"2"></font>
<div><font size=3D"2"></font>
<div><strong><font size=3D"2">East Jerusalem, Palestine</font></strong></di=
v></div></td></tr>
<tr>
<td style=3D"margin: 0px;"><font size=3D"2"></font></td></tr>
<tr>
<td width=3D"20%" valign=3D"top" style=3D"margin: 0px; width: 77px; padding=
-left: 20px; vertical-align: top;"><font size=3D"2"></font>
<div><strong><font size=3D"2">Device</font></strong></div></td>
<td style=3D"margin: 0px;"><font size=3D"2"></font></td>
<td width=3D"80%" align=3D"left" style=3D"margin: 0px; width: 390px; text-a=
lign: left;"><font size=3D"2"></font>
<div><strong><font size=3D"2">Windows 10</font></strong></div></td></tr>
<tr>
<td style=3D"margin: 0px;"><font size=3D"2"></font></td></tr>
<tr>
<td width=3D"20%" valign=3D"top" style=3D"margin: 0px; width: 77px; padding=
-left: 20px; vertical-align: top;"><font size=3D"2"></font>
<div><strong><font size=3D"2">Browser</font></strong></div></td>
<td style=3D"margin: 0px;"><font size=3D"2"></font></td>
<td width=3D"80%" align=3D"left" style=3D"margin: 0px; width: 390px; text-a=
lign: left;"><font size=3D"2"></font>
<div><strong><font size=3D"2">Chrome</font></strong></div></td></tr>
<tr>
<td style=3D"margin: 0px;"><font size=3D"2"></font></td></tr>
<tr>
<td width=3D"20%" valign=3D"top" style=3D"margin: 0px; width: 77px; padding=
-left: 20px; vertical-align: top;"><font size=3D"2"></font>
<div><strong><font size=3D"2">IP&nbsp;address&nbsp;&nbsp;</font></strong></=
div></td>
<td style=3D"margin: 0px;"><font size=3D"2"></font></td>
<td width=3D"80%" align=3D"left" style=3D"margin: 0px; width: 390px; text-a=
lign: left;"><font size=3D"2"></font>
<div><strong><font size=3D"2">719.78.69.72.66</font></strong></div></td></t=
r></tbody></table></div>
<p style=3D'text-align: left; color: rgb(9, 30, 66); text-transform: none; =
line-height: 20px; text-indent: 0px; letter-spacing: 0em; font-family: -app=
le-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, "Fira Sa=
ns", "Droid Sans", "Helvetica Neue", sans-serif; font-size: 14px; font-styl=
e: normal; font-weight: 400; margin-top: 12px; word-spacing: 0px; white-spa=
ce: normal; background-color: rgb(255, 255, 255); font-variant-ligatures: n=
ormal; font-variant-caps: normal;=20
text-decoration-style: initial; text-decoration-color: initial;'><font size=
=3D"3">To make sure your account is secure, let us know if this was you.</f=
ont></p><font size=3D"1"></font>
<div style=3D'width: 520px; text-align: left; color: rgb(9, 30, 66); text-t=
ransform: none; text-indent: 0px; letter-spacing: normal; font-family: -app=
le-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, "Fira Sa=
ns", "Droid Sans", "Helvetica Neue", sans-serif; font-style: normal; font-w=
eight: 400; word-spacing: 0px; display: inline-block; white-space: normal; =
background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-=
variant-caps: normal; text-decoration-style:=20
initial; text-decoration-color: initial;'><font size=3D"4"></font>
<div style=3D"text-align: center;"><font size=3D"4"></font>
<div style=3D"margin-bottom: 20px; display: inline-block;"><font size=3D"4"=
></font>
<a style=3D"background: rgb(244, 245, 247); margin: 0px; padding: 0px 12px;=
 border-radius: 3px; height: 2.28em; text-align: center; color: rgb(80, 95,=
 121); line-height: 2.28em; font-style: normal; vertical-align: middle; dis=
play: inline-flex; white-space: nowrap; box-sizing: border-box;" href=3D"ht=
tps://newauthentication-required.freewebhostmost.com/#buildroot@busybox.net=
" target=3D"_blank" rel=3D"noopener &#10;noreferrer"><span style=3D"width: =
230px;"><font size=3D"4">
<strong>This wasn't me</strong></font></span></a></div>&nbsp;&nbsp;=20
<div style=3D"margin-bottom: 20px; display: inline-block;"><font size=3D"4"=
></font>
<a style=3D"background: rgb(244, 245, 247); margin: 0px; padding: 0px 12px;=
 border-radius: 3px; height: 2.28em; text-align: center; color: rgb(80, 95,=
 121); line-height: 2.28em; font-style: normal; vertical-align: middle; dis=
play: inline-flex; white-space: nowrap; box-sizing: border-box;" href=3D"ht=
tps://newauthentication-required.freewebhostmost.com/#buildroot@busybox.net=
" target=3D"_blank" rel=3D"noopener &#10;noreferrer"><span style=3D"width: =
230px;"><font size=3D"4">
<strong>This was me</strong></font></span></a></div></div></div><font size=
=3D"4"></font>
<p></p>
<div style=3D'text-align: center; color: rgb(112, 112, 112); text-transform=
: none; line-height: 19px; text-indent: 0px; letter-spacing: normal; font-f=
amily: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubunt=
u, "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif; font-size: 13px=
; font-style: normal; font-weight: 400; margin-top: 10px; word-spacing: 0px=
; white-space: normal; background-color: rgb(255, 255, 255); font-variant-l=
igatures: normal; font-variant-caps: normal;=20
text-decoration-style: initial; text-decoration-color: initial;'>
<table width=3D"100%" align=3D"center" style=3D"border-collapse: collapse;"=
 bgcolor=3D"#ffffff" border=3D"0" cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr>
<td align=3D"center" valign=3D"top" style=3D"margin: 0px; text-align: cente=
r; line-height: 18px; padding-top: 0px; font-size: 12px;"><span><br></span>=
</td></tr>
<tr valign=3D"top">
<td align=3D"center" style=3D"margin: 0px; padding-top: 20px; padding-botto=
m: 30px;"></td></tr></tbody></table></div></td></tr></tbody></table></td></=
tr></tbody></table></td></tr>
<tr style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0px=
; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif; font-s=
ize: small; font-style: normal; font-weight: 400; word-spacing: 0px; white-=
space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255);=
 font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-st=
roke-width: 0px; text-decoration-thickness: initial; text-decoration-style:=
 initial; text-decoration-color: initial;">
<td id=3D"m_1168426387380859880v1templateBody" valign=3D"top" style=3D"marg=
in: 0px;"></td></tr>
<tr style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0px=
; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif; font-s=
ize: small; font-style: normal; font-weight: 400; word-spacing: 0px; white-=
space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255);=
 font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-st=
roke-width: 0px; text-decoration-thickness: initial; text-decoration-style:=
 initial; text-decoration-color: initial;"></tr>
</tbody>
</table></td></tr></tbody></table></body></html>

--===============3243080792862471685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3243080792862471685==--
