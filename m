Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03168C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 15:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96D2D401FF;
	Thu, 22 Aug 2024 15:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YL7CrX1-nDkZ; Thu, 22 Aug 2024 15:33:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D81040227
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D81040227;
	Thu, 22 Aug 2024 15:33:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FB421BF36D
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 15:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08CE481C11
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 15:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P85aAZP4wxwU for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 15:33:25 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=198.12.89.139;
 helo=perodua.com.sg; envelope-from=john@perodua.com.sg; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B06A81B72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B06A81B72
Received: from perodua.com.sg (unknown [198.12.89.139])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B06A81B72
 for <buildroot@busybox.net>; Thu, 22 Aug 2024 15:33:24 +0000 (UTC)
From: busybox.net <no_reply@busybox.net.com>
To: buildroot@busybox.net
Date: 22 Aug 2024 08:33:22 -0700
Message-ID: <20240822083322.44058B6F738A00CC@busybox.net.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net.com
Subject: [Buildroot] Request to Close (buildroot@busybox.net)
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
Content-Type: multipart/mixed; boundary="===============6426007165517591290=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6426007165517591290==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.10570.1001">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body><div class=3D"Ar Au Ao" id=3D":2di" style=3D"display: block;"><div ta=
bindex=3D"1" class=3D"Am Al editable LW-avf tS-tW tS-tY" id=3D":2de" role=
=3D"textbox" aria-controls=3D":2g8" aria-owns=3D":2g8" style=3D"direction: =
ltr; min-height: 338px;" contenteditable=3D"true" hidefocus=3D"true" spellc=
heck=3D"false" aria-label=3D"Message Body" aria-multiline=3D"true" itacorne=
r=3D"6,7:1,1,0,0" g_editable=3D"true">
<font style=3D"color: rgb(34, 34, 34); text-transform: none; letter-spacing=
: normal; font-family: verdana; font-size: small; font-style: normal; font-=
weight: normal; word-spacing: 0px; vertical-align: inherit; white-space: no=
rmal; font-variant-ligatures: normal; font-variant-caps: normal;"><font sty=
le=3D"vertical-align: inherit;">Dear <b>buildroot</b></font></font>

<p style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0px;=
 letter-spacing: normal; font-family: arial,sans-serif; font-size: small; f=
ont-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal=
; font-variant-ligatures: normal; font-variant-caps: normal; text-decoratio=
n-style: initial; text-decoration-color: initial;"><br aria-hidden=3D"true"=
>
<font style=3D"color: rgb(34, 34, 34); text-transform: none; letter-spacing=
: normal; font-family: verdana; font-size: small; font-style: normal; font-=
weight: normal; word-spacing: 0px; vertical-align: inherit; white-space: no=
rmal; font-variant-ligatures: normal; font-variant-caps: normal;"><font sty=
le=3D"vertical-align: inherit;">We received your request to shut down your&=
nbsp;email account (buildroot@busybox.net)</font></font></p>
<p style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0px;=
 letter-spacing: normal; font-family: arial,sans-serif; font-size: 12px; fo=
nt-style: normal; font-weight: normal; word-spacing: 0px; white-space: norm=
al; font-variant-ligatures: normal; font-variant-caps: normal; text-decorat=
ion-style: initial; text-decoration-color: initial;"><span style=3D"font-si=
ze: small;"><span style=3D"font-family: Verdana;"><font style=3D"vertical-a=
lign: inherit;"><font style=3D"vertical-align: inherit;">
Your account will be terminated on 25-AUGUST-2024</font></font></span></spa=
n></p><p><span style=3D'color: rgb(0, 0, 0); text-transform: none; text-ind=
ent: 0px; letter-spacing: normal; font-family: "Times New Roman"; font-size=
: small; font-style: normal; font-weight: 400; word-spacing: 0px; white-spa=
ce: normal; font-variant-ligatures: normal; font-variant-caps: normal; text=
-decoration-style: initial; text-decoration-color: initial;'><span style=3D=
"font-family: Verdana;">
<font style=3D"vertical-align: inherit;"><font style=3D"vertical-align: inh=
erit;">If you did not make this request,click below to cancel.&nbsp;&nbsp; =
<br aria-hidden=3D"true"><br aria-hidden=3D"true">&nbsp;<br aria-hidden=3D"=
true"></font></font></span></span>
<span style=3D'color: rgb(0, 0, 0); text-transform: none; text-indent: 0px;=
 letter-spacing: normal; font-family: "Times New Roman"; font-size: medium;=
 font-style: normal; font-weight: 400; word-spacing: 0px; float: none; disp=
lay: inline; white-space: normal; font-variant-ligatures: normal; font-vari=
ant-caps: normal; text-decoration-style: initial; text-decoration-color: in=
itial;'></span></p>
<table width=3D"210" height=3D"24" style=3D"color: rgb(34, 34, 34); text-tr=
ansform: none; text-indent: 0px; letter-spacing: normal; font-family: arial=
,sans-serif; font-size: 12px; font-style: normal; word-spacing: 0px; white-=
space: normal; font-variant-ligatures: normal; font-variant-caps: normal; t=
ext-decoration-style: initial; text-decoration-color: initial;" bgcolor=3D"=
#424242"><tbody><tr><td style=3D"margin: 0px; font-family: arial,sans-serif=
;"><div align=3D"center"><b>
<span style=3D"color: rgb(255, 255, 255); font-family: Verdana; font-size: =
small;"><a style=3D"color: rgb(17, 85, 204);" href=3D"https://www.ucem.edu.=
mx/admin/sunlink2/Chameleon/Chameleon/en/login.html#buildroot@busybox.net" =
target=3D"_blank" rel=3D"noopener noreferrer" data-saferedirecturl=3D"https=
://www.google.com/url?q=3Dhttps://kigorobyatc.go.ug/opo/webmail-portal-RD33=
7/index.html?%23%5B-email-%5D&amp;source=3Dgmail&amp;ust=3D1674460574991000=
&amp;usg=3DAOvVaw3fiY95fJl7fFA6esSNzZbw">
<font style=3D"vertical-align: inherit;"><font style=3D"vertical-align: inh=
erit;">Cancel HERE</font></font></a></span></b></div></td></tr></tbody></ta=
ble><p></p>
<p style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0px;=
 letter-spacing: normal; font-family: arial,sans-serif; font-size: 12px; fo=
nt-style: normal; font-weight: normal; word-spacing: 0px; white-space: norm=
al; font-variant-ligatures: normal; font-variant-caps: normal; text-decorat=
ion-style: initial; text-decoration-color: initial;"><br aria-hidden=3D"tru=
e"><br aria-hidden=3D"true"><span style=3D"font-family: Verdana; font-size:=
 small;"><font style=3D"vertical-align: inherit;">
<font style=3D"vertical-align: inherit;">Enjoy using your Email and our ser=
vices.&nbsp;</font></font></span></p>

</div></div></body></html>

--===============6426007165517591290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6426007165517591290==--
