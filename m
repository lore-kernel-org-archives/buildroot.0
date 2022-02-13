Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC9FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 08:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 004E281882;
	Sun, 13 Feb 2022 08:18:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FajBsaatbqit; Sun, 13 Feb 2022 08:18:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F045817D3;
	Sun, 13 Feb 2022 08:18:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E082B1BF3C0
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 08:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAF0760AFC
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 08:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AbxQUdYq93VY for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 08:18:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEF7C60AFA
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 08:18:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 61FD520002;
 Sun, 13 Feb 2022 08:18:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nJA5E-0005UG-Fq; Sun, 13 Feb 2022 09:18:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Cl=C3=A9ment_P=C3=A9ron?= <peron.clem@gmail.com>
References: <20220212111710.22559-1-peron.clem@gmail.com>
Date: Sun, 13 Feb 2022 09:18:12 +0100
In-Reply-To: <20220212111710.22559-1-peron.clem@gmail.com> (=?utf-8?Q?=22C?=
 =?utf-8?Q?l=C3=A9ment_P=C3=A9ron=22's?=
 message of "Sat, 12 Feb 2022 12:17:10 +0100")
Message-ID: <87leyfmb7f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/beelink_gs1: select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkNsw6ltZW50IiA9PSBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29t
PiB3cml0ZXM6CgogPiBTZWxlY3QgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVOU1NMIHRvIGZp
eCB0aGUgZm9sbG93aW5nIGJ1aWxkCiA+IGVycm9yOgoKID4gaW5jbHVkZS9pbWFnZS5oOjExNzg6
MTI6IGZhdGFsIGVycm9yOiBvcGVuc3NsL2V2cC5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5
CiA+ICAxMTc4IHwgIyAgaW5jbHVkZSA8b3BlbnNzbC9ldnAuaD4KID4gICAgICAgfCAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fgoKID4gRml4ZXM6CiA+IC0gaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8yMDc2NDc1MDMzCgogPiBTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgoKQ29tbWl0dGVkLCB0aGFu
a3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
