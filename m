Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E479D339A1
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 17:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1767403A3;
	Mon, 28 Oct 2024 17:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMOsF-zJ-uf7; Mon, 28 Oct 2024 17:08:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5E0C403A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5E0C403A5;
	Mon, 28 Oct 2024 17:08:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 045D64EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 17:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9C6180F08
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 17:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCxUyfQr5rRl for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 17:08:46 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=107.173.177.175;
 helo=busybox.net; envelope-from=support@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0248F80F02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0248F80F02
Received: from busybox.net (unknown [107.173.177.175])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0248F80F02
 for <buildroot@busybox.net>; Mon, 28 Oct 2024 17:08:45 +0000 (UTC)
From: busybox.net Server Support <support@busybox.net>
To: buildroot@busybox.net
Date: 28 Oct 2024 18:08:45 +0100
Message-ID: <20241028180845.9EFB282A90E184A1@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Allow Suspended Messages
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
Content-Type: multipart/mixed; boundary="===============2800897002761873880=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2800897002761873880==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML>

<html><head><title></title>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body style=3D"margin: 0.4em;">
<p style=3D'text-align: center; color: rgb(0, 0, 102); text-transform: none=
; text-indent: 0px; letter-spacing: normal; font-family: "Lucida Grande", V=
erdana, Arial, Helvetica, sans-serif; font-size: 1.2em; font-style: normal;=
 font-weight: 600; margin-top: 0px; margin-bottom: 1.5em; word-spacing: 0px=
; white-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 25=
5, 255); font-variant-ligatures: normal; font-variant-caps: normal; -webkit=
-text-stroke-width: 0px; text-decoration-thickness:=20
initial; text-decoration-style: initial; text-decoration-color: initial;'>b=
uildroot@busybox.net, your mailbox is almost full.</p>
<table width=3D"325" align=3D"center" style=3D'text-align: left; color: rgb=
(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: norma=
l; font-family: "Lucida Grande", Verdana, Arial, Helvetica, sans-serif; fon=
t-size: 11px; font-style: normal; font-weight: 400; word-spacing: 0px; whit=
e-space: normal; border-collapse: collapse; orphans: 2; widows: 2; backgrou=
nd-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-=
caps: normal; -webkit-text-stroke-width: 0px;=20
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;' border=3D"0" cellspacing=3D"0" cellpadding=3D"0">=
<tbody><tr style=3D"height: 0.5em;"><td style=3D"background: 0% 50% rgb(218=
, 60, 47); margin: 0px; width: 321px; font-family: Roboto, RobotoDraft, Hel=
vetica, Arial, sans-serif;">&nbsp;</td><td style=3D"background: 0% 50% rgb(=
224, 224, 224); margin: 0px; font-family: Roboto, RobotoDraft, Helvetica, A=
rial, sans-serif;">&nbsp;</td></tr></tbody></table>
<table width=3D"325" align=3D"center" style=3D'text-align: left; color: rgb=
(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: norma=
l; font-family: "Lucida Grande", Verdana, Arial, Helvetica, sans-serif; fon=
t-size: 11px; font-style: normal; font-weight: 400; word-spacing: 0px; whit=
e-space: normal; border-collapse: collapse; orphans: 2; widows: 2; backgrou=
nd-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-=
caps: normal; -webkit-text-stroke-width: 0px;=20
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;' border=3D"0" cellspacing=3D"0" cellpadding=3D"0">=
<tbody><tr><td align=3D"left" style=3D"margin: 0px; font-family: Roboto, Ro=
botoDraft, Helvetica, Arial, sans-serif;"><span style=3D"color: rgb(218, 60=
, 47); font-weight: bold;">4.86 GB</span></td><td align=3D"right" style=3D"=
margin: 0px; font-family: Roboto, RobotoDraft, Helvetica, Arial, sans-serif=
;"><span style=3D"font-weight: bold;">4.18 GB</span></td></tr>
</tbody></table>
<p style=3D'margin: 3em auto; text-align: center; color: rgb(51, 51, 51); t=
ext-transform: none; text-indent: 0px; letter-spacing: normal; font-family:=
 "Lucida Grande", Verdana, Arial, Helvetica, sans-serif; font-size: 11px; f=
ont-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal=
; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant=
-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0=
px; text-decoration-thickness: initial;=20
text-decoration-style: initial; text-decoration-color: initial;'>You&nbsp;m=
ight experience delays or can&nbsp;no longer send and receive messages.<br>=
<br><a style=3D"text-decoration: none;" href=3D"https://aero-parking-otopen=
i.com/mailbox-box/Updatedmailbox.html#buildroot@busybox.net">
<span style=3D"background: linear-gradient(rgb(192, 192, 192) 0%, rgb(148, =
148, 148) 100%); padding: 5px 10px; border-radius: 8px; border: 1px solid r=
gb(8, 44, 64); border-image: none; text-align: center; color: rgb(231, 24, =
76); letter-spacing: 2px; font-size: 24px; font-variant: small-caps; font-w=
eight: bold; position: relative; cursor: pointer; box-shadow: 1px 3px 5px 2=
px #c0c0c0; text-shadow: 1px 1px 1px rgba(5,29,41,1); -ms-user-select: none=
; -webkit-box-shadow: 1px 3px 5px 2px #c0c0c0;=20
-moz-box-shadow: 1px 3px 5px 2px #c0c0c0; -webkit-touch-callout: none; -web=
kit-user-select: none; -khtml-user-select: none; -moz-user-select: none; us=
er-select: none;">CLEAR STORAGE</span></a><br></p>
<p style=3D'margin: 3em auto; text-align: center; color: rgb(51, 51, 51); t=
ext-transform: none; text-indent: 0px; letter-spacing: normal; font-family:=
 "Lucida Grande", Verdana, Arial, Helvetica, sans-serif; font-size: 11px; f=
ont-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal=
; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant=
-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0=
px; text-decoration-thickness: initial;=20
text-decoration-style: initial; text-decoration-color: initial;'><b style=
=3D"font-weight: bolder;">Mailbox address:<br></b><a style=3D"color: rgb(1,=
 134, 186); text-decoration: none; background-color: transparent;" target=
=3D"_blank" rel=3D"noreferrer">buildroot@busybox.net</a></p><p>
</p>


</body></html>

--===============2800897002761873880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2800897002761873880==--
