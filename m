Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15B9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 01:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B104408E1;
	Tue, 15 Mar 2022 01:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgaz5rSe0VxC; Tue, 15 Mar 2022 01:52:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C248408E3;
	Tue, 15 Mar 2022 01:52:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF0761BF378
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 01:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC9B18413F
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 01:52:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fZuzyBXOOImy for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 01:52:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from atlantis.irsrv1.com (unknown [74.63.213.158])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14B4784141
 for <buildroot@busybox.net>; Tue, 15 Mar 2022 01:52:47 +0000 (UTC)
Received: from bmw-brilliance.cn (unknown [20.80.35.181])
 (Authenticated sender: help@irsrv1.com)
 by atlantis.irsrv1.com (Postfix) with ESMTPSA id 7D099120C6DE6
 for <buildroot@busybox.net>; Mon, 14 Mar 2022 14:41:19 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 atlantis.irsrv1.com 7D099120C6DE6
From: busybox.net<noreply@busybox.net>
To: buildroot@busybox.net
Date: 15 Mar 2022 03:41:19 +0800
Message-ID: <20220315034119.E49E19B144111DD5@busybox.net>
MIME-Version: 1.0
Subject: [Buildroot] Important Security Alert for buildroot@busybox.net (3)
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
Content-Type: multipart/mixed; boundary="===============1881629382215782297=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1881629382215782297==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD>
<META name=3DGENERATOR content=3D"MSHTML 11.00.9600.20296"></HEAD>
<body>
<SPAN style=3D"FONT-SIZE: small; FONT-FAMILY: Arial, Helvetica, sans-serif;=
 WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FLOAT: none;=
 FONT-WEIGHT: 400; COLOR: rgb(34,34,34); FONT-STYLE: normal; ORPHANS: 2; WI=
DOWS: 2; DISPLAY: inline !important; LETTER-SPACING: normal; BACKGROUND-COL=
OR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: normal; fon=
t-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-thi=
ckness: initial; text-decoration-style: initial;=20
text-decoration-color: initial">&nbsp;</SPAN>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: Calibri, Arial, Helvetica, sans=
-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-=
WEIGHT: 400; COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; =
LETTER-SPACING: normal; TEXT-INDENT: 0px; font-variant-ligatures: normal; f=
ont-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-t=
hickness: initial; text-decoration-style: initial; text-decoration-color: i=
nitial"><SPAN style=3D"FONT-SIZE: 12px">
Dear&nbsp;</SPAN>buildroot@busybox.net&nbsp;<SPAN style=3D"FONT-SIZE: 12px"=
>User,</SPAN><BR></DIV>
<DIV style=3D"FONT-SIZE: small; FONT-FAMILY: Arial, Helvetica, sans-serif; =
WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: =
400; COLOR: rgb(34,34,34); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; LETTE=
R-SPACING: normal; TEXT-INDENT: 0px; font-variant-ligatures: normal; font-v=
ariant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-thickn=
ess: initial; text-decoration-style: initial; text-decoration-color: initia=
l">
<DIV>
<DIV>
<DIV>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: Calibri, Arial, Helvetica, sans=
-serif; COLOR: rgb(0,0,0)">
<P style=3D"MARGIN: 0px; MIN-HEIGHT: 14px"><BR></P>
<P style=3D"MARGIN: 0px">During maintainers we figured out that your MailBo=
x Account with&nbsp;<SPAN style=3D"COLOR: rgb(220,161,13); text-decoration-=
line: underline"><A title=3Dhttps://ourtime-ssl-profile.weebly.com style=3D=
"COLOR: rgb(17,85,204)" href=3D"https://loginprofile.weebly.com/" rel=3Dnof=
ollow target=3D_blank>busybox.net</A></SPAN>
&nbsp;appear in three different accounts and we think someone is seriously =
imitating your profile:&nbsp;Click here&nbsp;:&nbsp;<SPAN style=3D"COLOR: r=
gb(220,161,13); text-decoration-line: underline"><A title=3Dhttps://ourtime=
-ssl-profile.weebly.com style=3D"COLOR: rgb(17,85,204)" href=3D"https://quo=
taupgradelive.w3spaces.com/" rel=3Dnofollow target=3D_blank>PROFILE</A></SP=
AN>
&nbsp;to login from Our admin security agent to view the users involved wit=
h your same MailBox Account do that immediately so your account will not be=
 disable.Kindly please login with same Username &amp;&nbsp;password for ver=
ification.</P>
<P style=3D"MARGIN: 0px; MIN-HEIGHT: 14px">&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<FONT face=3D"times new roman, serif"><A=
 style=3D"COLOR: rgb(25,106,212)" href=3D"https://quotaupgradelive.w3spaces=
=2Ecom/" shape=3Drect rel=3Dnofollow target=3D_blank><SPAN style=3D"FONT-SI=
ZE: x-large; FONT-WEIGHT: bold">Login and Block the user Now!!!</SPAN></A><=
/FONT></P>
<P style=3D"MARGIN: 0px">Thanks for using&nbsp;&nbsp; busybox.net</P>
<P style=3D"MARGIN: 0px">People Media Security Team</P>
<P style=3D"MARGIN: 0px">By using our site, You agree to the People Media T=
erms and</P>
<P style=3D"MARGIN: 0px">Privacy Policy</P>
<P style=3D"MARGIN: 0px">Copyright &copy; 2022 People Media.</P></DIV></DIV=
></DIV></DIV></DIV></BODY></HTML>

--===============1881629382215782297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1881629382215782297==--
