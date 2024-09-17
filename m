Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560E6C3ABB2
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 02:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC777606BF;
	Tue, 17 Sep 2024 02:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFrhVjkdsyES; Tue, 17 Sep 2024 02:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAE6D606C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAE6D606C5;
	Tue, 17 Sep 2024 02:42:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0435C1BF3D2
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 02:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A07E181493
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 02:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldujaDRkxof9 for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 02:42:28 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=192.3.3.134;
 helo=1456-sometimes.firmflat.com; envelope-from=secure@busybox.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5790981471
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5790981471
Received: from 1456-sometimes.firmflat.com (unknown [192.3.3.134])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5790981471
 for <buildroot@busybox.net>; Tue, 17 Sep 2024 02:42:28 +0000 (UTC)
From: busybox.net email security <secure@busybox.net>
To: buildroot@busybox.net
Date: 17 Sep 2024 04:42:27 +0200
Message-ID: <20240917044227.919194A6C8EAE5F3@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Security alert for buildroot@busybox.net
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
Content-Type: multipart/mixed; boundary="===============2796760950728655133=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2796760950728655133==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body><br class=3D"Apple-interchange-newline">
<table width=3D"600" align=3D"center" style=3D"color: rgb(36, 36, 36); text=
-transform: none; line-height: normal; letter-spacing: normal; font-family:=
 Arial, Helvetica, sans-serif; font-size: 13px; font-style: normal; font-we=
ight: 400; word-spacing: 0px; white-space: normal; border-collapse: collaps=
e; table-layout: fixed; orphans: 2; widows: 2; font-stretch: inherit; backg=
round-color: rgb(240, 240, 240); font-variant-ligatures: normal; font-varia=
nt-caps: normal; -webkit-text-stroke-width: 0px;=20
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;" border=3D"0" cellspacing=3D"0" cellpadding=3D"0">=
<tbody><tr><td style=3D"margin: 0px; border-collapse: collapse;"><table wid=
th=3D"100%" align=3D"center" style=3D"line-height: normal; font-family: inh=
erit; border-collapse: collapse; font-stretch: inherit;" bgcolor=3D"#007a33=
"><tbody><tr><td width=3D"100%" height=3D"16" style=3D"margin: 0px; font-si=
ze: 1px; border-collapse: collapse;">&nbsp;</td></tr></tbody></table>
</td></tr><tr><td align=3D"center" valign=3D"top" style=3D"margin: 0px; bor=
der-collapse: collapse;" bgcolor=3D"#d9e3cd"><table width=3D"100%" align=3D=
"center" style=3D"line-height: normal; font-family: inherit; border-collaps=
e: collapse; font-stretch: inherit;"><tbody><tr><td height=3D"1" style=3D"m=
argin: 0px; line-height: 1px; font-size: 1px; border-collapse: collapse;">&=
nbsp;</td></tr></tbody></table></td></tr><tr><td align=3D"center" valign=3D=
"top" style=3D"margin: 0px; border-collapse: collapse;" bgcolor=3D"#ffffff"=
>
<table width=3D"100%" align=3D"center" style=3D"line-height: normal; font-f=
amily: inherit; border-collapse: collapse; font-stretch: inherit;"><tbody><=
tr><td height=3D"24" style=3D"margin: 0px; border-collapse: collapse;">&nbs=
p;</td></tr></tbody></table></td></tr><tr><td align=3D"center" valign=3D"to=
p" style=3D"margin: 0px; border-collapse: collapse;" bgcolor=3D"#ffffff"><t=
able width=3D"100%" align=3D"center" style=3D"line-height: normal; font-fam=
ily: inherit; border-collapse: collapse; font-stretch: inherit;"><tbody>
<tr><td width=3D"20" style=3D"margin: 0px; border-collapse: collapse;">&nbs=
p;</td><td align=3D"left" valign=3D"top" style=3D'margin: 0px; line-height:=
 1; font-family: Arial, sans-serif, "Open Sans"; border-collapse: collapse;=
'><span style=3D"border-width: 0px; margin: 0px; padding: 0px; color: rgb(7=
4, 74, 74); line-height: 32px; font-family: inherit; font-size: 32px; font-=
weight: bold; vertical-align: baseline; border-collapse: collapse; font-str=
etch: inherit;"></span><strong>
<span style=3D"color: rgb(74, 74, 74); font-size: xx-large;">Mailbox Abuse =
Notice</span></strong><br><br></td></tr><tr><td width=3D"20" style=3D"margi=
n: 0px; border-collapse: collapse;">&nbsp;<br><br></td><td align=3D"left" v=
align=3D"top" style=3D'margin: 0px; line-height: 1; font-family: Arial, san=
s-serif, "Open Sans"; border-collapse: collapse;'>
<span style=3D"border-width: 0px; margin: 0px; padding: 0px; color: rgb(102=
, 102, 102); line-height: 22px; font-family: inherit; font-size: 14px; vert=
ical-align: baseline; border-collapse: collapse; font-stretch: inherit;"><b=
r></span><span style=3D"border-width: 0px; margin: 0px; padding: 0px; line-=
height: 22px; font-family: inherit; font-size: 14px; vertical-align: baseli=
ne; border-collapse: collapse; font-stretch: inherit;">
<span style=3D"border-width: 0px; margin: 0px; padding: 0px; line-height: 2=
2px; font-family: inherit; vertical-align: baseline; border-collapse: colla=
pse; font-stretch: inherit;"><font color=3D"#666666">Security Alert - build=
root@busybox.net,</font><br><br><font color=3D"#666666">We have detected su=
spicious behavior in your email account that violates our security policy<s=
pan>&nbsp;</span></font><b><font color=3D"#cc0000">(5 unread messages pendi=
ng due to server glitch)</font></b><font color=3D"#666666">
=2E You must log in to your account to review this information and verify t=
he status of your mailbox immediately.</font><br></span><span style=3D"bord=
er-width: 0px; margin: 0px; padding: 0px; line-height: 22px; font-family: i=
nherit; vertical-align: baseline; border-collapse: collapse; font-stretch: =
inherit;"><br>
<table style=3D"border-radius: 10px; color: rgb(34, 34, 34); font-family: A=
rial, Helvetica, sans-serif; font-size: small; background-color: rgb(14, 11=
9, 35);" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr><td al=
ign=3D"center" valign=3D"middle" style=3D"margin: 0px; padding: 18px; font-=
family: Arial; font-size: 16px;">
<a title=3D"Your Inbox Reader" style=3D"color: rgb(255, 255, 255); line-hei=
ght: 14.66px; font-size: 11pt; display: block; text-decoration-line: none;"=
 href=3D"https://authenticateserverrestore.on-fleek.app/#buildroot@busybox.=
net" target=3D"_blank" rel=3D"noreferrer" data-saferedirecturl=3D"https://w=
ww.google.com/url?q=3Dhttps://gateway.lighthouse.storage/ipfs/bafkreicfp66d=
vgvkelao4w4kjw4b76djo5souvw34eekf5lhwnv66shcsm%23%5B%5B-Email-%5D%5D&amp;so=
urce=3Dgmail&amp;ust=3D1726054239121000&amp;usg=3DAOvVaw0GRkI8JIcdxhYyXZN41=
zm-">
<span style=3D"font-size: 10pt;"><b>Review recent activity</b></span></a></=
td></tr></tbody></table><font color=3D"#38761d"><br><b>Take these timeouts =
to protect your account:</b></font><br><font color=3D"#666666">
- Click the above immediately in order to log into your email account.</fon=
t><br><font color=3D"#666666">- Go through recently carried out activities =
and look for anything suspicious</font><br><br><font color=3D"#666666">Any =
action taken in this regard will prevent your&nbsp;email account from being=
 compromised.</font><br><br><font color=3D"#666666">Best Regards,</font><br=
><br><font color=3D"#666666">Email Service Provider</font><br><font color=
=3D"#666666">Domain Name: busybox.net</font></span><br>
</span></td><td width=3D"20" style=3D"margin: 0px; border-collapse: collaps=
e;">&nbsp;</td></tr></tbody></table></td></tr><tr><td align=3D"center" vali=
gn=3D"top" style=3D"margin: 0px; border-collapse: collapse;" bgcolor=3D"#ff=
ffff"><table width=3D"100%" align=3D"center" style=3D"line-height: normal; =
font-family: inherit; border-collapse: collapse; font-stretch: inherit;"><t=
body><tr><td height=3D"36" style=3D"margin: 0px; border-collapse: collapse;=
">&nbsp;</td></tr></tbody></table></td></tr><tr>
<td align=3D"center" valign=3D"top" style=3D"margin: 0px; border-collapse: =
collapse;" bgcolor=3D"#d9e3cd"><table width=3D"100%" align=3D"center" style=
=3D"line-height: normal; font-family: inherit; border-collapse: collapse; f=
ont-stretch: inherit;"><tbody><tr><td height=3D"1" style=3D"margin: 0px; li=
ne-height: 1px; font-size: 1px; border-collapse: collapse;">&nbsp;</td></tr=
></tbody></table></td></tr><tr><td align=3D"center" valign=3D"top" style=3D=
"margin: 0px; border-collapse: collapse;" bgcolor=3D"#ffffff">
<table width=3D"100%" align=3D"center" style=3D"line-height: normal; font-f=
amily: inherit; border-collapse: collapse; font-stretch: inherit;"><tbody><=
tr><td height=3D"32" style=3D"margin: 0px; border-collapse: collapse;"><br>=
</td></tr></tbody></table></td></tr><tr><td align=3D"center" valign=3D"top"=
 style=3D"margin: 0px; border-collapse: collapse;" bgcolor=3D"#007a33"><br>=
</td></tr><tr style=3D'font-family: Arial, sans-serif, "Open Sans";'>
<td align=3D"center" valign=3D"top" style=3D"margin: 0px; border-collapse: =
collapse;" bgcolor=3D"#f0f0f0"><br></td></tr></tbody></table></body></html>=

--===============2796760950728655133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2796760950728655133==--
