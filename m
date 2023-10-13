Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1A8CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 18:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB62140CB3;
	Fri, 13 Oct 2023 18:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB62140CB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3hgX2-x6Vhp7; Fri, 13 Oct 2023 18:13:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 846BC401D8;
	Fri, 13 Oct 2023 18:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 846BC401D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4BBD1BF47D
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD95960DA0
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD95960DA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oN4_kbKXdYhM for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 18:13:47 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8997B60C30
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 18:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8997B60C30
Received: by mail.gandi.net (Postfix) with ESMTPSA id 861611C0002;
 Fri, 13 Oct 2023 18:13:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrMfK-007SQl-7K; Fri, 13 Oct 2023 20:13:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
References: <20231011073506.687039-1-sairon@sairon.cz>
Date: Fri, 13 Oct 2023 20:13:38 +0200
In-Reply-To: <20231011073506.687039-1-sairon@sairon.cz> ("Jan
 =?utf-8?B?xIxlcm3DoWsiJ3M=?=
 message of "Wed, 11 Oct 2023 09:35:05 +0200")
Message-ID: <87zg0m1jcd.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libcurl: security bump to 8.4.0
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

Pj4+Pj4gIkphbiIgPT0gSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PiB3cml0ZXM6Cgog
PiBGaXhlcyBmb2xsb3dpbmcgdHdvIHZ1bG5lcmFiaWxpdGllczoKID4gKiBDVkUtMjAyMy0zODU0
NTogU09DS1M1IGhlYXAgYnVmZmVyIG92ZXJmbG93CiA+ICAgaHR0cHM6Ly9jdXJsLnNlL2RvY3Mv
Q1ZFLTIwMjMtMzg1NDUuaHRtbAogPiAqIENWRS0yMDIzLTM4NTQ2OiBjb29raWUgaW5qZWN0aW9u
IHdpdGggbm9uZSBmaWxlCiA+ICAgaHR0cHM6Ly9jdXJsLnNlL2RvY3MvQ1ZFLTIwMjMtMzg1NDYu
aHRtbAoKID4gU2lnbmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoK
Q29tbWl0dGVkIHRvIDIwMjMuMDIueCBhbmQgMjAyMy4wOC54LCB0aGFua3MuCgotLSAKQnllLCBQ
ZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
