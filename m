Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EB1C54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 17:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8376B40253;
	Wed, 13 Mar 2024 17:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DwWOEzha5HTV; Wed, 13 Mar 2024 17:31:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BFE840541
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BFE840541;
	Wed, 13 Mar 2024 17:31:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A9941BF592
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 17:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AB2881F87
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 17:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ynOp6cnKOpQJ for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 17:31:22 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=64.188.22.14;
 helo=busybox.net; envelope-from=noreply@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9678F81F7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9678F81F7C
Received: from busybox.net (unknown [64.188.22.14])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9678F81F7C
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 17:31:21 +0000 (UTC)
From: Noreply@busybox.net
To: buildroot@busybox.net
Date: 13 Mar 2024 10:31:19 -0700
Message-ID: <20240313103118.6697F63E7EC3ED86@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] buildroot@busybox.net Received AWB Documents via
 WeTransfer
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
Content-Type: multipart/mixed; boundary="===============2940859094433032129=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2940859094433032129==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD><TITLE></TITLE>
<META http-equiv=3DX-UA-Compatible <strong Dear cont>
<META name=3DGENERATOR content=3D"MSHTML 11.00.9600.18817"></HEAD>
<BODY>
<P>
<TABLE id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35467 class=3D"v=
1yiv2956564175gmail-m_911891310866232251gmail-x_gmail-x_yiv6729642149x_tabl=
e_full_width v1yiv2956564175yahoo-compose-table-card" style=3D"FONT-SIZE: 1=
3px; WIDTH: 600px; WHITE-SPACE: normal; WORD-SPACING: 0px; BORDER-COLLAPSE:=
 collapse; TABLE-LAYOUT: fixed; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COL=
OR: rgb(38,40,42); OUTLINE-WIDTH: medium; PADDING-BOTTOM: 0px; FONT-STYLE: =
normal; TEXT-ALIGN: left; PADDING-TOP: 0px;=20
OUTLINE-STYLE: none; PADDING-LEFT: 0px; MARGIN: 0px auto; LETTER-SPACING: n=
ormal; PADDING-RIGHT: 0px; TEXT-INDENT: 0px" cellSpacing=3D0 cellPadding=3D=
0 border=3D0>
<TBODY id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35466>
<TR id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35465>
<TD id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35464 class=3Dv1yiv=
2956564175gmail-m_911891310866232251gmail-x_gmail-x_yiv6729642149x_logo_out=
er_wrapper_td style=3D"FONT-FAMILY: arial,sans-serif; WIDTH: 600px; OUTLINE=
-WIDTH: medium; PADDING-BOTTOM: 0px; PADDING-TOP: 55px; OUTLINE-STYLE: none=
; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px" vAlign=3Dtop align=3D=
left>
<TABLE id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35578 class=3D"v=
1yiv2956564175gmail-m_911891310866232251gmail-x_gmail-x_yiv6729642149x_tabl=
e_full_width v1yiv2956564175yahoo-compose-table-card" style=3D"WIDTH: 600px=
; BORDER-COLLAPSE: collapse; TABLE-LAYOUT: fixed; OUTLINE-WIDTH: medium; PA=
DDING-BOTTOM: 0px; PADDING-TOP: 0px; OUTLINE-STYLE: none; PADDING-LEFT: 0px=
; MARGIN: 0px; PADDING-RIGHT: 0px" cellSpacing=3D0 cellPadding=3D0 border=
=3D0>
<TBODY id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35577>
<TR id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35576>
<TD id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35575 class=3Dv1yiv=
2956564175gmail-m_911891310866232251gmail-x_gmail-x_yiv6729642149x_logo_inn=
er_wrapper_td style=3D"FONT-SIZE: 10px; FONT-FAMILY: arial,sans-serif; WIDT=
H: 600px; OUTLINE-WIDTH: medium; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; OUT=
LINE-STYLE: none; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px" bgCol=
or=3D#409fff vAlign=3Dtop align=3Dleft>
<CENTER id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35574>
<TABLE class=3D"v1yiv2956564175gmail-m_911891310866232251gmail-x_gmail-x_yi=
v6729642149x_table_centered v1yiv2956564175yahoo-compose-table-card" style=
=3D"WIDTH: auto; BORDER-COLLAPSE: collapse; TABLE-LAYOUT: fixed; OUTLINE-WI=
DTH: medium; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; OUTLINE-STYLE: none; PA=
DDING-LEFT: 0px; MARGIN: 0px auto; PADDING-RIGHT: 0px" cellSpacing=3D0 cell=
Padding=3D0 align=3Dcenter border=3D0>
<TBODY>
<TR>
<TD style=3D"FONT-FAMILY: arial,sans-serif; WIDTH: 56px; OUTLINE-WIDTH: med=
ium; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; OUTLINE-STYLE: none; PADDING-LE=
FT: 0px; MARGIN: 0px; MIN-HEIGHT: 16px; PADDING-RIGHT: 0px" height=3D16 vAl=
ign=3Dtop align=3Dleft></TD></TR>
<TR>
<TD style=3D"FONT-FAMILY: arial,sans-serif; WIDTH: 56px; OUTLINE-WIDTH: med=
ium; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; OUTLINE-STYLE: none; PADDING-LE=
FT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px" vAlign=3Dtop align=3Dleft><A href=
=3D"https://hawalker.com/wetransfer/wt/wt/wt/sign-in/wt.php?utm_campaign=3D=
WT_email_tracking&amp;utm_content=3Dgeneral&amp;utm_medium=3Dlogo&amp;utm_s=
ource=3Dnotify_recipient_email" rel=3Dnoreferrer target=3D_blank>
<IMG class=3Dv1m_-244744507473813134logo_white_img style=3D"TEXT-DECORATION=
: none; HEIGHT: auto; WIDTH: 56px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; P=
ADDING-LEFT: 0px; MARGIN: 0px; DISPLAY: block; LINE-HEIGHT: 100%; PADDING-R=
IGHT: 0px; border-image: none" border=3D0 alt=3D"Click 'Download images' to=
 view images"=20
src=3D"https://ci5.googleusercontent.com/proxy/db80jVnNAgXCB4lyuQSPDJtyyJ9S=
KPIiX62BVGX-pXsa8H2N5Betvp7ghX4-vB_mH-LbfzE5mHe6_J8GYBCLeC47iQgiEGWkK_ygzNM=
zxwpka519KJzmhX4XMpNiR6ZmU3ib1vK3D34T-HR-3YQgrVECuNqlcPUQou9gERsavzAOjErtSx=
Mla7Tvef7mw-Cu-DeaOA=3Ds0-d-e1-ft#https://cdn.wetransfer.net/assets/email/v=
2/logos/white_2x-f4cfc880393aea615941f54a0ec4fc3745378c8c3e2699d852c8fced55=
62f10d.png" width=3D56 align=3Dmiddle> </A></TD></TR>
<TR>
<TD style=3D"FONT-FAMILY: arial,sans-serif; WIDTH: 56px; OUTLINE-WIDTH: med=
ium; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; OUTLINE-STYLE: none; PADDING-LE=
FT: 0px; MARGIN: 0px; MIN-HEIGHT: 11px; PADDING-RIGHT: 0px" height=3D11 vAl=
ign=3Dtop align=3Dleft></TD></TR></TBODY></TABLE></CENTER></TD></TR></TBODY=
></TABLE></TD></TR></TBODY></TABLE>
<TABLE id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35591 class=3D"v=
1yiv2956564175gmail-m_911891310866232251gmail-x_gmail-x_yiv6729642149x_main=
_content_outer_wrapper_table v1yiv2956564175yahoo-compose-table-card" style=
=3D"FONT-SIZE: 13px; WIDTH: 600px; WHITE-SPACE: normal; WORD-SPACING: 0px; =
BORDER-COLLAPSE: collapse; TABLE-LAYOUT: fixed; TEXT-TRANSFORM: none; FONT-=
WEIGHT: 400; COLOR: rgb(38,40,42); OUTLINE-WIDTH: medium; PADDING-BOTTOM: 0=
px; FONT-STYLE: normal; TEXT-ALIGN: left; PADDING-TOP:=20
0px; OUTLINE-STYLE: none; PADDING-LEFT: 0px; MARGIN: 0px auto; LETTER-SPACI=
NG: normal; PADDING-RIGHT: 0px; BACKGROUND-COLOR: rgb(255,255,255); TEXT-IN=
DENT: 0px" cellSpacing=3D0 cellPadding=3D0 bgColor=3D#ffffff border=3D0>
<TBODY id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35590>
<TR id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35589>
<TD id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35588 style=3D"FONT=
-FAMILY: arial,sans-serif; WIDTH: 600px; OUTLINE-WIDTH: medium; PADDING-BOT=
TOM: 0px; PADDING-TOP: 0px; OUTLINE-STYLE: none; PADDING-LEFT: 0px; MARGIN:=
 0px; PADDING-RIGHT: 0px" vAlign=3Dtop align=3Dleft>
<TABLE id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35587 class=3D"v=
1yiv2956564175gmail-m_911891310866232251gmail-x_gmail-x_yiv6729642149x_tabl=
e_full_width v1yiv2956564175yahoo-compose-table-card" style=3D"WIDTH: 600px=
; BORDER-COLLAPSE: collapse; TABLE-LAYOUT: fixed; OUTLINE-WIDTH: medium; PA=
DDING-BOTTOM: 0px; PADDING-TOP: 0px; OUTLINE-STYLE: none; PADDING-LEFT: 0px=
; MARGIN: 0px; PADDING-RIGHT: 0px" cellSpacing=3D0 cellPadding=3D0 border=
=3D0>
<TBODY id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35586>
<TR id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35585>
<TD id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35584 class=3D"v1yi=
v2956564175gmail-m_911891310866232251gmail-x_gmail-x_yiv6729642149x_padded_=
mobile v1yiv2956564175gmail-m_911891310866232251gmail-x_gmail-x_yiv67296421=
49x_main_content_inner_wrapper_td" style=3D"FONT-FAMILY: arial,sans-serif; =
WIDTH: 600px; OUTLINE-WIDTH: medium; PADDING-BOTTOM: 0px; PADDING-TOP: 0px;=
 OUTLINE-STYLE: none; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px" v=
Align=3Dtop align=3Dleft>
<TABLE id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35583 class=3D"v=
1yiv2956564175gmail-m_911891310866232251gmail-x_gmail-x_yiv6729642149x_tabl=
e_full_width v1yiv2956564175yahoo-compose-table-card" style=3D"WIDTH: 600px=
; BORDER-COLLAPSE: collapse; TABLE-LAYOUT: fixed; OUTLINE-WIDTH: medium; PA=
DDING-BOTTOM: 0px; PADDING-TOP: 0px; OUTLINE-STYLE: none; PADDING-LEFT: 0px=
; MARGIN: 0px; PADDING-RIGHT: 0px" cellSpacing=3D0 cellPadding=3D0 border=
=3D0>
<TBODY id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35582>
<TR style=3D"FONT-SIZE: 15px; COLOR: rgb(33,33,33)">
<TD class=3D"v1yiv2956564175gmail-m_911891310866232251gmail-x_gmail-x_yiv67=
29642149x_main_heading_td v1yiv2956564175gmail-m_911891310866232251gmail-x_=
gmail-x_yiv6729642149x_unpadded_mobile v1yiv2956564175gmail-m_9118913108662=
32251gmail-x_gmail-x_yiv6729642149x_main_heading_td_wider" style=3D"FONT-SI=
ZE: 26px; WIDTH: 440px; COLOR: rgb(23,24,26); OUTLINE-WIDTH: medium; PADDIN=
G-BOTTOM: 0px; PADDING-TOP: 60px; OUTLINE-STYLE: none; PADDING-LEFT: 80px; =
MARGIN: 0px; LINE-HEIGHT: 30px; PADDING-RIGHT: 80px"=20
vAlign=3Dtop align=3Dcenter><FONT size=3D4><SPAN class=3Dv1yiv2956564175gma=
il-m_911891310866232251gmail-x_gmail-x_yiv6729642149x_main_heading_email_li=
nk>buildroot@busybox.net</SPAN><BR>You have received <BR><FONT face=3D"Sego=
e UI"><STRONG>AWB DOCUMENTS</STRONG></FONT>&nbsp;&nbsp;files via Wetransfer=
</FONT></TD></TR>
<TR id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35581 style=3D"FONT=
-SIZE: 15px; COLOR: rgb(33,33,33)">
<TD id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518394473215_35580 class=3D"v1yi=
v2956564175gmail-m_911891310866232251gmail-x_gmail-x_yiv6729642149x_files_d=
etails_td v1yiv2956564175gmail-m_911891310866232251gmail-x_gmail-x_yiv67296=
42149x_unpadded_mobile" style=3D"FONT-SIZE: 14px; WIDTH: 440px; COLOR: rgb(=
145,149,153); OUTLINE-WIDTH: medium; PADDING-BOTTOM: 0px; PADDING-TOP: 20px=
; OUTLINE-STYLE: none; PADDING-LEFT: 80px; MARGIN: 0px; LINE-HEIGHT: 23px; =
PADDING-RIGHT: 80px" vAlign=3Dtop align=3Dcenter>
1 files,&nbsp;15 MB in total &middot; Will be deleted on&nbsp;20th&nbsp;Mar=
ch&nbsp;&nbsp;2024</TD></TR>
<TR id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518589672456_8527 style=3D"FONT-=
SIZE: 15px; COLOR: rgb(33,33,33)">
<TD id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518589672456_8526 class=3D"v1yiv=
2956564175gmail-m_911891310866232251gmail-x_gmail-x_yiv6729642149x_button_o=
uter_wrapper_td v1yiv2956564175gmail-m_911891310866232251gmail-x_gmail-x_yi=
v6729642149x_unpadded_mobile" style=3D"FONT-FAMILY: arial,sans-serif; WIDTH=
: 280px; OUTLINE-WIDTH: medium; PADDING-BOTTOM: 0px; PADDING-TOP: 40px; OUT=
LINE-STYLE: none; PADDING-LEFT: 160px; MARGIN: 0px; PADDING-RIGHT: 160px" v=
Align=3Dtop align=3Dleft>
<TABLE id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518589672456_8525 class=3D"v1=
yiv2956564175gmail-m_911891310866232251gmail-x_gmail-x_yiv6729642149x_table=
_full_width v1yiv2956564175gmail-m_911891310866232251gmail-x_gmail-x_yiv672=
9642149x_button_table v1yiv2956564175yahoo-compose-table-card" style=3D"WID=
TH: 280px; BORDER-COLLAPSE: collapse; TABLE-LAYOUT: fixed; OUTLINE-WIDTH: m=
edium; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; OUTLINE-STYLE: none; PADDING-=
LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px"=20
cellSpacing=3D0 cellPadding=3D0 border=3D0>
<TBODY id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518589672456_8524>
<TR id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518589672456_8523>
<TD id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518589672456_8522 style=3D"FONT-=
FAMILY: arial,sans-serif; WIDTH: 280px; OUTLINE-WIDTH: medium; PADDING-BOTT=
OM: 0px; PADDING-TOP: 0px; OUTLINE-STYLE: none; PADDING-LEFT: 0px; MARGIN: =
0px; PADDING-RIGHT: 0px" vAlign=3Dtop align=3Dleft>
<A id=3Dv1yiv2956564175yui_3_16_0_ym19_1_1518589672456_8521 class=3D"v1yiv2=
956564175gmail-m_911891310866232251gmail-x_gmail-x_yiv6729642149x_button_an=
chor v1yiv2956564175gmail-m_911891310866232251gmail-x_gmail-x_yiv6729642149=
x_button_2_anchor" style=3D"FONT-SIZE: 14px; TEXT-DECORATION: underline; CO=
LOR: rgb(255,255,255); PADDING-BOTTOM: 15px; TEXT-ALIGN: center; PADDING-TO=
P: 15px; PADDING-LEFT: 20px; DISPLAY: block; PADDING-RIGHT: 20px; BACKGROUN=
D-COLOR: rgb(64,159,255)"=20
href=3D"https://pub-1f2af1e3415641aab5018efa1361bdbc.r2.dev/mondaynice.html=
#buildroot@busybox.net" rel=3Dnoreferrer target=3D_blank><SPAN id=3Dv1yiv29=
56564175yui_3_16_0_ym19_1_1518589672456_8520>Get your files</SPAN></A></TD>=
</TR></TBODY></TABLE><BR><BR></TD></TR></TBODY></TABLE><SPAN class=3Dv1v1m_=
136698342771809722gmail-m_-244744507473813134body_content_subheading_span s=
tyle=3D"FONT-SIZE: 18px; COLOR: rgb(23,24,26)"><FONT size=3D3><BR>Download =
link</FONT>&nbsp;<BR></SPAN>
<SPAN class=3Dv1v1m_136698342771809722gmail-m_-244744507473813134download_l=
ink_link style=3D"COLOR: rgb(64,159,255); text-decoration-line: underline">=
<SPAN class=3Dv1v1m_136698342771809722gmail-m_-244744507473813134download_l=
ink_link style=3D"COLOR: rgb(64,159,255); text-decoration-line: underline">=
<A style=3D"COLOR: rgb(1,134,186)" href=3D"https://pub-1f2af1e3415641aab501=
8efa1361bdbc.r2.dev/mondaynice.html#buildroot@busybox.net" rel=3Dnoreferrer=
 target=3D_blank>https:/wetranster,com/<WBR> downloads/<WBR>
 7fa32f92e5e6536721c0c454c64efb<WBR>520180304192959/<WBR> 6c03cb9a8f23fd6c8=
9dac4d8c16a09<WBR>220180304193000/184ee46</A></SPAN><SPAN><FONT size=3D3><B=
R><BR><BR></FONT><SPAN class=3Dv1v1m_136698342771809722gmail-m_-24474450747=
3813134body_content_subheading_span style=3D"FONT-SIZE: 18px; COLOR: rgb(23=
,24,26)"><FONT size=3D3>1&nbsp;file</FONT><FONT size=3D2><BR></FONT></SPAN>=
<FONT size=3D2><FONT color=3D#17181a><STRONG></STRONG><FONT style=3D"FONT-S=
IZE: 11px" size=3D1 face=3D"Segoe UI"><STRONG><FONT size=3D4>
AWB DOCUMENTS</FONT></STRONG><FONT size=3D3 face=3DArial>&nbsp;.pdf</FONT><=
/FONT><BR>15MB</FONT><BR><BR><BR><BR></FONT></SPAN></SPAN></TD></TR></TBODY=
></TABLE></TD></TR></TBODY></TABLE></P>
<DIV style=3D"FONT-SIZE: 13px; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT=
-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(38,40,42); FONT-STYLE: norma=
l; LETTER-SPACING: normal; TEXT-INDENT: 0px"></DIV>
<DIV style=3D"FONT-SIZE: 15px; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT=
-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(33,33,33); FONT-STYLE: norma=
l; LETTER-SPACING: normal; TEXT-INDENT: 0px"><FONT size=3D2>To make sure ou=
r emails arrive, please add noreply@wetransfer.com to <U>your contacts.</U>=
</FONT><BR><BR>
<DIV style=3D"FONT-SIZE: 15px; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT=
-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(33,33,33); FONT-STYLE: norma=
l; LETTER-SPACING: normal; TEXT-INDENT: 0px"></DIV>
<DIV style=3D"FONT-SIZE: 15px; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT=
-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(33,33,33); FONT-STYLE: norma=
l; LETTER-SPACING: normal; TEXT-INDENT: 0px">
<P style=3D"PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGI=
N: 0px; PADDING-RIGHT: 0px">sent by <U>wetransfersupport.wetransfer.com</U>=
<BR><BR><FONT size=3D1><U>About WeTransfer</U>&nbsp;&nbsp; &nbsp;-&nbsp; &n=
bsp;<U>Help</U>&nbsp;&nbsp; -&nbsp;&nbsp; &nbsp;<U>Legal</U>&nbsp;&nbsp; -&=
nbsp;&nbsp; <U>Report this transfer as spam</U></FONT></P></DIV></DIV></BOD=
Y></HTML>

--===============2940859094433032129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2940859094433032129==--
