Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD557CD6E43
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 08:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49F2640160;
	Wed, 11 Oct 2023 08:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49F2640160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zaAvDM2NppBo; Wed, 11 Oct 2023 08:52:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E2A540BFB;
	Wed, 11 Oct 2023 08:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E2A540BFB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEAFA1BF32C
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 08:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8017822E7
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 08:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8017822E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8WdqaIjDgl-0 for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 08:52:39 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E955381EDD
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 08:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E955381EDD
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEF3A40003;
 Wed, 11 Oct 2023 08:52:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qqUxC-000r4Z-7t; Wed, 11 Oct 2023 10:52:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
References: <20231011073506.687039-1-sairon@sairon.cz>
Date: Wed, 11 Oct 2023 10:52:30 +0200
In-Reply-To: <20231011073506.687039-1-sairon@sairon.cz> ("Jan
 =?utf-8?B?xIxlcm3DoWsiJ3M=?=
 message of "Wed, 11 Oct 2023 09:35:05 +0200")
Message-ID: <87il7dczht.fsf@48ers.dk>
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
Q29tbWl0dGVkLCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
