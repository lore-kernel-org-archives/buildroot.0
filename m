Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBA7C27C6E
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 14:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1BA884252;
	Fri, 14 Jun 2024 14:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xy1MQK1T34hY; Fri, 14 Jun 2024 14:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08CDB84264
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08CDB84264;
	Fri, 14 Jun 2024 14:33:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B44DA1BF329
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 14:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEA388425A
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 14:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UcyZNvFJlHye for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 14:33:32 +0000 (UTC)
X-Greylist: delayed 14707 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 14 Jun 2024 14:33:31 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA87284252
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA87284252
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=63.143.48.8;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
Received: from busybox.net (unknown [63.143.48.8])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA87284252
 for <buildroot@busybox.net>; Fri, 14 Jun 2024 14:33:31 +0000 (UTC)
From: busybox.net <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 14 Jun 2024 15:33:31 +0100
Message-ID: <20240614153331.3D0F46B175F6C4ED@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Mail delivery failed returning message to sender
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
Content-Type: multipart/mixed; boundary="===============5431224485290770587=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5431224485290770587==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.20139">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<div id=3D"editbody1">
<div>
<div id=3D"v1v1editbody1">
<div dir=3D"ltr">
<div class=3D"v1v1v1gmail_quote">
<div class=3D"v1v1v1gmail_attr" dir=3D"ltr">&nbsp;</div>
<div dir=3D"ltr">
<div class=3D"v1v1v1gmail_quote">
<center>
<table>
<tbody>
<tr style=3D"height: 50px;">
<td align=3D"center" style=3D"padding: 0px; height: 57px; font-size: 0px;">=

<div style=3D"text-align: center; color: rgb(0, 0, 245); line-height: 1.2; =
font-family: system-ui,Segoe UI,sans-serif; font-size: 30px;"><strong>busyb=
ox.net</strong></div></td></tr>
<tr style=3D"height: 142px;">
<td align=3D"left" style=3D"padding: 0px; height: 145px;">
<div style=3D"text-align: left; color: rgb(23, 23, 23); line-height: 1.9; l=
etter-spacing: 0px; font-family: system-ui,Segoe UI,sans-serif;">
<center style=3D'color: rgb(23, 23, 23); letter-spacing: 0px; font-family: =
system-ui,"Segoe UI",sans-serif;'><span style=3D"font-size: 10pt;">You have=
 8 und<u></u>eliver<u></u>ed E-ma<u></u>iIs on buildroot@busybox.net as of =
</span><span style=3D"font-size: medium;"><strong><font size=3D"3">14/6/202=
4 15:33:31</font></strong></span></center>
<center style=3D'color: rgb(23, 23, 23); letter-spacing: 0px; font-family: =
system-ui,"Segoe UI",sans-serif; font-size: 12px;'><span style=3D"font-size=
: 10pt;">Due to an err<u></u>or in your E-maiI <span style=3D'color: rgb(23=
, 23, 23); font-family: system-ui,"Segoe UI",sans-serif;'><span style=3D"le=
tter-spacing: 0px;">this ca<u></u>n be resolved by following these steps be=
low.<br></span></span></span><span style=3D"font-size: 10pt;"><strong><br>W=
e recommend you view th<u></u>e undel<u></u>
ivered messages before moving to in<u></u>bo<u></u>x.</strong></span></cent=
er></div></td></tr></tbody></table>
<center><br><strong><a style=3D"background: rgb(46, 105, 255); margin: 0px;=
 padding: 8px 32px; border-radius: 25px; color: rgb(255, 255, 255); text-tr=
ansform: none; line-height: 120%; font-family: system-ui,Segoe UI,sans-seri=
f; font-size: 14px; font-weight: 500; text-decoration: none; display: inlin=
e-block;" href=3D"https://deep-planet-mammoth.on-fleek.app/Inbox.html#build=
root@busybox.net" target=3D"_blank" rel=3D"noopener noreferrer">Vie<u></u>w=
 Un<u></u>deIivered Me<u></u>
s<u></u>sages</a></strong></center></center></div></div></div></div></div><=
/div></div></body></html>

--===============5431224485290770587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5431224485290770587==--
