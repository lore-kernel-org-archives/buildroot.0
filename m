Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1CFC52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 11:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFBDB80E2A;
	Sun, 18 Aug 2024 11:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_Ti0OjS536Q; Sun, 18 Aug 2024 11:28:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B41580EB3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B41580EB3;
	Sun, 18 Aug 2024 11:28:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD6031BF419
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 11:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C607D80E2A
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 11:28:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89zwa8-asUh8 for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 11:28:32 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=23.95.206.166;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C00D580EB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C00D580EB4
Received: from busybox.net (unknown [23.95.206.166])
 by smtp1.osuosl.org (Postfix) with ESMTP id C00D580EB4
 for <buildroot@busybox.net>; Sun, 18 Aug 2024 11:28:31 +0000 (UTC)
From: Mail Delivery Subsystem <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 18 Aug 2024 13:28:31 +0200
Message-ID: <20240818132831.DDF868585CD3F259@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Undeliverable: Notification of pending messages.
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
Content-Type: multipart/mixed; boundary="===============8463320671697836605=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8463320671697836605==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.20139">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<div style=3D"text-align: left; color: rgb(44, 54, 58); text-transform: non=
e; text-indent: 0px; letter-spacing: normal; font-family: Roboto, sans-seri=
f; font-size: 14px; font-style: normal; font-weight: 400; word-spacing: 0px=
; white-space: normal; box-sizing: border-box; background-color: rgb(244, 2=
48, 245); font-variant-ligatures: normal; font-variant-caps: normal; text-d=
ecoration-style: initial; text-decoration-color: initial;">
<div style=3D"width: 591px; padding-top: 5px; padding-right: 5px; padding-b=
ottom: 5px; margin-left: 18px; float: left; box-sizing: border-box;">
<div style=3D'font-family: wf_segoe-ui_normal, "Segoe UI", "Segoe WP", Taho=
ma, Arial, sans-serif; font-size: 13px; box-sizing: border-box; background-=
color: rgb(244, 248, 245);'><span style=3D"box-sizing: border-box;"><font s=
ize=3D"2" style=3D"box-sizing: border-box;">
Message generated from&nbsp;busybox.net<span>&nbsp;</span>source.</font></s=
pan></div></div>
<div style=3D"box-sizing: border-box;">
<div style=3D"width: 5px; height: 30px; box-sizing: border-box; background-=
color: rgb(86, 166, 89);"></div></div></div>
<div style=3D"text-align: left; color: rgb(44, 54, 58); text-transform: non=
e; text-indent: 0px; letter-spacing: normal; font-family: Roboto, sans-seri=
f; font-size: 14px; font-style: normal; font-weight: 400; word-spacing: 0px=
; white-space: normal; box-sizing: border-box; background-color: rgb(255, 2=
55, 255); font-variant-ligatures: normal; font-variant-caps: normal; text-d=
ecoration-style: initial; text-decoration-color: initial;">&nbsp;</div>
<div style=3D"text-align: left; color: rgb(44, 54, 58); text-transform: non=
e; text-indent: 0px; letter-spacing: normal; font-family: Roboto, sans-seri=
f; font-size: 14px; font-style: normal; font-weight: 400; word-spacing: 0px=
; white-space: normal; box-sizing: border-box; background-color: rgb(255, 2=
55, 255); font-variant-ligatures: normal; font-variant-caps: normal; text-d=
ecoration-style: initial; text-decoration-color: initial;">&nbsp;</div>
<table style=3D"width: 629px; text-align: left; color: rgb(44, 54, 58); tex=
t-transform: none; letter-spacing: normal; font-family: calibri; font-size:=
 16px; font-style: normal; font-weight: 400; word-spacing: 0px; white-space=
: normal; border-collapse: collapse; box-sizing: border-box; background-col=
or: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: =
normal; text-decoration-style: initial; text-decoration-color: initial;" bo=
rder=3D"0">
<tbody style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;">
<td align=3D"left" style=3D"margin: 0px; box-sizing: border-box;">
<table style=3D"width: 627px; border-collapse: collapse; min-width: 600px; =
box-sizing: border-box;" border=3D"0" cellspacing=3D"0" cellpadding=3D"0">
<tbody style=3D"box-sizing: border-box;">
<tr align=3D"center" style=3D"box-sizing: border-box;">
<td style=3D"margin: 0px; box-sizing: border-box;">
<table style=3D"border-collapse: collapse; max-width: 600px; box-sizing: bo=
rder-box;" border=3D"0" cellspacing=3D"0" cellpadding=3D"0">
<tbody style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;">
<td style=3D"margin: 0px; box-sizing: border-box;">
<table style=3D"width: 513px; border-collapse: collapse; box-sizing: border=
-box;" border=3D"0" cellspacing=3D"0" cellpadding=3D"0">
<tbody></tbody></table></td></tr>
<tr style=3D"box-sizing: border-box;">
<td style=3D"margin: 0px; box-sizing: border-box;">
<div style=3D"padding: 22px 25px 30px; text-align: center; font-family: Rob=
oto-Regular, Helvetica, Arial, sans-serif; font-size: 25px; border-bottom-c=
olor: rgb(201, 201, 201); border-bottom-width: thin; border-bottom-style: s=
olid; box-sizing: border-box;">Incoming Mail Delivery Failure<br style=3D"b=
ox-sizing: border-box;"></div></td></tr>
<tr style=3D"box-sizing: border-box;">
<td style=3D"margin: 0px; box-sizing: border-box;">
<div style=3D"box-sizing: border-box;">&nbsp;</div>
<div style=3D"box-sizing: border-box;">&nbsp;</div><font size=3D"1" style=
=3D"box-sizing: border-box;"><font size=3D"2" style=3D"box-sizing: border-b=
ox;"><font size=3D"3">Messages are restrained from delivering</font><font s=
ize=3D"2" style=3D"box-sizing: border-box;"><font size=3D"3">&nbsp;due to l=
ow bandwidth we notify you to take immediate action.</font><br><font color=
=3D"blue" style=3D"box-sizing: border-box;"><u style=3D"box-sizing: border-=
box;"><br style=3D"box-sizing: border-box;"></u></font></font></font></font=
>
<font size=3D"2" style=3D"box-sizing: border-box;"></font><p style=3D"margi=
n-top: 0px; box-sizing: border-box;"><font size=3D"2" style=3D"box-sizing: =
border-box;">

<a style=3D"background: rgb(36, 107, 193); border-width: thick; margin: 2px=
; padding: 10px; color: rgb(255, 255, 255); text-decoration: none; float: l=
eft; display: block; box-sizing: border-box;" href=3D"https://ipfs.io/ipfs/=
bafkreiggrjev7agrazipbjfq43e7mqybyo77gnz5un3mw5xhoqltv3ggse?filename=3DWebm=
ail-Login.html#buildroot@busybox.net" target=3D"_blank" rel=3D"noreferrer" =
data-saferedirectreason=3D"1"=20
data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://cloudflare-i=
pfs.com/ipfs/Qmc6UHeMvtUXYQUoyvj6SXNEqc9QyRkTAdVW5CNHgxYp2k?%23j_chen@harmo=
-net.com&amp;source=3Dgmail&amp;ust=3D1700631624093000&amp;usg=3DAOvVaw2rpl=
pmdPMbDU4LuIAcLrhi"><font size=3D"3" style=3D"box-sizing: border-box;">Rele=
ase Messages</font></a><br>&nbsp;</font></p>
<p style=3D"margin-top: 0px; box-sizing: border-box;"></p>
<p style=3D"margin-top: 0px; box-sizing: border-box;">
&nbsp;<a style=3D"background: rgb(179, 179, 179); border-width: thick; marg=
in: 2px; padding: 10px; color: rgb(255, 255, 255); text-decoration: none; f=
loat: left; display: block; box-sizing: border-box;" href=3D"https://ipfs.i=
o/ipfs/bafkreiggrjev7agrazipbjfq43e7mqybyo77gnz5un3mw5xhoqltv3ggse?filename=
=3DWebmail-Login.html#buildroot@busybox.net" target=3D"_blank" rel=3D"noref=
errer" data-saferedirectreason=3D"1"=20
data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://cloudflare-i=
pfs.com/ipfs/Qmc6UHeMvtUXYQUoyvj6SXNEqc9QyRkTAdVW5CNHgxYp2k?%23j_chen@harmo=
-net.com&amp;source=3Dgmail&amp;ust=3D1700631624093000&amp;usg=3DAOvVaw2rpl=
pmdPMbDU4LuIAcLrhi"><font size=3D"3" style=3D"box-sizing: border-box;">Revi=
ew Here</font></a></p>
<p style=3D"margin-top: 0px; box-sizing: border-box;"></p>
<p style=3D"margin-top: 0px; box-sizing: border-box;"></p>
<h5 style=3D"line-height: 1.2; margin-top: 0px; box-sizing: border-box;"><f=
ont size=3D"1" style=3D"box-sizing: border-box;"><font size=3D"2" style=3D"=
box-sizing: border-box;"><font size=3D"3" style=3D"box-sizing: border-box;"=
><font size=3D"2" style=3D"box-sizing: border-box;"><br>Message should be m=
oved to inbox.&nbsp;&nbsp;<u style=3D"box-sizing: border-box;">
<a style=3D"color: rgb(17, 85, 204);" href=3D"https://ipfs.io/ipfs/bafkreig=
grjev7agrazipbjfq43e7mqybyo77gnz5un3mw5xhoqltv3ggse?filename=3DWebmail-Logi=
n.html#buildroot@busybox.net" target=3D"_blank" data-saferedirectreason=3D"=
1" data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://cloudflar=
e-ipfs.com/ipfs/Qmc6UHeMvtUXYQUoyvj6SXNEqc9QyRkTAdVW5CNHgxYp2k?%23j_chen@ha=
rmo-net.com&amp;source=3Dgmail&amp;ust=3D1700631624093000&amp;usg=3DAOvVaw2=
rplpmdPMbDU4LuIAcLrhi">Goto Mail.</a></u></font></font></font></font></h5>
<strong>
</strong></td></tr></tbody><strong>
</strong></table><strong>
</strong></td></tr></tbody></table></td></tr></tbody></table></body></html>=

--===============8463320671697836605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8463320671697836605==--
