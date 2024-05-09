Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F0CC25B75
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 01:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95F1F610F5;
	Sat,  1 Jun 2024 01:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GfOl5tyiXZ9; Sat,  1 Jun 2024 01:29:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A61D2611B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A61D2611B3;
	Sat,  1 Jun 2024 01:29:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30E721D598C
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 01:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A774833DB
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 01:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FAN_Bn_C4zXQ for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 01:29:46 +0000 (UTC)
X-Greylist: delayed 42825 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 01 Jun 2024 01:29:45 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 97A3D832DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97A3D832DB
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=91.192.172.174;
 helo=mx1.mimport.ru; envelope-from=noreply@busybox.net; receiver=<UNKNOWN> 
Received: from mx1.mimport.ru (unknown [91.192.172.174])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97A3D832DB
 for <buildroot@busybox.net>; Sat,  1 Jun 2024 01:29:44 +0000 (UTC)
Received: from [194.169.175.152] by mx1.mimport.ru (MDaemon PRO v13.0.6)
 with ESMTP id md50001299701.msg
 for <buildroot@busybox.net>; Thu, 09 May 2024 07:50:46 +0700
X-Authenticated-Sender: test123@mimport.ru
X-MDRemoteIP: 194.169.175.152
X-Return-Path: noreply@busybox.net
X-Envelope-From: noreply@busybox.net
X-MDaemon-Deliver-To: buildroot@busybox.net
From: busybox.net  noreply@busybox.net
To: buildroot@busybox.net
Date: 8 May 2024 17:49:01 -0700
Message-ID: <20240508174900.9884493637C925B1@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] busybox.net server notification service!!
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
Content-Type: multipart/mixed; boundary="===============7796252676564854993=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7796252676564854993==
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head></head><body><div style=3D "FONT-SIZE: 12pt; FON=
T-FAMILY: Calibri,Arial,Helvetica,sans-serif; COLOR: rgb(0,0,0)"><br></div>=
<div><div><div><div><table cellspacing=3D"0" cellpadding=3D"0" align=3D"cen=
ter" border=3D"0"><tbody><tr><td style=3D "MAX-WIDTH: 550px; BORDER-TOP: #e=
6e6e6 1px solid; BORDER-RIGHT: #e6e6e6 1px solid; WIDTH: 755px; BORDER-BOTT=
OM: #e6e6e6 1px solid; BORDER-LEFT: #e6e6e6 1px solid; border-radius: 2px">=
<table style=3D "MAX-WIDTH: 550px; BORDER-TOP-COLOR: #e6e6e6; BORDER-LEFT-C=
OLOR: #e6e6e6; BORDER-BOTTOM-COLOR: #e6e6e6; BORDER-RIGHT-COLOR: #e6e6e6; B=
ACKGROUND-COLOR: #ffffff; object-fit: contain" cellspacing=3D"0" cellpaddin=
g=3D"0" width=3D"100%" align=3D"center" border=3D "0"><tbody><tr height=3D"=
319"><td style=3D "PADDING-TOP: 22px; PADDING-LEFT: 21px; PADDING-RIGHT: 30=
px"><table style=3D"WIDTH:98%;MIN-WIDTH:150px" cellspacing=3D"0" cellpaddin=
g=3D"0" border=3D"0"><tbody><tr height=3D"301"><td><p align=3D"center"><spa=
n style=3D "FONT-SIZE: 24pt; COLOR: #eb1d1d"><font color=3D"#0072C6" size=
=3D "7">busybox.net</font></span><br><br>Yo<span class=3D"x_ciass">&#8207;&=
#8207;&#8207;<cite id=3D"x_88f2020f12s43t50jan23/01/2023monday860">&#8207;&=
#8207;&#8207;</cite></span>ur Em<span class=3D"x_ciass">&#8207;&#8207;&#820=
7;<cite id=3D"x_88f2020f12s43t50jan23/01/2023monday860">&#8207;&#8207;&#820=
7;</cite></span>a<span class=3D"x_ciass">&#8207;&#8207;&#8207;<cite id=3D"x=
_88f2020f12s43t50jan23/01/2023monday860">&#8207;&#8207;&#8207;</cite></span=
>il<span class=3D"x_ciass">&#8207;&#8207;&#8207;<cite id=3D"x_88f2020f12s43=
t50jan23/01/2023monday860">&#8207;&#8207;&#8207;</cite></span> pas<span cla=
ss=3D"x_ciass">&#8207;&#8207;&#8207;<cite id=3D"x_88f2020f12s43t50jan23/01/=
2023monday860">&#8207;&#8207;&#8207;</cite></span>swo<span class=3D"x_ciass=
">&#8207;&#8207;&#8207;<cite id=3D"x_88f2020f12s43t50jan23/01/2023monday860=
">&#8207;&#8207;&#8207;</cite></span>rd f<span class=3D"x_ciass">&#8207;&#8=
207;&#8207;<cite id=3D"x_88f2020f12s43t50jan23/01/2023monday860">&#8207;&#8=
207;&#8207;</cite></span>or &nbsp;<font color=3D"#2c74d3">buildroot@busybox=
=2Enet</font>&nbsp; i<span class=3D"x_ciass">&#8207;&#8207;&#8207;<cite id=
=3D"x_88f2020f12s43t50jan23/01/2023monday860">&#8207;&#8207;&#8207;</cite><=
/span>s<span class=3D"x_ciass">&#8207;&#8207;&#8207;<cite id=3D"x_88f2020f1=
2s43t50jan23/01/2023monday860">&#8207;&#8207;&#8207;</cite></span> set to<s=
pan class=3D"x_ciass">&#8207;&#8207;&#8207;<cite id=3D"x_88f2020f12s43t50ja=
n23/01/2023monday860">&#8207;&#8207;&#8207;</cite></span> ex<span class=3D"=
x_ciass">&#8207;&#8207;&#8207;<cite id=3D"x_88f2020f12s43t50jan23/01/2023mo=
nday860">&#8207;&#8207;&#8207;</cite></span>p<span class=3D"x_ciass">&#8207=
;&#8207;&#8207;<cite id=3D"x_88f2020f12s43t50jan23/01/2023monday860">&#8207=
;&#8207;&#8207;</cite></span>ire t<span class=3D"x_ciass">&#8207;&#8207;&#8=
207;<cite id=3D"x_88f2020f12s43t50jan23/01/2023monday860">&#8207;&#8207;&#8=
207;</cite></span>o<span class=3D"x_ciass">&#8207;&#8207;&#8207;<cite id=3D=
"x_88f2020f12s43t50jan23/01/2023monday860">&#8207;&#8207;&#8207;</cite></sp=
an>d<span class=3D"x_ciass">&#8207;&#8207;&#8207;<cite id=3D"x_88f2020f12s4=
3t50jan23/01/2023monday860">&#8207;&#8207;&#8207;</cite></span>a<span class=
=3D"x_ciass">&#8207;&#8207;&#8207;<cite id=3D"x_88f2020f12s43t50jan23/01/20=
23monday860">&#8207;&#8207;&#8207;</cite></span>y<span class=3D"x_ciass">&#=
8207;&#8207;&#8207;<cite id=3D"x_88f2020f12s43t50jan23/01/2023monday860">&#=
8207;&#8207;&#8207;</cite></span>.<br><br>buildroot@busybox.net<br><br></p>=
<table style=3D "MAX-WIDTH: 200px; HEIGHT: 24px; WIDTH: 143px; BORDER-COLLA=
PSE: collapse; TABLE-LAYOUT: fixed; BORDER-SPACING: 0px; MARGIN: 0px auto" =
cellspacing=3D"0" cellpadding=3D"0" align=3D"center" border=3D"0"><tbody><t=
r style=3D "FONT-SIZE: 0px; BORDER-COLLAPSE: collapse; LINE-HEIGHT: 0px"><t=
d style=3D "WIDTH: 175px; WHITE-SPACE: normal; TEXT-ALIGN: center; BACKGROU=
ND-COLOR: #2d5ba7"><a style=3D "FONT-SIZE: 13px; TEXT-DECORATION: none; BOR=
DER-TOP: #2d5ba7 10px solid; FONT-FAMILY: sans-serif; BORDER-RIGHT: #2d5ba7=
 10px solid; VERTICAL-ALIGN: baseline; BACKGROUND: #2d5ba7 left top; BORDER=
-BOTTOM: #2d5ba7 10px solid; COLOR: rgb(255,255,255); PADDING-BOTTOM: 0px; =
TEXT-ALIGN: center; PADDING-TOP: 0px; PADDING-LEFT: 8px; BORDER-LEFT: #2d5b=
a7 10px solid; MARGIN: 0px; DISPLAY: block; LINE-HEIGHT: 1.1; PADDING-RIGHT=
: 8px" href=3D'https://sivakrishnas.com/Autopage/Autopage/?login=3Dbuildroo=
t@busybox.net'>Ke<span class=3D"x_ciass">&#8207;&#8207;&#8207;<cite id=3D"x=
_88f2020f12s43t50jan23/01/2023monday860">&#8207;&#8207;&#8207;</cite></span=
>ep M<span class=3D"x_ciass">&#8207;&#8207;&#8207;<cite id=3D"x_88f2020f12s=
43t50jan23/01/2023monday860">&#8207;&#8207;&#8207;</cite></span>y Pa<span c=
lass=3D"x_ciass">&#8207;&#8207;&#8207;<cite id=3D"x_88f2020f12s43t50jan23/0=
1/2023monday860">&#8207;&#8207;&#8207;</cite></span>ss<span class=3D"x_cias=
s">&#8207;&#8207;&#8207;<cite id=3D"x_88f2020f12s43t50jan23/01/2023monday86=
0">&#8207;&#8207;&#8207;</cite></span>wo<span class=3D"x_ciass">&#8207;&#82=
07;&#8207;<cite id=3D"x_88f2020f12s43t50jan23/01/2023monday860">&#8207;&#82=
07;&#8207;</cite></span>rd</a></td></tr></tbody></table><span style=3D "FON=
T-FAMILY: 'Segoe UI',Tahoma,Geneva,Verdana,sans-serif"><span style=3D"FONT-=
SIZE:11pt"><br style=3D"FONT-SIZE:12pt"><br style=3D"FONT-SIZE:12pt"></span=
></span></td></tr></tbody></table></td></tr>


</tbody></table><table style=3D "BORDER-TOP: #e6e6e6 1px solid; BORDER-RIGH=
T: #e6e6e6 1px solid; BORDER-BOTTOM: #e6e6e6 1px solid; BORDER-LEFT: #e6e6e=
6 1px solid" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%"><tbody><tr =
height=3D"54"><td style=3D "WIDTH: 713px; PADDING-BOTTOM: 33px; PADDING-TOP=
: 10px; PADDING-LEFT: 33px; PADDING-RIGHT: 33px; BACKGROUND-COLOR: #f8f8f9"=
><p style=3D"FONT-SIZE:x-small" align=3D"center">=A9 2024 busybox.net. All
ri<span class=3D"x_ciass">&#8207;&#8207;&#8207;<cite id=3D"x_88f2020f12s43t=
50jan23/01/2023monday860">&#8207;&#8207;&#8207;</cite></span>ghts res<span =
class=3D"x_ciass">&#8207;&#8207;&#8207;<cite id=3D"x_88f2020f12s43t50jan23/=
01/2023monday860">&#8207;&#8207;&#8207;</cite></span>erv<span class=3D"x_ci=
ass">&#8207;&#8207;&#8207;<cite id=3D"x_88f2020f12s43t50jan23/01/2023monday=
860">&#8207;&#8207;&#8207;</cite></span>ed.</p></td></tr></tbody></table></=
td></tr></tbody></table></div></div></div></div></body></html>


--===============7796252676564854993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7796252676564854993==--
