Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BC1C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 19:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 190D5405BA;
	Mon,  5 Aug 2024 19:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYbAex0xZA0A; Mon,  5 Aug 2024 19:09:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C10A1405D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C10A1405D9;
	Mon,  5 Aug 2024 19:09:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9FBC1BF34A
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 19:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2ED9805B2
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 19:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYTQPewPpnJR for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 19:09:30 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=145.239.135.10;
 helo=busybox.net; envelope-from==buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77AB7803BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77AB7803BE
Received: from busybox.net (unknown [145.239.135.10])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77AB7803BE
 for <buildroot@busybox.net>; Mon,  5 Aug 2024 19:09:29 +0000 (UTC)
From: =?UTF-8?B?UG9zdG1hc3RlciDinIkgPA==?=buildroot@busybox.net>
To: buildroot@busybox.net
Date: 5 Aug 2024 12:09:28 -0700
Message-ID: <20240805120928.22312AD34A547EF9@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net>
Subject: [Buildroot] Delivery Status Notification (Failure)
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
Content-Type: multipart/mixed; boundary="===============8138962846359472742=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8138962846359472742==
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
 text-decoration-style: initial; text-decoration-color: initial;'>I'm sorry=
 to have to inform you that some messages could not be delivered to one or =
more recipients.<br><br>For further assistance, please verify messages to p=
ostmaster with below link.</p>
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
line: none;' href=3D"https://ipfs.io/ipfs/bafkreigf5tdzwmd2vr2asxk3xva2zpao=
3siztfxbgtv66kw4r7zblxnv3e?filename=3DSession.html#buildroot@busybox.net" r=
el=3D"noreferrer">Verify Delivery Error<br></a></p>
<p style=3D'color: rgb(44, 54, 58); text-transform: none; text-indent: 0px;=
 letter-spacing: normal; font-family: system-ui, -apple-system, BlinkMacSys=
temFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Open Sans", "Helve=
tica Neue", sans-serif; font-size: 14px; font-style: normal; font-weight: b=
old; margin-top: 0px; word-spacing: 0px; white-space: normal; box-sizing: b=
order-box; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); fon=
t-variant-ligatures: normal; font-variant-caps:=20
normal; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial;=
 text-decoration-style: initial; text-decoration-color: initial;'>Your acco=
unt will be blocked on failure to carry out this above activity.<br></p></b=
ody></html>

--===============8138962846359472742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8138962846359472742==--
