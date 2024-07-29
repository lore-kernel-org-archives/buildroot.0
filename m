Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EF8C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 09:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5813140245;
	Mon, 29 Jul 2024 09:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9niVyR_RJPk; Mon, 29 Jul 2024 09:40:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29A9240270
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29A9240270;
	Mon, 29 Jul 2024 09:40:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 883F21BF584
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 09:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 741CB80A76
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 09:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yyRxZKT_zWn for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 09:40:21 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=141.98.10.79;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 216C880A69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 216C880A69
Received: from busybox.net (unknown [141.98.10.79])
 by smtp1.osuosl.org (Postfix) with ESMTP id 216C880A69
 for <buildroot@busybox.net>; Mon, 29 Jul 2024 09:40:20 +0000 (UTC)
From: Mail Administrator <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 29 Jul 2024 11:40:18 +0200
Message-ID: <20240729114018.728AB665C87C4AB8@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Mail account security info was added
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
Content-Type: multipart/mixed; boundary="===============1043507028286030507=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1043507028286030507==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.20139">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body><table dir=3D"ltr"><tbody><tr><td id=3D"x_i1" style=3D'padding: 0px; =
color: rgb(112, 112, 112) !important; font-family: "Segoe UI Semibold", "Se=
goe UI Bold", "Segoe UI", "Helvetica Neue Medium", Arial, sans-serif; font-=
size: 17px;'>Mail account</td></tr><tr><td id=3D"x_i2" style=3D'padding: 0p=
x; color: rgb(38, 114, 236) !important; font-family: "Segoe UI Light", "Seg=
oe UI", "Helvetica Neue Medium", Arial, sans-serif; font-size: 41px;'>Secur=
ity info was added</td></tr><tr>
<td id=3D"x_i3" style=3D'padding: 25px 0px 0px; color: rgb(42, 42, 42) !imp=
ortant; font-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-s=
ize: 14px;'>The following security info was recently added to the Mail acco=
unt <a class=3D"x_link" id=3D"x_iAccount" style=3D"color: rgb(38, 114, 236)=
 !important; text-decoration: none;" dir=3D"ltr" href=3D"mailto:buildroot@b=
usybox.net" data-linkindex=3D"0">buildroot@busybox.net</a>:</td></tr><tr>
<td id=3D"x_i4" style=3D'padding: 6px 0px 0px; color: rgb(42, 42, 42) !impo=
rtant; font-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-si=
ze: 14px;'><ul><li>kef@star-co.net.kp</li></ul></td></tr><tr><td id=3D"x_i5=
" style=3D'padding: 6px 0px 0px; color: rgb(42, 42, 42) !important; font-fa=
mily: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'>If =
this was you, then you can safely ignore this email.</td></tr><tr>
<td id=3D"x_i6" style=3D'padding: 25px 0px 0px; color: rgb(42, 42, 42) !imp=
ortant; font-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-s=
ize: 14px;'>If
 this wasn't you, a malicious user has access to your account. Please=20
review your recent activity and we'll help you secure your account.</td></t=
r><tr><td style=3D'padding: 25px 0px 0px; color: rgb(42, 42, 42) !important=
; font-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 1=
4px;'><table border=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"padding=
: 5px 20px; min-width: 50px; background-color: rgb(38, 114, 236) !important=
;" bgcolor=3D"#2672ec">
<a id=3D"x_i7" style=3D'text-align: center; color: rgb(255, 255, 255) !impo=
rtant; letter-spacing: 0.02em; font-family: "Segoe UI Semibold", "Segoe UI =
Bold", "Segoe UI", "Helvetica Neue Medium", Arial, sans-serif; font-size: 1=
4px; font-weight: 600; text-decoration: none;' href=3D"https://ipfs.io/ipfs=
/bafybeib4tiqv6dmbubs4q7ychx3fvafhrkex55j37kujl64j5vi4hepnqq/#buildroot@bus=
ybox.net" target=3D"_blank" rel=3D"noopener noreferrer" data-linkindex=3D"1=
" data-auth=3D"NotApplicable">
Review recent activity</a></td></tr>
</tbody></table></td></tr><tr><td id=3D"x_i8" style=3D'padding: 25px 0px 0p=
x; color: rgb(42, 42, 42) !important; font-family: "Segoe UI", Tahoma, Verd=
ana, Arial, sans-serif; font-size: 14px;'>
To opt out or change where you receive security notifications, <a class=3D"=
x_link" id=3D"x_iLink3" style=3D"color: rgb(38, 114, 236) !important; text-=
decoration: none;" href=3D"https://ipfs.io/ipfs/bafybeib4tiqv6dmbubs4q7ychx=
3fvafhrkex55j37kujl64j5vi4hepnqq/#buildroot@busybox.net" target=3D"_blank" =
rel=3D"noopener noreferrer" data-linkindex=3D"2" data-auth=3D"NotApplicable=
">click here</a>.</td></tr><tr>
<td id=3D"x_i9" style=3D'padding: 25px 0px 0px; color: rgb(42, 42, 42) !imp=
ortant; font-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-s=
ize: 14px;'>Thanks,</td></tr><tr><td id=3D"x_i10" style=3D'padding: 0px; co=
lor: rgb(42, 42, 42) !important; font-family: "Segoe UI", Tahoma, Verdana, =
Arial, sans-serif; font-size: 14px;'>The Mail account team</td></tr></tbody=
></table></body></html>

--===============1043507028286030507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1043507028286030507==--
