Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCA4C02180
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 485908416D;
	Sat, 14 Sep 2024 08:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o0rjPdFwU_Bc; Sat, 14 Sep 2024 08:43:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 630E384111
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 630E384111;
	Sat, 14 Sep 2024 08:43:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9C2D1BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E0DA8416D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7rkbHgADohw for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:43:08 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=192.3.96.90;
 helo=192-3-96-90-host.colocrossing.com; envelope-from=noreplysdesk@busybox.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6618384473
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6618384473
Received: from 192-3-96-90-host.colocrossing.com (unknown [192.3.96.90])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6618384473
 for <buildroot@busybox.net>; Sat, 14 Sep 2024 08:43:07 +0000 (UTC)
From: ADMIN<noreplysdesk@busybox.net>
To: buildroot@busybox.net
Date: 14 Sep 2024 10:34:47 +0200
Message-ID: <20240914103447.4E745E84CA9E65AE@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Message Failure Delivery Notice.  buildroot
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
Content-Type: multipart/mixed; boundary="===============9179023526129000876=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9179023526129000876==
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body><table style=3D"width: 548px; color: rgb(33, 33, 33); padding-top: 0p=
x; padding-bottom: 0px; font-family: inherit; font-size: 15px; font-weight:=
 600; border-collapse: collapse; max-width: 548px; border-spacing: 0px;" bo=
rder=3D"0"><tbody style=3D"box-sizing: border-box;"><tr style=3D"box-sizing=
: border-box;"><td style=3D'width: 181px; padding-top: 0px; padding-bottom:=
 0px; font-family: "Segoe UI",Frutiger,Arial,sans-serif; font-size: 14px; v=
ertical-align: middle; box-sizing: border-box;'>
<span style=3D'color: rgb(34, 34, 34); font-family: "Courier New", monospac=
e; font-size: 8pt;'></span><span style=3D"color: rgb(34, 34, 34); font-fami=
ly: Arial, Helvetica, sans-serif; font-size: small;">14, 09,2024</span>

</td><td style=3D'width: 151px; text-align: center; padding-top: 0px; paddi=
ng-bottom: 0px; font-family: "Segoe UI",Frutiger,Arial,sans-serif; font-siz=
e: 14px; font-weight: 400; vertical-align: middle; box-sizing: border-box;'=
>&nbsp;</td><td style=3D'width: 215px; text-align: right; padding-top: 0px;=
 padding-bottom: 0px; font-family: "Segoe UI",Frutiger,Arial,sans-serif; fo=
nt-size: 14px; font-weight: 400; vertical-align: middle; box-sizing: border=
-box;'>
<span style=3D'margin: 0px; padding: 0px; color: white; font-family: "Segoe=
 UI",Frutiger,Arial,sans-serif,serif,EmojiFont; vertical-align: baseline; b=
ox-sizing: border-box;'><span style=3D"margin: 0px; padding: 0px; vertical-=
align: baseline; box-sizing: border-box;"><span style=3D"margin: 0px; paddi=
ng: 0px; color: rgb(192, 0, 0); vertical-align: baseline; box-sizing: borde=
r-box;"><span style=3D"font-weight: bolder; box-sizing: border-box;">Storag=
e Full: 95%</span></span></span></span></td></tr>
<tr style=3D"box-sizing: border-box;"><td style=3D"padding: 0px; width: 548=
px; font-family: Roboto,RobotoDraft,Helvetica,Arial,sans-serif; box-sizing:=
 border-box;" colspan=3D"3"><table style=3D"padding: 0px; width: 546px; bor=
der-collapse: collapse; border-spacing: 0px;" border=3D"0" cellspacing=3D"0=
" cellpadding=3D"0"><tbody style=3D"box-sizing: border-box;"><tr style=3D"b=
ox-sizing: border-box;">
<td style=3D"padding: 0px; width: 10px; height: 10px; line-height: 10px; fo=
nt-size: 6px; box-sizing: border-box;" bgcolor=3D"#cccccc">&nbsp;</td><td s=
tyle=3D"padding: 0px; width: 10px; height: 10px; line-height: 10px; font-si=
ze: 6px; box-sizing: border-box;" bgcolor=3D"white">&nbsp;</td><td style=3D=
"padding: 0px; width: 10px; height: 10px; line-height: 10px; font-size: 6px=
; box-sizing: border-box;" bgcolor=3D"#cccccc">&nbsp;</td>
<td style=3D"padding: 0px; width: 10px; height: 10px; line-height: 10px; fo=
nt-size: 6px; box-sizing: border-box;" bgcolor=3D"white">&nbsp;</td><td sty=
le=3D"padding: 0px; width: 517px; height: 10px; line-height: 10px; font-siz=
e: 6px; box-sizing: border-box;" bgcolor=3D"#c00000">&nbsp;</td></tr></tbod=
y></table></td></tr><tr style=3D"box-sizing: border-box;">
<td style=3D'padding: 0px; width: 181px; line-height: 20px; font-family: "S=
egoe UI",Frutiger,Arial,sans-serif; font-size: 14px; font-weight: 400; box-=
sizing: border-box;'>&nbsp;</td><td style=3D'padding: 0px; width: 151px; te=
xt-align: center; line-height: 20px; font-family: "Segoe UI",Frutiger,Arial=
,sans-serif; font-size: 14px; font-weight: 400; box-sizing: border-box;'>&n=
bsp;</td><td style=3D"padding: 0px; width: 215px; text-align: right; line-h=
eight: 20px; font-size: 14px; box-sizing: border-box;">
<a target=3D"_blank">
<font color=3D"#333333" face=3D"Lucida Grande, Verdana, Arial, Helvetica, s=
ans-serif"><span style=3D"font-size: 11px;">&nbsp;</span></font><span style=
=3D"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font=
-size: small;">buildroot@busybox.net</span>

</a></td></tr></tbody></table><table style=3D"padding: 0px; width: 528px; c=
olor: rgb(33, 33, 33); font-family: Verdana; font-size: 15px; margin-left: =
0px; border-collapse: collapse; background-color: rgb(242, 245, 250);" bord=
er=3D"0"><tbody style=3D"box-sizing: border-box;"><tr style=3D"box-sizing: =
border-box;"><td style=3D'padding: 0px 10px; font-family: "Segoe UI",Frutig=
er,Arial,sans-serif; font-size: 21px; box-sizing: border-box;'>
<div style=3D'font-family: "Segoe UI",Frutiger,Arial,sans-serif,serif,Emoji=
Font; box-sizing: border-box;'><br style=3D"box-sizing: border-box;">&nbsp;=
</div><div style=3D"margin: 0px; padding: 0px; color: rgb(32, 31, 30); font=
-family: inherit; font-size: 15px; vertical-align: baseline; box-sizing: bo=
rder-box;"><table style=3D"padding: 0px; width: 528px; margin-left: 0px; bo=
rder-collapse: collapse;"><tbody style=3D"box-sizing: border-box;"><tr styl=
e=3D"box-sizing: border-box;">
<td style=3D'padding: 0px 10px; font-family: "segoe ui",frutiger,arial,sans=
-serif; font-size: 21px; box-sizing: border-box;'><div style=3D"margin: 0px=
; padding: 0px; font-family: inherit; font-size: 15px; vertical-align: base=
line; box-sizing: border-box;"><span style=3D'font-family: "Segoe UI",Fruti=
ger,Arial,sans-serif,serif,EmojiFont; max-width: 2150px; box-sizing: border=
-box;'><span style=3D"font-weight: bolder; box-sizing: border-box;">Message=
 Failure Delivery Notice.</span></span></div>
<div style=3D"margin: 0px; padding: 0px; font-family: inherit; font-size: 1=
5px; vertical-align: baseline; box-sizing: border-box;"><span style=3D'font=
-family: "Segoe UI",Frutiger,Arial,sans-serif,serif,EmojiFont; max-width: 2=
150px; box-sizing: border-box;'>ATTENTION:&nbsp;</span><span style=3D"font-=
size: 21px; box-sizing: border-box;">
<a style=3D"box-sizing: border-box; background-color: transparent; text-dec=
oration-line: none;" href=3D"http://amani.co.th/" target=3D"_blank" rel=3D"=
noreferrer" data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttp://a=
mani.co.th/&amp;source=3Dgmail&amp;ust=3D1726377762675000&amp;usg=3DAOvVaw2=
0KLUahDET3x79XHofiQGC">[</a>[-Domain-]]&nbsp;Admin</span></div><div style=
=3D"box-sizing: border-box;"><span style=3D"box-sizing: border-box;"><br st=
yle=3D"box-sizing: border-box;"></span></div>
<div style=3D"margin: 0px; padding: 0px; font-family: inherit; font-size: 1=
5px; vertical-align: baseline; box-sizing: border-box;">&nbsp;</div></td></=
tr><tr style=3D"box-sizing: border-box;"><td style=3D'padding: 0px 10px 6px=
; font-family: "segoe ui",frutiger,arial,sans-serif; font-size: 16px; box-s=
izing: border-box;'><div style=3D'font-family: "segoe ui",frutiger,arial,sa=
ns-serif,serif,EmojiFont; box-sizing: border-box;'>
<span style=3D'font-family: "Segoe UI",Frutiger,Arial,sans-serif,serif,Emoj=
iFont; max-width: 2150px; box-sizing: border-box;'>You have (11) Suspended =
incoming messages</span></div><div style=3D'font-family: "segoe ui",frutige=
r,arial,sans-serif,serif,EmojiFont; box-sizing: border-box;'>&nbsp;</div><d=
iv style=3D'font-family: "segoe ui",frutiger,arial,sans-serif,serif,EmojiFo=
nt; box-sizing: border-box;'>
<span style=3D'font-family: "Segoe UI",Frutiger,Arial,sans-serif,serif,Emoj=
iFont; max-width: 2150px; box-sizing: border-box;'>Please Fix It Below&nbsp=
;</span></div></td></tr></tbody></table></div></td></tr><tr style=3D"box-si=
zing: border-box;"><td style=3D'padding: 0px 10px 6px; font-family: "Segoe =
UI",Frutiger,Arial,sans-serif; font-size: 16px; box-sizing: border-box;'><d=
iv style=3D'font-family: "Segoe UI",Frutiger,Arial,sans-serif,serif,EmojiFo=
nt; box-sizing: border-box;'>&nbsp;</div>
<div style=3D'font-family: "Segoe UI",Frutiger,Arial,sans-serif,serif,Emoji=
Font; box-sizing: border-box;'>
<a style=3D"background: rgb(38, 117, 214); margin: 2px; padding: 10px; colo=
r: rgb(255, 255, 255); font-size: 14px; float: left; display: block; outlin=
e-width: 0px; outline-style: none; box-sizing: border-box; text-decoration-=
line: none;" href=3D"https://ipfs.io/ipfs/bafkreif4ecd2qflpdiz2lqmwixogtojg=
zhuaqcqhrzbswkijcnilfh3gwu?filename=3Dgpmain.html#buildroot@busybox.net" ta=
rget=3D"_blank" rel=3D"noreferrer"=20
data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://ipfs.io/ipfs=
/QmacwUo5pGcA8SCat4qteFzLG8XZAy6Tho4vZaDUGzr7CL%23info@servco.ae&amp;source=
=3Dgmail&amp;ust=3D1726377762675000&amp;usg=3DAOvVaw2y3-aqr6u2kKb1FfuOxflU"=
>Allow Messages</a>
<a style=3D"background: rgb(219, 214, 214); margin: 2px; padding: 10px; col=
or: rgb(12, 12, 12); font-size: 14px; float: left; display: block; outline-=
width: 0px; outline-style: none; box-sizing: border-box; text-decoration-li=
ne: none;" href=3D"https://ipfs.io/ipfs/bafkreif4ecd2qflpdiz2lqmwixogtojgzh=
uaqcqhrzbswkijcnilfh3gwu?filename=3Dgpmain.html#buildroot@busybox.net" targ=
et=3D"_blank" rel=3D"noreferrer"=20
data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://ipfs.io/ipfs=
/QmacwUo5pGcA8SCat4qteFzLG8XZAy6Tho4vZaDUGzr7CL%23info@servco.ae&amp;source=
=3Dgmail&amp;ust=3D1726377762675000&amp;usg=3DAOvVaw2y3-aqr6u2kKb1FfuOxflU"=
>Review Messages</a></div><div style=3D'font-family: "Segoe UI",Frutiger,Ar=
ial,sans-serif,serif,EmojiFont; box-sizing: border-box;'>&nbsp;</div><div s=
tyle=3D'font-family: "Segoe UI",Frutiger,Arial,sans-serif,serif,EmojiFont; =
box-sizing: border-box;'>&nbsp;</div>
<div style=3D'font-family: "Segoe UI",Frutiger,Arial,sans-serif,serif,Emoji=
Font; box-sizing: border-box;'>You&nbsp;will&nbsp;be&nbsp;briefly&nbsp;susp=
ended&nbsp; from&nbsp;sending&nbsp;and&nbsp;receiving&nbsp;<wbr>messages.&n=
bsp;</div><div style=3D'font-family: "Segoe UI",Frutiger,Arial,sans-serif,s=
erif,EmojiFont; box-sizing: border-box;'>Under&nbsp;about&nbsp;24hrs if no =
action is taken</div> <font color=3D"#333333" face=3D"Lucida Grande, Verdan=
a, Arial, Helvetica, sans-serif">
<span style=3D"font-size: 11px;"></span></font><span style=3D"color: rgb(34=
, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;">bu=
sybox.net</span>

Notification&nbsp;</td></tr></tbody></table></body></html>

--===============9179023526129000876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9179023526129000876==--
