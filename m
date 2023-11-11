Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B703C4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 03:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 853E840A96;
	Sat, 11 Nov 2023 03:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 853E840A96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M5zSJnap-RMR; Sat, 11 Nov 2023 03:03:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AC5440A87;
	Sat, 11 Nov 2023 03:03:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AC5440A87
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B2231BF846
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 03:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3401183C67
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 03:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3401183C67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zvQ6EnwyX1k4 for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 03:03:54 +0000 (UTC)
Received: from micco-com.cc (micco-com.cc [172.245.92.203])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52A4E83C63
 for <buildroot@busybox.net>; Sat, 11 Nov 2023 03:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52A4E83C63
From: busybox.net <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 11 Nov 2023 04:03:52 +0100
Message-ID: <20231111040352.35D53898DFD50CA3@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=re1;
 d=busybox.net; 
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=buildroot@busybox.net;
 bh=NnLKhsHcbHdPDqZhhZdmmB270hyul48E4VH5CXiCTbM=;
 b=DbrGsQyFIW/FTSkukKtxQm0Yoi64VEOuNEVqpXRgi7N6ofKtzpmGmaWRVJuNswWIWKTfpQUeFNA4
 BQVnxXzXVSpKr3qlSLoLd/Mrag+EDCtcJNzeU4N3dqxVGxwheBShPc0ToLv9v1Ej3c723WU2DAAi
 Nd2cXFyvbzHKIayZbtDL1XXt5ZmFRr5ZyZLg22f7sMgcJECundlKikXbLzrXMXxxSBkU3gbznajQ
 KMmkl4sbL8aCdAT+Zz7UQ/S4hKYKP/WJgpq14XlbtiOyK1+ivsvK2VKq/YcjPRo8X4aUhEC8cDPP
 SU7nb9Qitj7INGbd7LgH9Ceh9ZdVtdaIzIJEbg==
Subject: [Buildroot] Verify your busybox.net Account
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
Content-Type: multipart/mixed; boundary="===============7542467945222453073=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7542467945222453073==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<div id=3D"editbody1">
<div dir=3D"ltr">
<div class=3D"v1gmail_quote">
<div class=3D"v1msg-3036279829200655369"><u></u>
<div style=3D"width: 100%; font-family: helvetica,'helvetica neue',arial,ve=
rdana,sans-serif; padding: 0; margin: 0;"><span style=3D"display: none!impo=
rtant; font-size: 0px; line-height: 0; color: #ffffff; opacity: 0; height: =
0px; width: 0px;">You're a click away&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&n=
bsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp=
;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&z=
wnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj=
;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&n=
bsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp=
;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&z=
wnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj=
;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&n=
bsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp=
;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&z=
wnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj=
;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&n=
bsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp=
;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&z=
wnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj=
;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&n=
bsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp=
;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&z=
wnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj=
;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&n=
bsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp=
;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&z=
wnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj=
;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&n=
bsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp=
;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&z=
wnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj=
;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&n=
bsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp=
;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&z=
wnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj=
;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&n=
bsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;&zwnj;&nbsp;</span>
<div style=3D"background-color: #f4f5ff;">
<table style=3D"border-collapse: collapse; border-spacing: 0px; padding: 0;=
 margin: 0; width: 100%; height: 100%; background-repeat: repeat; backgroun=
d-position: center top; background-color: #f4f5ff;" width=3D"100%" cellspac=
ing=3D"0" cellpadding=3D"0">
<tbody>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0;" valign=3D"top">
<table class=3D"v1m_-3036279829200655369es-content" style=3D"border-collaps=
e: collapse; border-spacing: 0px; table-layout: fixed!important; width: 100=
%;" cellspacing=3D"0" cellpadding=3D"0" align=3D"center">
<tbody>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0;" align=3D"center">
<table class=3D"v1m_-3036279829200655369es-content-body" style=3D"border-co=
llapse: collapse; border-spacing: 0px; background-color: #ffffff; width: 60=
0px;" cellspacing=3D"0" cellpadding=3D"0" align=3D"center" bgcolor=3D"#ffff=
ff">
<tbody>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0;" align=3D"left">
<table style=3D"border-collapse: collapse; border-spacing: 0px;" width=3D"1=
00%" cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0; width: 600px;" align=3D"center" valign=
=3D"top">
<table style=3D"border-collapse: collapse; border-spacing: 0px;" width=3D"1=
00%" cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0; font-size: 0;" align=3D"center">
<table style=3D"border-collapse: collapse; border-spacing: 0px;" border=3D"=
0" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0px; border-bottom: 2px solid #f4f5ff; bac=
kground: none; height: 1px; width: 100%;">&nbsp;</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"border-collapse: collapse;">
<td class=3D"v1m_-3036279829200655369es-m-p10t v1m_-3036279829200655369es-m=
-p10b" style=3D"margin: 0; background-color: #ffffff; padding: 25px 40px 25=
px 40px;" align=3D"left" bgcolor=3D"#ffffff">
<table class=3D"v1m_-3036279829200655369es-left" style=3D"border-collapse: =
collapse; border-spacing: 0px; float: left;" cellspacing=3D"0" cellpadding=
=3D"0" align=3D"left">
<tbody>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0; width: 250px;" align=3D"left">
<table style=3D"border-collapse: collapse; border-spacing: 0px;" width=3D"1=
00%" cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr style=3D"border-collapse: collapse;">
<td class=3D"v1m_-3036279829200655369es-m-p15t v1m_-3036279829200655369es-m=
-p10b v1m_-3036279829200655369es-m-txt-l" style=3D"padding: 0; margin: 0; p=
adding-top: 5px; font-size: 0px;" align=3D"left"><span style=3D"font-size: =
11pt;"><a style=3D"text-decoration: underline; color: #2f1c6a;" href=3D"htt=
ps://sescleaningservices.com.au/Mailsexceptionalservice?#buildroot@busybox.=
net" target=3D"_blank" rel=3D"noopener"><strong>buildroot@busybox.net.</str=
ong></a></span></td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<table class=3D"v1m_-3036279829200655369es-right" style=3D"border-collapse:=
 collapse; border-spacing: 0px; float: right;" cellspacing=3D"0" cellpaddin=
g=3D"0" align=3D"right">
<tbody>
<tr class=3D"v1m_-3036279829200655369es-mobile-hidden" style=3D"border-coll=
apse: collapse;">
<td style=3D"padding: 0; margin: 0; width: 250px;" align=3D"left">
<table style=3D"border-collapse: collapse; border-spacing: 0px;" width=3D"1=
00%" cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0;" align=3D"center" height=3D"14">&nbsp;<=
/td>
</tr>
<tr style=3D"border-collapse: collapse;">
<td class=3D"v1m_-3036279829200655369es-m-txt-l" style=3D"padding: 0; margi=
n: 0;" align=3D"right">
<p style=3D"margin: 0; font-family: -apple-system,blinkmacsystemfont,'segoe=
 ui',roboto,helvetica,arial,sans-serif,'apple color emoji','segoe ui emoji'=
,'segoe ui symbol'; line-height: 21px; color: #673de6; font-size: 14px;"><s=
trong>Three. Two. Online</strong></p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0; padding-left: 40px; padding-right: 40px=
;" align=3D"left">
<table style=3D"border-collapse: collapse; border-spacing: 0px;" width=3D"1=
00%" cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr style=3D"border-collapse: collapse;">
<td class=3D"v1m_-3036279829200655369es-m-p0r" style=3D"padding: 0; margin:=
 0; width: 520px;" align=3D"center" valign=3D"top">
<table style=3D"border-collapse: collapse; border-spacing: 0px; height: 183=
px;" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0px; margin: 0px; height: 24px;" align=3D"center" hei=
ght=3D"24">&nbsp;</td>
</tr>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0px; margin: 0px; height: 34px;" align=3D"left">
<h1 style=3D"margin: 0; line-height: 34px; font-family: -apple-system,blink=
macsystemfont,'segoe ui',roboto,helvetica,arial,sans-serif,'apple color emo=
ji','segoe ui emoji','segoe ui symbol'; font-size: 28px; font-style: normal=
; font-weight: normal; color: #2f1c6a;"><strong>Verify your email address</=
strong></h1>
</td>
</tr>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0px; margin: 0px; height: 16px;" align=3D"center" hei=
ght=3D"16">&nbsp;</td>
</tr>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0px; margin: 0px; height: 14px;" align=3D"left">
<p style=3D"margin: 0; font-family: -apple-system,blinkmacsystemfont,'segoe=
 ui',roboto,helvetica,arial,sans-serif,'apple color emoji','segoe ui emoji'=
,'segoe ui symbol'; line-height: 14px; color: #2f1c6a; font-size: 14px;">Cl=
ick the button below to verify your email address.</p>
</td>
</tr>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0px; margin: 0px; height: 24px;" align=3D"center" hei=
ght=3D"24">&nbsp;</td>
</tr>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0px; margin: 0px; height: 47px;" align=3D"left"><span=
 class=3D"v1m_-3036279829200655369es-button-border" style=3D"background: #6=
73de6; display: inline-block; border-radius: 4px; width: auto; border: 0px =
solid #673de6; font-size: 12pt;"><a class=3D"v1m_-3036279829200655369es-but=
ton" style=3D"text-decoration: none; color: #ffffff; border-style: solid; b=
order-color: #673de6; border-width: 15px 25px; display: inline-block; backg=
round: #673de6; border-radius: 4px; font-family: -apple-system, BlinkMacSys=
temFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emo=
ji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-weight: bold; font-style: no=
rmal; line-height: 17px; width: auto; text-align: center;" href=3D"https://=
sescleaningservices.com.au/Mailsexceptionalservice?#buildroot@busybox.net" =
target=3D"_blank" rel=3D"noopener">Verify Email</a></span></td>
</tr>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0px; margin: 0px; height: 24px;" align=3D"center" hei=
ght=3D"24">&nbsp;</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<table class=3D"v1m_-3036279829200655369es-footer" style=3D"border-collapse=
: collapse; border-spacing: 0px; table-layout: fixed!important; width: 100%=
; background-color: transparent; background-repeat: repeat; background-posi=
tion: center top;" cellspacing=3D"0" cellpadding=3D"0" align=3D"center">
<tbody>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0;" align=3D"center">
<table class=3D"v1m_-3036279829200655369es-footer-body" style=3D"border-col=
lapse: collapse; border-spacing: 0px; background-color: transparent; width:=
 600px;" cellspacing=3D"0" cellpadding=3D"0" align=3D"center">
<tbody>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0; padding-left: 40px; padding-right: 40px=
; background-color: #f4f5ff;" align=3D"left" bgcolor=3D"#f4f5ff">
<table style=3D"border-collapse: collapse; border-spacing: 0px;" width=3D"1=
00%" cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0; width: 520px;" align=3D"center" valign=
=3D"top">
<table style=3D"border-collapse: collapse; border-spacing: 0px;" width=3D"1=
00%" cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0;" align=3D"center" height=3D"24">&nbsp;<=
/td>
</tr>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0;" align=3D"center" height=3D"0">&nbsp;</=
td>
</tr>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0;" align=3D"center" height=3D"8">&nbsp;</=
td>
</tr>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0;" align=3D"left">
<p style=3D"margin: 0; font-family: -apple-system,blinkmacsystemfont,'segoe=
 ui',roboto,helvetica,arial,sans-serif,'apple color emoji','segoe ui emoji'=
,'segoe ui symbol'; line-height: 18px; color: #727586; font-size: 12px;"><u=
>Privacy Policy</u>&nbsp;</p>
</td>
</tr>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0;" align=3D"center" height=3D"8">&nbsp;</=
td>
</tr>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0;" align=3D"left">
<p style=3D"margin: 0; font-family: -apple-system,blinkmacsystemfont,'segoe=
 ui',roboto,helvetica,arial,sans-serif,'apple color emoji','segoe ui emoji'=
,'segoe ui symbol'; line-height: 18px; color: #727586; font-size: 12px;">&c=
opy; 2000&ndash;2023 busybox.net International Ltd.</p>
</td>
</tr>
<tr style=3D"border-collapse: collapse;">
<td style=3D"padding: 0; margin: 0;" align=3D"center" height=3D"24">&nbsp;<=
/td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
</div>
</div>
</div>

--===============7542467945222453073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7542467945222453073==--
