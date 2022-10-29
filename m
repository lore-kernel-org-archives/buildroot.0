Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC5FC38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 16:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EA97404CA;
	Sat, 29 Oct 2022 16:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EA97404CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8uMfW-PAfCbH; Sat, 29 Oct 2022 16:08:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8CBE403EC;
	Sat, 29 Oct 2022 16:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8CBE403EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 720C91BF5DC
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C44C403EC
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C44C403EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gYBO6s1Nf7Vd for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 16:08:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44A0340103
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44A0340103
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 16:08:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C41A5240004;
 Sat, 29 Oct 2022 16:08:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oooO5-002mm7-Ns; Sat, 29 Oct 2022 18:08:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221029115555.789814-1-fontaine.fabrice@gmail.com>
Date: Sat, 29 Oct 2022 18:08:45 +0200
In-Reply-To: <20221029115555.789814-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Oct 2022 13:55:54 +0200")
Message-ID: <87leoyy5ma.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/dahdi-linux: bump to version
 3.2.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiAtIFVzZSBvZmZpY2lhbCB0YXJiYWxsCiA+IC0gVGhpcyBidW1w
IHdpbGwgZml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZXMgd2l0aCBrZXJuZWwgPj0gNS4x
NjoKCiA+IC9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtNi9vdXRwdXQtMS9idWls
ZC9kYWhkaS1saW51eC01Yzg0MGNmNDM4MzhlMDY5MDg3M2U3MzQwOTQ5MWMzOTIzMzNiM2I4L2Ry
aXZlcnMvZGFoZGkvd2N0NHh4cC9iYXNlLmM6NDU6MTA6CiA+IGZhdGFsIGVycm9yOiBzdGRib29s
Lmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKID4gICAgNDUgfCAjaW5jbHVkZSA8c3RkYm9v
bC5oPgogPiAgICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+CgogPiBbLi4uXQoKID4gLi4vZGFo
ZGktbGludXgtNWM4NDBjZjQzODM4ZTA2OTA4NzNlNzM0MDk0OTFjMzkyMzMzYjNiOC9kcml2ZXJz
L2RhaGRpL3hwcC94YnVzLWNvcmUuYzogSW4gZnVuY3Rpb24g4oCYeGJ1c19yZWFkX3Byb2Nfb3Bl
buKAmToKID4gLi4vZGFoZGktbGludXgtNWM4NDBjZjQzODM4ZTA2OTA4NzNlNzM0MDk0OTFjMzky
MzMzYjNiOC9kcml2ZXJzL2RhaGRpL3hwcC94YnVzLWNvcmUuYzoxODQ1OjQzOgogPiBlcnJvcjog
aW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYUERFX0RBVEHigJk7IGRpZCB5b3Ug
bWVhbgogPiDigJhOT0RFX0RBVEHigJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xh
cmF0aW9uXQogPiAgMTg0NSB8ICByZXR1cm4gc2luZ2xlX29wZW4oZmlsZSwgeGJ1c19wcm9jX3No
b3csIFBERV9EQVRBKGlub2RlKSk7CiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn4KID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBOT0RFX0RBVEEKCiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9h
c3Rlcmlzay9kYWhkaS1saW51eC9jb21wYXJlLzVjODQwY2Y0MzgzOGUwNjkwODczZTczNDA5NDkx
YzM5MjMzM2IzYjguLi52My4yLjAKCiA+IEZpeGVzOgogPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1
aWxkcm9vdC5vcmcvcmVzdWx0cy8zZjIzNTU5ZjAxYTc3ODNkODJhZDRlMGIyZDY3OTIxNzFlNmYy
Yjc5CiA+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2YzZjIyNmZi
NjYxYTZiMTk5ODM4MWY1ZmI3Y2IzMDY3NzFjMmVjYzAKCiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJp
Y2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgoKQ29tbWl0dGVkLCB0aGFu
a3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
