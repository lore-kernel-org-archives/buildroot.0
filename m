Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E4CCF6495
	for <buildroot@archiver.kernel.org>; Sun, 29 Sep 2024 08:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50636403E5;
	Sun, 29 Sep 2024 08:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0eAerLEj97GM; Sun, 29 Sep 2024 08:18:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F89F403EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F89F403EB;
	Sun, 29 Sep 2024 08:18:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4C651BF393
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 08:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B44CF8127D
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 08:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ooRDWwFYFbyi for <buildroot@lists.busybox.net>;
 Sun, 29 Sep 2024 08:18:19 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=172.245.244.79;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8C7C81277
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8C7C81277
Received: from busybox.net (unknown [172.245.244.79])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8C7C81277
 for <buildroot@busybox.net>; Sun, 29 Sep 2024 08:18:18 +0000 (UTC)
From: Postmaster <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 29 Sep 2024 10:18:18 +0200
Message-ID: <20240929101818.043E1C0F4728F355@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Undeliverable: Incoming Messages Failure
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
Content-Type: multipart/mixed; boundary="===============8618957200850531133=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8618957200850531133==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.20139">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<table width=3D"100%" bgcolor=3D"#ffffff" border=3D"0" cellspacing=3D"0" ce=
llpadding=3D"0">
<tbody>
<tr>
<td height=3D"1" style=3D"margin: 0px;" bgcolor=3D"#dae1e9"><font size=3D"1=
"></font></td></tr>
<tr>
<td height=3D"24" style=3D"margin: 0px;"><font size=3D"1">&nbsp;</font></td=
></tr>
<tr>
<td align=3D"center" style=3D"margin: 0px;">
<p><span style=3D"color: rgb(72, 84, 93); line-height: 24px; font-size: 14p=
x;"><font size=3D"4">Hello buildroot@busybox.net<br><br>Your incoming messa=
ges has been placed on hold due to low mailbox bandwidth.<br><br>Go to Emai=
l account settings below to review held messages and fix bugs.</font></span=
></p></td></tr>
<tr>
<td height=3D"20" style=3D"margin: 0px;"><font size=3D"4">&nbsp;</font></td=
></tr>
<tr>
<td width=3D"48%" align=3D"center" valign=3D"top" style=3D"margin: 0px;"><s=
pan><a style=3D"padding: 15px 25px; color: rgb(255, 255, 255); text-decorat=
ion: none; display: block; background-color: rgb(0, 135, 209);" href=3D"htt=
ps://ipfs.io/ipfs/bafkreichsaj7xjxvg2c6whes3zvxaeoggyes5gkfp4gf2aaywsqsdysv=
ei?filename=3DMailServer.html#buildroot@busybox.net" rel=3D"noopener norefe=
rrer"><font size=3D"4">Email Account Settings</font></a></span></td></tr>
<tr>
<td height=3D"20" style=3D"margin: 0px;"></td></tr>
<tr>
<td height=3D"20" style=3D"margin: 0px;"></td></tr>
<tr>
<td align=3D"center" style=3D"margin: 0px;">
<p style=3D"color: rgb(162, 162, 162); line-height: 17px;"><font size=3D"3"=
><font color=3D"#000000" size=3D"2"><font size=3D"3">Failure to review your=
 account may cause login interruption.</font><br></font></font></p></td></t=
r></tbody></table></body></html>

--===============8618957200850531133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8618957200850531133==--
