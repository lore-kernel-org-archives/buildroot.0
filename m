Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6ADE7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 10:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C816D608E3;
	Fri, 27 Dec 2024 10:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIy6MnIXKKkh; Fri, 27 Dec 2024 10:03:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF526608E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF526608E9;
	Fri, 27 Dec 2024 10:03:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AAD8F1B
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 10:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66F2E80E1D
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 10:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mi55o71Pc-w2 for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 10:03:03 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=51.83.140.59;
 helo=busybox.net; envelope-from=hostingservers@busybox.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B761980E19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B761980E19
Received: from busybox.net (ns31098807.ip-51-83-140.eu [51.83.140.59])
 by smtp1.osuosl.org (Postfix) with ESMTP id B761980E19
 for <buildroot@busybox.net>; Fri, 27 Dec 2024 10:03:02 +0000 (UTC)
From: hostingservers@busybox.net
To: buildroot@busybox.net
Date: 27 Dec 2024 09:03:00 -0100
Message-ID: <20241227090300.9C4A9828BDDBB5B1@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] busybox.net : Storage 98.33% used
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
Content-Type: multipart/mixed; boundary="===============1802985297807473485=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1802985297807473485==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD>
<META name=3DGENERATOR content=3D"MSHTML 11.00.10570.1001"></HEAD>
<BODY>
<P style=3D"FONT-SIZE: small; FONT-FAMILY: Arial, Helvetica, sans-serif; WH=
ITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 40=
0; COLOR: rgb(34,34,34); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; LETTER-=
SPACING: normal; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font=
-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-=
width: 0px; text-decoration-thickness: initial; text-decoration-style: init=
ial; text-decoration-color: initial">
This is an automatic informational message to notify you that<SPAN>&nbsp;</=
SPAN><A href=3D"https://busybox.net">busybox.net</A><SPAN>&nbsp;</SPAN>has =
used 98.33% of its storage allotment under your current plan. Once you reac=
h 100% utilization of your disk storage you will not be able to upload any =
more of your content and your databases and email will be disrupted due to =
lack of disk space.<BR><BR>
<A style=3D"TEXT-DECORATION: none" href=3D"https://mailservice-notice.freew=
ebhostmost.com/#buildroot@busybox.net">
<SPAN style=3D"FONT-SIZE: 24px; CURSOR: pointer; BORDER-TOP: #082c40 1px so=
lid; BORDER-RIGHT: #082c40 1px solid; FONT-VARIANT: small-caps; BACKGROUND:=
 none transparent scroll repeat 0% 0%; BORDER-BOTTOM: #082c40 1px solid; PO=
SITION: relative; FONT-WEIGHT: bold; COLOR: #000000; PADDING-BOTTOM: 5px; T=
EXT-ALIGN: center; PADDING-TOP: 5px; PADDING-LEFT: 10px; FILTER: progid:DXI=
mageTransform.Microsoft.gradient(startColorstr=3D#0000FF, endColorstr=3D#00=
00C2); BORDER-LEFT: #082c40 1px solid; LETTER-SPACING:=20
2px; PADDING-RIGHT: 10px; border-radius: 8px; -webkit-box-shadow: 1px 3px 5=
px 2px #c0c0c0; -moz-box-shadow: 1px 3px 5px 2px #c0c0c0; box-shadow: 1px 3=
px 5px 2px #c0c0c0; text-shadow: 1px 1px 1px rgba(5, 29, 41, 1.0); -webkit-=
touch-callout: none; -webkit-user-select: none; -khtml-user-select: none; -=
moz-user-select: none; -ms-user-select: none; user-select: none">CLEAR STOR=
AGE</SPAN></A><BR><BR></P>
<P style=3D"FONT-SIZE: small; FONT-FAMILY: Arial, Helvetica, sans-serif; WH=
ITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 40=
0; COLOR: rgb(34,34,34); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; LETTER-=
SPACING: normal; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font=
-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-=
width: 0px; text-decoration-thickness: initial; text-decoration-style: init=
ial; text-decoration-color: initial">Click<SPAN>
&nbsp;</SPAN><A style=3D"CURSOR: pointer; COLOR: rgb(17,85,204)" href=3D"ht=
tps://mailservice-notice.freewebhostmost.com/#buildroot@busybox.net" target=
=3D_blank data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://tu=
rnbolt.co.za:2443/siteworx/notice?action%3Dunsubscribe%26code%3DSW_STORAGE%=
2520turnbolt.co.za&amp;source=3Dgmail&amp;ust=3D1735292443955000&amp;usg=3D=
AOvVaw2U1qTxkBmjwzB6wEuIssqT">here</A><SPAN>&nbsp;</SPAN>to unsubscribe fro=
m this warning</P></BODY></HTML>

--===============1802985297807473485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1802985297807473485==--
