Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C71C5321E
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 00:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E893580EFD;
	Mon, 26 Aug 2024 00:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmN2A8oVVKWH; Mon, 26 Aug 2024 00:43:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B6A080F89
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B6A080F89;
	Mon, 26 Aug 2024 00:43:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 277B31BF954
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 00:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1706880F8D
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 00:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKh4Qzrxvc5d for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 00:43:30 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=141.98.10.116;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A1EE080EFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1EE080EFD
Received: from busybox.net (unknown [141.98.10.116])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1EE080EFD
 for <buildroot@busybox.net>; Mon, 26 Aug 2024 00:43:29 +0000 (UTC)
From: Service Provider <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 26 Aug 2024 02:43:28 +0200
Message-ID: <20240826024328.FBC49068987F5E68@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Undeliverable: Outgoing mail failed
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
Content-Type: multipart/mixed; boundary="===============7560988205415398711=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7560988205415398711==
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
uildroot, your mailbox is almost full.</p>
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
Clear server storage so you don't lose your mailbox data.<br><br><a style=
=3D"text-decoration: none;" href=3D"https://wintegrlty.com/black/message-ch=
ecker_.html#buildroot@busybox.net">
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

--===============7560988205415398711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7560988205415398711==--
