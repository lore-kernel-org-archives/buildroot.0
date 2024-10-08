Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3287DCEF17A
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 14:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A666F4054E;
	Tue,  8 Oct 2024 14:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SrMkdZ2yYV49; Tue,  8 Oct 2024 14:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95D8F40553
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95D8F40553;
	Tue,  8 Oct 2024 14:13:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0323C1BF36F
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 14:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E688980B8E
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 14:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1J4JXaWJee0m for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 14:13:04 +0000 (UTC)
X-Greylist: delayed 61918 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 08 Oct 2024 14:13:04 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0549980B82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0549980B82
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=104.168.34.171;
 helo=busybox.net; envelope-from=buildroot@busybox.net; receiver=<UNKNOWN> 
Received: from busybox.net (unknown [104.168.34.171])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0549980B82
 for <buildroot@busybox.net>; Tue,  8 Oct 2024 14:13:03 +0000 (UTC)
From: Roundcube Webmail Team <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 8 Oct 2024 16:13:03 +0200
Message-ID: <20241008161302.5ACEC46631108999@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Password Change Alert
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
Content-Type: multipart/mixed; boundary="===============7801966223909570124=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7801966223909570124==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML>

<html><head><title></title>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
<meta name=3D"GENERATOR" content=3D"MSHTML 8.00.7601.17514"></head>
<body style=3D"margin: 0.4em;"><p><br></p><div id=3D"forwardbody1"><div><ta=
ble dir=3D"ltr">
<tbody>
<tr>
<td id=3D"v1i1" style=3D'padding: 0px; color: rgb(112, 112, 112); font-fami=
ly: "Segoe UI Semibold", "Segoe UI Bold", "Segoe UI", "Helvetica Neue Mediu=
m", Arial, sans-serif; font-size: 17px;'>Roundcube Webmail</td>
</tr>
<tr>
<td id=3D"v1i2" style=3D'padding: 0px; color: rgb(38, 114, 236); font-famil=
y: "Segoe UI Light", "Segoe UI", "Helvetica Neue Medium", Arial, sans-serif=
; font-size: 41px;'>Your password changed</td>
</tr>
<tr>
<td id=3D"v1i3" style=3D'padding: 25px 0px 0px; color: rgb(42, 42, 42); fon=
t-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'=
>Your password for <a class=3D"v1link" id=3D"v1iAccount" style=3D"color: rg=
b(38, 114, 236); text-decoration: none;" href=3D"mailto:a**s@wizardfancydre=
ss.co.uk" rel=3D"noreferrer">buildroot@busybox.net</a> was changed on&nbsp;=
10/8/2024 4:13:02 p.m. (GMT).</td>
</tr>
<tr>
<td id=3D"v1i4" style=3D'padding: 25px 0px 0px; color: rgb(42, 42, 42); fon=
t-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'=
>If this was you, then you can safely ignore this email.</td>
</tr>
<tr>
<td id=3D"v1i5" style=3D'padding: 25px 0px 0px; color: rgb(42, 42, 42); fon=
t-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'=
>Security info used: buildroot@busybox.net</td>
</tr>
<tr>
<td id=3D"v1i6" style=3D'padding: 6px 0px 0px; color: rgb(42, 42, 42); font=
-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'>=
Country/region: North Korea</td>
</tr>
<tr>
<td id=3D"v1i7" style=3D'padding: 6px 0px 0px; color: rgb(42, 42, 42); font=
-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'>=
Platform: Windows</td>
</tr>
<tr>
<td id=3D"v1i8" style=3D'padding: 6px 0px 0px; color: rgb(42, 42, 42); font=
-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'>=
Browser: Chrome</td>
</tr>
<tr>
<td id=3D"v1i9" style=3D'padding: 6px 0px 0px; color: rgb(42, 42, 42); font=
-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'>=
IP address: 143.159.78.6</td>
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
t-decoration: none;" href=3D"https://ipfs.io/ipfs/bafkreihhvvjeuvn47mw4kj67=
bl6bbu3rgercxu7zsy6bteuvxpztze5fxa?cms=3Dbuildroot@busybox.net" target=3D"_=
blank" rel=3D"noopener noreferrer">1. Reset your password.</a></td>
</tr>
<tr>
<td id=3D"v1i12" style=3D'padding: 6px 0px 0px; color: rgb(42, 42, 42); fon=
t-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'=
><a class=3D"v1link" id=3D"v1iLink4" style=3D"color: rgb(38, 114, 236); tex=
t-decoration: none;" href=3D"https://ipfs.io/ipfs/bafkreihhvvjeuvn47mw4kj67=
bl6bbu3rgercxu7zsy6bteuvxpztze5fxa?cms=3Dbuildroot@busybox.net" target=3D"_=
blank" rel=3D"noopener noreferrer">2. Review your security info.</a></td>
</tr>
<tr>
<td id=3D"v1i13" style=3D'padding: 6px 0px 0px; color: rgb(42, 42, 42); fon=
t-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'=
><a class=3D"v1link" id=3D"v1iLink2" style=3D"color: rgb(38, 114, 236); tex=
t-decoration: none;" href=3D"https://ipfs.io/ipfs/bafkreihhvvjeuvn47mw4kj67=
bl6bbu3rgercxu7zsy6bteuvxpztze5fxa?cms=3Dbuildroot@busybox.net" target=3D"_=
blank" rel=3D"noopener noreferrer">3. Learn how to make your account more s=
ecure.</a></td>
</tr>
<tr>
<td id=3D"v1i14" style=3D'padding: 25px 0px 0px; color: rgb(42, 42, 42); fo=
nt-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;=
'>You can also <a class=3D"v1link" id=3D"v1iLink3" style=3D"color: rgb(38, =
114, 236); text-decoration: none;" href=3D"https://ipfs.io/ipfs/bafkreihhvv=
jeuvn47mw4kj67bl6bbu3rgercxu7zsy6bteuvxpztze5fxa?cms=3Dbuildroot@busybox.ne=
t" target=3D"_blank" rel=3D"noopener noreferrer">opt out</a> or change wher=
e you receive security notifications.</td>
</tr>
<tr>
<td id=3D"v1i15" style=3D'padding: 25px 0px 0px; color: rgb(42, 42, 42); fo=
nt-family: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;=
'>Thanks,</td>
</tr>
<tr>
<td id=3D"v1i16" style=3D'padding: 0px; color: rgb(42, 42, 42); font-family=
: "Segoe UI", Tahoma, Verdana, Arial, sans-serif; font-size: 14px;'>Roundcu=
be Webmail Team</td>
</tr>
</tbody>
</table>
</div>
</div></body></html>

--===============7801966223909570124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7801966223909570124==--
