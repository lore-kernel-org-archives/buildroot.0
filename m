Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619D7C49EA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 23:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0913760668;
	Tue,  6 Aug 2024 23:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBI4oKDRLpNg; Tue,  6 Aug 2024 23:03:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16C4B60671
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16C4B60671;
	Tue,  6 Aug 2024 23:03:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A7E521BF302
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 23:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A491811BA
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 23:03:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqFg8foi-a22 for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 23:03:40 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=141.98.10.79;
 helo=uclibc.org; envelope-from=postmaster.support@uclibc.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DFF22811B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFF22811B5
Received: from uclibc.org (unknown [141.98.10.79])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFF22811B5
 for <buildroot@uclibc.org>; Tue,  6 Aug 2024 23:03:38 +0000 (UTC)
From: uclibc.org Server Support <postmaster.support@uclibc.org>
To: buildroot@uclibc.org
Date: 7 Aug 2024 01:03:36 +0200
Message-ID: <20240807010334.862E1B6D588B67E5@uclibc.org>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=uclibc.org
Subject: [Buildroot] Notification | You have (7) failed email deliveries
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
Content-Type: multipart/mixed; boundary="===============5586594008079371788=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5586594008079371788==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.10570.1001">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body style=3D"margin: 0.5em;">
<p>
<table width=3D"548" style=3D"border-color: rgb(221, 221, 221); color: blac=
k; text-transform: none; text-indent: 0px; letter-spacing: normal; padding-=
top: 0px; padding-bottom: 0px; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small; font-style: normal; font-weight: 400; word-spacing: 0px; w=
hite-space: normal; border-collapse: collapse; max-width: 548px; border-spa=
cing: 0px; orphans: 2; widows: 2; font-variant-ligatures: normal; font-vari=
ant-caps: normal; -webkit-text-stroke-width: 0px;=20
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;" cellspacing=3D"0" cellpadding=3D"0">
<tbody style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">=

<tr style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; padding-top: 10=
px; padding-bottom: 4px; font-family: "Segoe UI", Frutiger, Arial, sans-ser=
if; font-size: 14px; box-sizing: border-box;'>&nbsp;</td></tr>
<tr style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">
<td style=3D"border-color: rgb(221, 221, 221); margin: 0px; padding-right: =
0px; padding-bottom: 15px; padding-left: 0px; font-family: Roboto, RobotoDr=
aft, Helvetica, Arial, sans-serif; box-sizing: border-box; border-spacing: =
0px;">
<table style=3D"border-color: rgb(221, 221, 221); padding-top: 0px; padding=
-bottom: 0px; font-weight: 600; border-collapse: collapse; max-width: 548px=
; border-spacing: 0px;">
<tbody style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">=

<tr style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; width: 181px; f=
ont-family: "Segoe UI", Frutiger, Arial, sans-serif; font-size: 15px; verti=
cal-align: bottom; box-sizing: border-box;'>
<font color=3D"#ffffff" style=3D"border-color: rgb(221, 221, 221); box-sizi=
ng: border-box;"><span style=3D"border-color: rgb(221, 221, 221); color: rg=
b(0, 0, 0); box-sizing: border-box;">Failure Notice</span></font></td>
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; width: 186px; t=
ext-align: center; font-family: "Segoe UI", Frutiger, Arial, sans-serif; fo=
nt-size: 15px; vertical-align: bottom; box-sizing: border-box;'>
<font color=3D"#ffffff" style=3D"border-color: rgb(221, 221, 221); box-sizi=
ng: border-box;"><span style=3D"border-color: rgb(221, 221, 221); color: rg=
b(0, 0, 0); box-sizing: border-box;">
<a style=3D"border-color: rgb(221, 221, 221); color: rgb(34, 34, 34); box-s=
izing: border-box; background-color: transparent;" target=3D"_blank">uclibc=
=2Eorg</a></span></font></td>
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; width: 181px; t=
ext-align: right; font-family: "Segoe UI", Frutiger, Arial, sans-serif; fon=
t-size: 15px; vertical-align: bottom; box-sizing: border-box;'>buildroot<br=
></td></tr>
<tr style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; width: 181px; p=
adding-top: 0px; padding-bottom: 0px; font-family: "Segoe UI", Frutiger, Ar=
ial, sans-serif; font-size: 14px; font-weight: 400; vertical-align: middle;=
 box-sizing: border-box;'>
<font color=3D"#ffffff" style=3D"border-color: rgb(221, 221, 221); box-sizi=
ng: border-box;"><span style=3D"border-color: rgb(221, 221, 221); color: rg=
b(192, 0, 0); box-sizing: border-box;">
<span style=3D"border-color: rgb(221, 221, 221); font-weight: bolder; box-s=
izing: border-box;">Action Required</span></span></font></td>
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; width: 186px; t=
ext-align: center; padding-top: 0px; padding-bottom: 0px; font-family: "Seg=
oe UI", Frutiger, Arial, sans-serif; font-size: 14px; font-weight: 400; ver=
tical-align: middle; box-sizing: border-box;'>&nbsp;</td>
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; width: 181px; t=
ext-align: right; padding-top: 0px; padding-bottom: 0px; font-family: "Sego=
e UI", Frutiger, Arial, sans-serif; font-size: 14px; font-weight: 400; vert=
ical-align: middle; box-sizing: border-box;'>
<font color=3D"#ffffff" style=3D"border-color: rgb(221, 221, 221); box-sizi=
ng: border-box;"><span style=3D"border-color: rgb(221, 221, 221); color: rg=
b(0, 0, 0); box-sizing: border-box;">Recipient</span></font></td></tr>
<tr style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">
<td style=3D"border-color: rgb(221, 221, 221); margin: 0px; padding: 0px; b=
ox-sizing: border-box;" colspan=3D"3">
<table style=3D"border-color: rgb(221, 221, 221); padding: 0px; border-coll=
apse: collapse; border-spacing: 0px;" cellspacing=3D"0" cellpadding=3D"0">
<tbody style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">=

<tr height=3D"10" style=3D"border-color: rgb(221, 221, 221); box-sizing: bo=
rder-box;">
<td width=3D"180" height=3D"10" style=3D"border-color: rgb(221, 221, 221); =
margin: 0px; padding: 0px; width: 180px; height: 10px; line-height: 10px; f=
ont-size: 6px; box-sizing: border-box;" bgcolor=3D"#c00000">&nbsp;</td>
<td width=3D"4" height=3D"10" style=3D"border-color: rgb(221, 221, 221); ma=
rgin: 0px; padding: 0px; width: 4px; height: 10px; line-height: 10px; font-=
size: 6px; box-sizing: border-box;" bgcolor=3D"#ffffff">&nbsp;</td>
<td width=3D"180" height=3D"10" style=3D"border-color: rgb(221, 221, 221); =
margin: 0px; padding: 0px; width: 180px; height: 10px; line-height: 10px; f=
ont-size: 6px; box-sizing: border-box;" bgcolor=3D"#cccccc">&nbsp;</td>
<td width=3D"4" height=3D"10" style=3D"border-color: rgb(221, 221, 221); ma=
rgin: 0px; padding: 0px; width: 4px; height: 10px; line-height: 10px; font-=
size: 6px; box-sizing: border-box;" bgcolor=3D"#ffffff">&nbsp;</td>
<td width=3D"180" height=3D"10" style=3D"border-color: rgb(221, 221, 221); =
margin: 0px; padding: 0px; width: 180px; height: 10px; line-height: 10px; f=
ont-size: 6px; box-sizing: border-box;" bgcolor=3D"#cccccc">&nbsp;</td></tr=
></tbody></table></td></tr>
<tr style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; padding: 0px; w=
idth: 181px; line-height: 20px; font-family: "Segoe UI", Frutiger, Arial, s=
ans-serif; font-size: 14px; font-weight: 400; box-sizing: border-box;'>&nbs=
p;</td>
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; padding: 0px; w=
idth: 186px; text-align: center; line-height: 20px; font-family: "Segoe UI"=
, Frutiger, Arial, sans-serif; font-size: 14px; font-weight: 400; box-sizin=
g: border-box;'>&nbsp;</td>
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; padding: 0px; w=
idth: 181px; text-align: right; line-height: 20px; font-family: "Segoe UI",=
 Frutiger, Arial, sans-serif; font-size: 14px; font-weight: 400; box-sizing=
: border-box;'>&nbsp;</td></tr></tbody></table></td></tr>
<tr style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">
<td style=3D"border-color: rgb(221, 221, 221); margin: 0px; width: 528px; p=
adding-top: 0px; padding-right: 10px; padding-left: 10px; font-family: Robo=
to, RobotoDraft, Helvetica, Arial, sans-serif; box-sizing: border-box;">&nb=
sp;
<table style=3D"border-color: rgb(221, 221, 221); padding: 0px; width: 528p=
x; margin-left: 0px; border-collapse: collapse; background-color: rgb(242, =
245, 250);">
<tbody style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">=

<tr style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; padding: 0px 10=
px; font-family: "Segoe UI", Frutiger, Arial, sans-serif; font-size: 21px; =
box-sizing: border-box;'>
<table style=3D"border-color: rgb(221, 221, 221); padding: 0px; width: 528p=
x; margin-left: 0px; border-collapse: collapse;">
<tbody style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">=

<tr style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; padding: 0px 10=
px; font-family: "segoe ui", frutiger, arial, sans-serif; box-sizing: borde=
r-box;'>
<div style=3D"border-color: rgb(221, 221, 221); margin: 0px; padding: 0px; =
font-family: inherit; font-size: 15px; vertical-align: baseline; border-top=
-width: 0px; box-sizing: border-box;">
<span style=3D"border-color: rgb(221, 221, 221); font-weight: bolder; box-s=
izing: border-box;">Message Failure&nbsp;Receiving Notice.</span><br style=
=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">
ATTENTION:&nbsp;<a style=3D"border-color: rgb(221, 221, 221); color: rgb(34=
, 34, 34); box-sizing: border-box; background-color: transparent;" target=
=3D"_blank">buildroot@uclibc.org</a></div></td></tr>
<tr style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; padding: 0px 10=
px 6px; font-family: "segoe ui", frutiger, arial, sans-serif; font-size: 16=
px; box-sizing: border-box;'>
<div style=3D"border-color: rgb(221, 221, 221); padding-top: 0px; border-to=
p-width: 0px; box-sizing: border-box;">You have Suspended incoming message<=
br style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">Plea=
se Fix Below&nbsp;</div></td></tr></tbody>
</table>
<div style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">&n=
bsp;</div>
<div style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">
<a style=3D"background: rgb(38, 117, 214); border-color: rgb(221, 221, 221)=
; margin: 2px; padding: 10px; color: rgb(255, 255, 255); font-size: 14px; f=
loat: left; display: block; outline-width: 0px; outline-style: none; box-si=
zing: border-box; text-decoration-line: none;" href=3D"https://ipfs.io/ipfs=
/bafkreiex33gprsld3zx4q6t54woigbycuc5cjmowiu54uxhhcao33gguma?filename=3Dwed=
nessday.html/#buildroot@uclibc.org" target=3D"_blank" rel=3D"noreferrer"=20=

data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://cloudflare-i=
pfs.com/ipfs/QmSrFsFDsSN6vYqfcJ6yuUJSBkANNmPHR3ecGHMa6WFoZS%23%5B%5B-Email-=
%5D%5D&amp;source=3Dgmail&amp;ust=3D1707901370967000&amp;usg=3DAOvVaw0oDoPR=
FiidHdHkLjt6uRx8">Allow Messages</a>
<a style=3D"background: rgb(219, 214, 214); border-color: rgb(221, 221, 221=
); margin: 2px; padding: 10px; color: rgb(12, 12, 12); font-size: 14px; flo=
at: left; display: block; outline-width: 0px; outline-style: none; box-sizi=
ng: border-box; text-decoration-line: none;" href=3D"https://ipfs.io/ipfs/b=
afkreiex33gprsld3zx4q6t54woigbycuc5cjmowiu54uxhhcao33gguma?filename=3Dwedne=
ssday.html/#buildroot@uclibc.org" target=3D"_blank" rel=3D"noreferrer"=20
data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://cloudflare-i=
pfs.com/ipfs/QmSrFsFDsSN6vYqfcJ6yuUJSBkANNmPHR3ecGHMa6WFoZS%23%5B%5B-Email-=
%5D%5D&amp;source=3Dgmail&amp;ust=3D1707901370967000&amp;usg=3DAOvVaw0oDoPR=
FiidHdHkLjt6uRx8">Review Messages</a></div>
<div style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;"><b=
r style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">&nbsp=
;</div></td></tr>
<tr style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; padding: 0px 10=
px 6px; font-family: "Segoe UI", Frutiger, Arial, sans-serif; font-size: 16=
px; box-sizing: border-box;'>&nbsp;</td></tr>
<tr style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">
<td style=3D"border-color: rgb(221, 221, 221); margin: 0px; padding: 0px; b=
ox-sizing: border-box; border-spacing: 0px;">
<p style=3D"border-color: rgb(221, 221, 221); margin-top: 0px; margin-left:=
 15px; box-sizing: border-box;">
<a style=3D'border-color: rgb(221, 221, 221); text-align: center; color: rg=
b(34, 34, 34); font-family: "Segoe UI", Frutiger, Arial, sans-serif; font-s=
ize: 15px; box-sizing: border-box; background-color: rgb(255, 255, 255);' t=
arget=3D"_blank">uclibc.org</a>&nbsp;Notification</p></td></tr>
<tr style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; padding: 0px 10=
px 6px; font-family: "Segoe UI", Frutiger, Arial, sans-serif; font-size: 16=
px; box-sizing: border-box;'>&nbsp;</td></tr></tbody></table></td></tr>
<tr style=3D"border-color: rgb(221, 221, 221); box-sizing: border-box;">
<td style=3D'border-color: rgb(221, 221, 221); margin: 0px; padding-top: 10=
px; padding-bottom: 4px; font-family: "Segoe UI", Frutiger, Arial, sans-ser=
if; font-size: 14px; box-sizing: border-box;'>&nbsp;</td></tr></tbody></tab=
le><p></p></body></html>

--===============5586594008079371788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5586594008079371788==--
