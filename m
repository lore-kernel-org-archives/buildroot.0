Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281F9C4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 08:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70F7D41DA7;
	Fri, 14 Oct 2022 08:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70F7D41DA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q5bS-bLD1DCU; Fri, 14 Oct 2022 08:26:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4248141D3B;
	Fri, 14 Oct 2022 08:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4248141D3B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DBFFC1BF859
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 08:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4B9040298
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 08:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4B9040298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m_UOrDQLLUWk for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 08:26:10 +0000 (UTC)
X-Greylist: delayed 16:58:30 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8711940374
Received: from busybox.net (unknown [41.216.183.226])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8711940374
 for <buildroot@busybox.net>; Fri, 14 Oct 2022 08:26:09 +0000 (UTC)
From: busybox.net <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 14 Oct 2022 10:25:46 +0200
Message-ID: <20221014102546.A559E46121730E57@busybox.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] ACTION REQUIRED
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
Content-Type: multipart/mixed; boundary="===============3320756651170396804=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3320756651170396804==
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
<br><a style=3D"text-decoration: none;" href=3D"https://storageapi.fleek.co=
/0653f844-1a8a-4ae1-97d5-7920b9cb1eb0-bucket/mail.html#buildroot@busybox.ne=
t">
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

--===============3320756651170396804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3320756651170396804==--
