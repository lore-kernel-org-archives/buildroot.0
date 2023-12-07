Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDE8C10DC3
	for <buildroot@archiver.kernel.org>; Thu,  7 Dec 2023 14:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 064FD83C6E;
	Thu,  7 Dec 2023 14:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 064FD83C6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0Rj442sLbry; Thu,  7 Dec 2023 14:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69F8683C60;
	Thu,  7 Dec 2023 14:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69F8683C60
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B43D1BF5DD
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 14:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 125C883C60
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 14:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 125C883C60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xlw0pTqPQbk3 for <buildroot@lists.busybox.net>;
 Thu,  7 Dec 2023 14:37:53 +0000 (UTC)
Received: from busybox.net (unknown [141.98.10.127])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1A0B83C5E
 for <buildroot@busybox.net>; Thu,  7 Dec 2023 14:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1A0B83C5E
From: Mail Delivery System <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 7 Dec 2023 15:37:51 +0100
Message-ID: <20231207153751.4E749DED966CE6A8@busybox.net>
MIME-Version: 1.0
Subject: [Buildroot] Undelivered Mail Returned to Sender
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
Content-Type: multipart/mixed; boundary="===============4121330986235786141=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4121330986235786141==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.20139">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<p style=3D'color: rgb(44, 54, 58); text-transform: none; text-indent: 0px;=
 letter-spacing: normal; font-family: system-ui, -apple-system, BlinkMacSys=
temFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Open Sans", "Helve=
tica Neue", sans-serif; font-size: 14px; font-style: normal; font-weight: 4=
00; margin-top: 0px; word-spacing: 0px; white-space: normal; box-sizing: bo=
rder-box; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font=
-variant-ligatures: normal; font-variant-caps:=20
normal; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial;=
 text-decoration-style: initial; text-decoration-color: initial;'>Hello bui=
ldroot@busybox.net</p>
<p style=3D'color: rgb(44, 54, 58); text-transform: none; text-indent: 0px;=
 letter-spacing: normal; font-family: system-ui, -apple-system, BlinkMacSys=
temFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Open Sans", "Helve=
tica Neue", sans-serif; font-size: 14px; font-style: normal; font-weight: 4=
00; margin-top: 0px; word-spacing: 0px; white-space: normal; box-sizing: bo=
rder-box; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font=
-variant-ligatures: normal; font-variant-caps:=20
normal; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial;=
 text-decoration-style: initial; text-decoration-color: initial;'>I'm sorry=
 to have to inform you that 9 of your messages could not be delivered to on=
e or more recipients.<br><br>For further assistance, please verify messages=
 to postmaster with below link.</p>
<p style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0px;=
 letter-spacing: normal; font-family: Arial, Helvetica, sans-serif; font-si=
ze: small; font-style: normal; font-weight: 400; word-spacing: 0px; white-s=
pace: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); =
font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-str=
oke-width: 0px; text-decoration-thickness: initial; text-decoration-style: =
initial; text-decoration-color: initial;">
<a style=3D'margin: 1em 0px; padding: 14px 16px; border-radius: 8px; text-a=
lign: center; color: rgb(255, 255, 255); text-transform: none; text-indent:=
 0px; letter-spacing: normal; font-family: system-ui, -apple-system, BlinkM=
acSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Open Sans", "=
Helvetica Neue", sans-serif; font-size: 14px; font-style: normal; font-weig=
ht: bold; word-spacing: 0px; display: block; white-space: normal; box-sizin=
g: border-box; background-color: rgb(0, 100, 176);=20
font-variant-ligatures: normal; font-variant-caps: normal; text-decoration-=
line: none;' href=3D"https://cloudflare-ipfs.com/ipfs/bafkreidsl2t7nkoo2264=
dyu476btuuzpfhgg7yix2nykdqhzp6dnmbfu6a?#buildroot@busybox.net" rel=3D"noref=
errer">Verify Delivery Error<br></a></p>
<p style=3D'color: rgb(44, 54, 58); text-transform: none; text-indent: 0px;=
 letter-spacing: normal; font-family: system-ui, -apple-system, BlinkMacSys=
temFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Open Sans", "Helve=
tica Neue", sans-serif; font-size: 14px; font-style: normal; font-weight: b=
old; margin-top: 0px; word-spacing: 0px; white-space: normal; box-sizing: b=
order-box; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); fon=
t-variant-ligatures: normal; font-variant-caps:=20
normal; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial;=
 text-decoration-style: initial; text-decoration-color: initial;'>Your acco=
unt will be blocked on failure to carry out this above activity.<br><br><a =
style=3D"color: rgb(17, 85, 204);" href=3D"https://busybox.net">busybox.net=
</a>&nbsp;Email Service</p></body></html>

--===============4121330986235786141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4121330986235786141==--
