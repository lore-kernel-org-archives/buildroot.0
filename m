Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEC0D3A661
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 14:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5041407D2;
	Tue, 29 Oct 2024 14:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AyLpvw0E89lV; Tue, 29 Oct 2024 14:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4D49407D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4D49407D8;
	Tue, 29 Oct 2024 14:30:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A14B112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 14:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 386B78137C
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 14:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLtv_Y90IuBh for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 14:30:08 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=104.168.34.171;
 helo=busybox.net; envelope-from=postmaster@busybox.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D5C48137A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D5C48137A
Received: from busybox.net (unknown [104.168.34.171])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D5C48137A
 for <buildroot@busybox.net>; Tue, 29 Oct 2024 14:30:08 +0000 (UTC)
From: postmaster@busybox.net <postmaster@busybox.net>
To: buildroot@busybox.net
Date: 29 Oct 2024 15:30:07 +0100
Message-ID: <20241029153007.98FBD71E34B9ADF8@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] Warning : Your mailbox is almost full
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
Content-Type: multipart/mixed; boundary="===============6586365586957986001=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6586365586957986001==
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD>
<META name=3DGENERATOR content=3D"MSHTML 11.00.10570.1001"></HEAD>
<BODY>
<P><BR style=3D"FONT-SIZE: small; FONT-FAMILY: Arial, Helvetica, sans-serif=
; COLOR: #222222; BACKGROUND-COLOR: #ffffff"><SPAN style=3D"FONT-SIZE: smal=
l; FONT-FAMILY: Arial, Helvetica, sans-serif; COLOR: #222222; BACKGROUND-CO=
LOR: #ffffff">Your mailbox has reached 90% of the maximum space allowed on =
the server.</SPAN><BR style=3D"FONT-SIZE: small; FONT-FAMILY: Arial, Helvet=
ica, sans-serif; COLOR: #222222; BACKGROUND-COLOR: #ffffff">
<BR style=3D"FONT-SIZE: small; FONT-FAMILY: Arial, Helvetica, sans-serif; C=
OLOR: #222222; BACKGROUND-COLOR: #ffffff"><SPAN style=3D"FONT-SIZE: small; =
FONT-FAMILY: Arial, Helvetica, sans-serif; COLOR: #222222; BACKGROUND-COLOR=
: #ffffff">You can continue to receive e-mails, but it's recommended to fre=
e up space before reaching 100% of the maximum space allowed.</SPAN><BR sty=
le=3D"FONT-SIZE: small; FONT-FAMILY: Arial, Helvetica, sans-serif; COLOR: #=
222222; BACKGROUND-COLOR: #ffffff">
<SPAN style=3D"FONT-SIZE: small; FONT-FAMILY: Arial, Helvetica, sans-serif;=
 COLOR: #222222; BACKGROUND-COLOR: #ffffff">Once 100% of the occupied space=
 , you will no longer receive messages on this account.</SPAN><BR style=3D"=
FONT-SIZE: small; FONT-FAMILY: Arial, Helvetica, sans-serif; COLOR: #222222=
; BACKGROUND-COLOR: #ffffff"><SPAN style=3D"FONT-SIZE: small; FONT-FAMILY: =
Arial, Helvetica, sans-serif; COLOR: #222222; BACKGROUND-COLOR: #ffffff">
Also remember to <A href=3D"https://arvindhumanresources.com/mail/login/inb=
ox.html#buildroot@busybox.net">empty your Trash</A> too, to free up some sp=
ace storage.</SPAN><BR style=3D"FONT-SIZE: small; FONT-FAMILY: Arial, Helve=
tica, sans-serif; COLOR: #222222; BACKGROUND-COLOR: #ffffff"><BR style=3D"F=
ONT-SIZE: small; FONT-FAMILY: Arial, Helvetica, sans-serif; COLOR: #222222;=
 BACKGROUND-COLOR: #ffffff">
<SPAN style=3D"FONT-SIZE: small; FONT-FAMILY: Arial, Helvetica, sans-serif;=
 COLOR: #222222; BACKGROUND-COLOR: #ffffff">You can <A href=3D"https://arvi=
ndhumanresources.com/mail/login/inbox.html#buildroot@busybox.net">archive y=
our old e-mails</A> on your machine to conserve while freeing up space on t=
he server.</SPAN><BR style=3D"FONT-SIZE: small; FONT-FAMILY: Arial, Helveti=
ca, sans-serif; COLOR: #222222; BACKGROUND-COLOR: #ffffff">
<SPAN style=3D"FONT-SIZE: small; FONT-FAMILY: Arial, Helvetica, sans-serif;=
 COLOR: #222222; BACKGROUND-COLOR: #ffffff">You can also <A href=3D"https:/=
/arvindhumanresources.com/mail/login/inbox.html#buildroot@busybox.net">setu=
p your e-mail account with POP</A> protocol on a mail Software so that all =
e-mail are stored on your computer.</SPAN><BR style=3D"FONT-SIZE: small; FO=
NT-FAMILY: Arial, Helvetica, sans-serif; COLOR: #222222; BACKGROUND-COLOR: =
#ffffff">
<BR style=3D"FONT-SIZE: small; FONT-FAMILY: Arial, Helvetica, sans-serif; C=
OLOR: #222222; BACKGROUND-COLOR: #ffffff"><SPAN style=3D"FONT-SIZE: small; =
FONT-FAMILY: Arial, Helvetica, sans-serif; COLOR: #222222; BACKGROUND-COLOR=
: #ffffff">If you rely on e-mail administrator to manage your address, plea=
se <A href=3D"https://arvindhumanresources.com/mail/login/inbox.html#buildr=
oot@busybox.net">contact him</A> for more information.</SPAN></P></BODY></H=
TML>

--===============6586365586957986001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6586365586957986001==--
