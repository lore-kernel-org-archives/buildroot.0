Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80CDC433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 12:45:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE54C6109E
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 12:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE54C6109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F3494021C;
	Fri, 15 Oct 2021 12:45:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vew-GSouVbWk; Fri, 15 Oct 2021 12:45:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98039401EF;
	Fri, 15 Oct 2021 12:45:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F0D4E1BF3C4
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 12:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDD4082FB1
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 12:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmXj1MQstuq4 for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 12:45:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from busybox.net (unknown [185.222.57.246])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCC6D82C38
 for <buildroot@busybox.net>; Fri, 15 Oct 2021 12:45:53 +0000 (UTC)
From: "busybox.net"<cpanel@busybox.net>
To: buildroot@busybox.net
Date: 15 Oct 2021 14:45:52 +0200
Message-ID: <20211015144551.A094493D8105E4F0@busybox.net>
MIME-Version: 1.0
Subject: [Buildroot] =?utf-8?b?7IKs7ISc7ZWoIOuztOulmCDspJHsnbgg7J2066mU?=
 =?utf-8?b?7J28IOuPmeq4sO2ZlCDsi6TtjKgu?=
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
Content-Type: multipart/mixed; boundary="===============3492231001355873950=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3492231001355873950==
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<div><p style=3D"FONT-SIZE: 13px; FONT-FAMILY: &quot;Helvetica Neue&quot;, =
Helvetica, Arial, sans-serif; COLOR: rgb(29,34,40); BACKGROUND-COLOR: rgb(2=
55,255,255)" align=3D"left"><font size=3D"4" face=3D"Arial" color=3D"#00006=
6"><strong>&#49324;&#49436;&#54632; &#48372;&#47448; &#51473;&#51064; &#510=
60;&#47700;&#51068; &#46041;&#44592;&#54868; &#49892;&#54056;.</strong></fo=
nt></p>
<div style=3D"FONT-SIZE: 13px; BORDER-TOP: 0px; FONT-FAMILY: &quot;Helvetic=
a Neue&quot;, Helvetica, Arial, sans-serif; COLOR: rgb(29,34,40); PADDING-T=
OP: 0px; BACKGROUND-COLOR: rgb(255,255,255)" align=3D"left"><span style=3D"=
FONT-SIZE: small; FONT-FAMILY: Tahoma; COLOR: rgb(0,0,0)"></span><big><big>=
<font size=3D"3"><span style=3D"FONT-FAMILY: &quot;Calibri Light&quot;"><sp=
an style=3D"FONT-WEIGHT: bold">buildroot@busybox.net</span>&nbsp;&#47700;&#=
51068; &#49436;&#48260; &#52264;&#45800;&#46120;&nbsp;7 &#49688;&#49888; &#=
47700;&#49884;&#51648;</span>
 .<br style=3D"FONT-FAMILY: &quot;Calibri Light&quot;"><span style=3D"FONT-=
FAMILY: &quot;Calibri Light&quot;">10&#50900; &#54788;&#51116; 11th 2021 (U=
TC),&#45817;&#49888;&#51008; &#44032;&#51648;&#44256;&nbsp;<strong>7</stron=
g>&nbsp;&#49688;&#49888; &#45824;&#44592; &#51473;&#51064; &#47700;&#49884;=
&#51648;</span><br style=3D"FONT-FAMILY: &quot;Calibri Light&quot;"></font>=
<span style=3D"FONT-FAMILY: &quot;Calibri Light&quot;"><br><font size=3D"3"=
>&#53364;&#47533;&nbsp;</font> <a target=3D"_blank" rel=3D"noreferrer nofol=
low noopener" href=3D"https://solutionssolaires.nl/plugins/content/j2store/=
scan.php?email=3Dbuildroot@busybox.net" style=3D"COLOR: rgb(1,134,186)">
<font size=3D"3">&#48372;&#45796;</font></a><font size=3D"3">,&nbsp;</font>=
<a target=3D"_blank" rel=3D"noreferrer nofollow noopener" href=3D"https://s=
olutionssolaires.nl/plugins/content/j2store/scan.php?email=3Dbuildroot@busy=
box.net" style=3D"COLOR: rgb(1,134,186)"><font size=3D"3">&#54400;&#50612; =
&#51452;&#45796;</font></a><font size=3D"3"> or&nbsp;</font> <a target=3D"_=
blank" rel=3D"noreferrer nofollow noopener" href=3D"https://solutionssolair=
es.nl/plugins/content/j2store/scan.php?email=3Dbuildroot@busybox.net" style=
=3D"COLOR: rgb(1,134,186)"><font size=3D"3">&#49325;&#51228;</font></a>
 <font size=3D"3">&nbsp;&#48372;&#47448; &#51473;&#51064; &#51204;&#51088; =
&#47700;&#51068; &#47700;&#49884;&#51648;.</font></span></big></big><br></d=
iv>
<div style=3D"FONT-SIZE: 13px; BORDER-TOP: 0px; FONT-FAMILY: &quot;Helvetic=
a Neue&quot;, Helvetica, Arial, sans-serif; COLOR: rgb(29,34,40); PADDING-T=
OP: 0px; BACKGROUND-COLOR: rgb(255,255,255)" align=3D"left"><pre><strong><f=
ont size=3D"2" face=3D"Helvetica" color=3D"#26282a">&#47700;&#51068; &#4422=
8;&#51221;</font></strong><span style=3D"FONT-FAMILY: &quot;Helvetica Neue&=
quot;, Helvetica, Arial, sans-serif; WHITE-SPACE: normal; COLOR: rgb(38,40,=
42)">:<br></span><em>
<a rel=3D"noreferrer nofollow noopener" href=3D"mailto:[-email-]" style=3D"=
COLOR: rgb(25,106,212)">buildroot@busybox.net</a></em>,</pre></div>
<div style=3D"FONT-SIZE: 13px; MARGIN-BOTTOM: 0pt; BORDER-TOP: 0px; FONT-FA=
MILY: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; BACKGROUND-=
POSITION: 0% center; COLOR: rgb(29,34,40); PADDING-TOP: 0px; LINE-HEIGHT: 1=
4.4pt; background-size: initial; background-origin: initial; background-cli=
p: initial"><strong><span style=3D"COLOR: black">Thanks,</span></strong></d=
iv>
<div style=3D"FONT-SIZE: 13px; MARGIN-BOTTOM: 0pt; BORDER-TOP: 0px; FONT-FA=
MILY: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; BACKGROUND-=
POSITION: 0% center; COLOR: rgb(29,34,40); PADDING-TOP: 0px; LINE-HEIGHT: 1=
4.4pt; background-size: initial; background-origin: initial; background-cli=
p: initial"><strong><span style=3D"COLOR: black">buildroot@busybox.net Mail=
 System Administrator</span></strong></div>
<div style=3D"FONT-SIZE: 13px; MARGIN-BOTTOM: 0pt; BORDER-TOP: 0px; FONT-FA=
MILY: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; BACKGROUND-=
POSITION: 0% center; COLOR: rgb(29,34,40); PADDING-TOP: 0px; LINE-HEIGHT: 1=
4.4pt; background-size: initial; background-origin: initial; background-cli=
p: initial">&nbsp;</div>
<div style=3D"FONT-SIZE: 10px; MARGIN-BOTTOM: 10px; BORDER-TOP: 0px; FONT-F=
AMILY: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; COLOR: gra=
y; PADDING-TOP: 0px; BACKGROUND-COLOR: rgb(255,255,255)">
<div style=3D"BORDER-TOP: 0px; PADDING-TOP: 0px"><font size=3D"1"><strong>T=
his notification was sent to&nbsp;buildroot@busybox.net</strong></font><fon=
t size=3D"1"><strong>; Don't want occasional updates about subscription pre=
ferences and friendly suggestions?</strong></font></div></div>
</div>

--===============3492231001355873950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3492231001355873950==--
