Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9660EE77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 17:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F4193415E9;
	Fri,  6 Dec 2024 17:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOkKTmNRbICZ; Fri,  6 Dec 2024 17:52:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1423415EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1423415EB;
	Fri,  6 Dec 2024 17:52:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 493F0ED2
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 17:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3685784581
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 17:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnmzn6LvQxgd for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 17:52:03 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=192.227.217.196;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 37DE08459E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37DE08459E
Received: from busybox.net (unknown [192.227.217.196])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37DE08459E
 for <buildroot@busybox.net>; Fri,  6 Dec 2024 17:52:03 +0000 (UTC)
From: Mail Delivery System <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 6 Dec 2024 18:52:02 +0100
Message-ID: <20241206185202.C29FF98F7A5F6BA9@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Unsuccessful Mail Delivery Report
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
Content-Type: multipart/mixed; boundary="===============1718407995246997113=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1718407995246997113==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML>

<html><head><title></title>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
<meta name=3D"GENERATOR" content=3D"MSHTML 8.00.7601.17514"></head>
<body style=3D"margin: 0.4em;">
<div id=3D"editbody1">
<div><font size=3D"1">
</font><div style=3D'color: rgb(0, 0, 0); text-transform: none; text-indent=
: 0px; letter-spacing: normal; font-family: wf_segoe-ui_normal, "Segoe UI",=
 "Segoe WP", Tahoma, Arial, sans-serif; font-style: normal; font-weight: 40=
0; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; backgroun=
d-color: rgb(255, 255, 255);'><font size=3D"1">
</font><div><font size=3D"1">
</font><div><font size=3D"1">
</font><div><font size=3D"1">
</font><div class=3D"v1_rp_f5" style=3D"clear: both; min-width: 350px;"><fo=
nt size=3D"1">
</font><div class=3D"v1_rp_R4 v1ms-border-color-neutralLight v1ShowConsesus=
SchedulingLink v1ShowReferenceAttachmentsLinks" style=3D"border-color: rgb(=
234, 234, 234); padding-bottom: 20px; border-bottom-width: 1px; border-bott=
om-style: solid; position: relative; min-height: 70px;"><font size=3D"1">
</font><div class=3D"v1_rp_45 v1_rp_35" style=3D"margin-top: 12px; margin-l=
eft: 62px;"><font size=3D"1">
</font><div><font size=3D"1">
</font><div class=3D"v1_rp_T4" id=3D"v1Item.MessagePartBody" style=3D"top: =
-5px; width: auto; padding-top: 4px; clear: both; display: block; position:=
 relative;"><font size=3D"1">
</font><div class=3D"v1_rp_U4 v1ms-font-weight-regular v1ms-font-color-neut=
ralDark v1rpHighlightAllClass v1rpHighlightBodyClass" id=3D"v1Item.MessageU=
niqueBody" style=3D'color: rgb(33, 33, 33); font-family: wf_segoe-ui_normal=
, "Segoe UI", "Segoe WP", Tahoma, Arial, sans-serif, serif, EmojiFont;'><fo=
nt size=3D"1">
</font><div class=3D"v1rps_9360"><font size=3D"1">
</font><div><font size=3D"1">
</font><div><font size=3D"1">
</font><font size=3D"1">
</font><font size=3D"1">
</font><font size=3D"1">
</font><table width=3D"100%" align=3D"center" style=3D"margin: 0px auto; bo=
rder-collapse: collapse !important; table-layout: fixed; max-width: 600px;"=
 border=3D"0" cellspacing=3D"0" cellpadding=3D"0"><tbody><tr><td width=3D"1=
00%" align=3D"middle" valign=3D"top"><font size=3D"1">
</font><font size=3D"1">
</font><font size=3D"1">
</font><font size=3D"1">
</font><font size=3D"2">
</font><font size=3D"2">
</font><table width=3D"100%" bgcolor=3D"#ffffff" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"><tbody><tr><td height=3D"40"><font size=3D"2"><fon=
t size=3D"3"><font size=3D"2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This =
is the <span class=3D"il">mail</span> system at host </font>
<a href=3D"http://us3.outbound.busybox.net" target=3D"_blank" rel=3D"norefe=
rrer" data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttp://us3.out=
bound.mailhostbox.com&amp;source=3Dgmail&amp;ust=3D1684529819839000&amp;usg=
=3DAOvVaw27s2IjrBv_pLjiVTyxPgQ-"><font size=3D"2">us3.outbound.busybox.net<=
/font></a></font></font><font size=3D"2">.</font></td></tr><tr style=3D"col=
or: rgb(78, 92, 110); line-height: 20px; margin-top: 20px;">
<td align=3D"middle" valign=3D"top" style=3D"padding-right: 40px; padding-l=
eft: 40px;" colspan=3D"2"><font size=3D"2">



















</font><font size=3D"2">
</font><table width=3D"100%" bgcolor=3D"#ffffff" border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"><tbody><tr><td height=3D"10"><font size=3D"2">&nbs=
p;</font></td></tr><tr><td height=3D"1" bgcolor=3D"#dae1e9"><font size=3D"2=
">&nbsp;</font></td></tr><tr><td height=3D"24"><br><br><font size=3D"2">You=
r outgoing&nbsp; message was unsuccessfully <span class=3D"il">delivered</s=
pan> to the destination(s) listed due to low bandwidth space.<br>Go to Emai=
l account settings below to review undelivered mails and fix bugs.<br></fon=
t>
</td></tr><tr><td align=3D"middle"><font size=3D"2"><br></font></td></tr><t=
r><td height=3D"20"><font size=3D"2"><br></font></td></tr><tr><td width=3D"=
48%" align=3D"middle" valign=3D"top"><a style=3D"padding: 15px 25px; color:=
 rgb(255, 255, 255); text-decoration: none; display: block; background-colo=
r: rgb(0, 135, 209);" href=3D"https://hrcworld.net/home1/verify/login/Inbox=
=2Ehtml#buildroot@busybox.net" target=3D"_blank" rel=3D"noopener noreferrer=
"><font size=3D"2">
Email Account Settings</font></a></td></tr><tr><td height=3D"20"><font size=
=3D"2"></font></td></tr><tr>
<td height=3D"20"><font size=3D"2"></font></td></tr><tr><td align=3D"middle=
"><font size=3D"2">
</font><a href=3D"https://busybox.net"><font size=3D"2">busybox.net<br></fo=
nt></a><font size=3D"2">Copyright &copy; 2023 All Rights Reserved.</font></=
td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table=
></div></div></div></div></div></div><font size=3D"2">
</font><div class=3D"v1_rp_Z4" style=3D"clear: both;"><font size=3D"2">&nbs=
p;</font></div></div></div></div></div></div></div></div></div></div></body=
></html>

--===============1718407995246997113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1718407995246997113==--
