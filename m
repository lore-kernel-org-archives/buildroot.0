Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70B4C4345F
	for <buildroot@archiver.kernel.org>; Mon, 29 Apr 2024 07:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 984784060B;
	Mon, 29 Apr 2024 07:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PfVHaiP3WG4q; Mon, 29 Apr 2024 07:40:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D5D8401A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D5D8401A1;
	Mon, 29 Apr 2024 07:40:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E85891BF3E3
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 07:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D42C340190
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 07:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dNJdvCjp6-2h for <buildroot@lists.busybox.net>;
 Mon, 29 Apr 2024 07:40:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2850640174
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2850640174
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2850640174
 for <buildroot@buildroot.org>; Mon, 29 Apr 2024 07:40:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0F94FF806;
 Mon, 29 Apr 2024 07:40:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s1LcW-006yC1-0C;
 Mon, 29 Apr 2024 09:40:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240324205324.491751-1-fontaine.fabrice@gmail.com>
 <87frv5eo0j.fsf@dell.be.48ers.dk>
 <CAPi7W81qgQZGkgq7ZifoSrVqEGgUWncTU5wyc2uGRgaTczB55Q@mail.gmail.com>
Date: Mon, 29 Apr 2024 09:40:15 +0200
In-Reply-To: <CAPi7W81qgQZGkgq7ZifoSrVqEGgUWncTU5wyc2uGRgaTczB55Q@mail.gmail.com>
 (Fabrice Fontaine's message of "Mon, 29 Apr 2024 09:22:42 +0200")
Message-ID: <875xw0bork.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/thermald: bump to version 2.5.6
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBIZWxsbyBQZXRlciwKID4gTGUgZGltLiAyOCBhdnIuIDIwMjQg
w6AgMTM6MTUsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gYSDDqWNyaXQg
OgogPj4gCiA+PiA+Pj4+PiAiRmFicmljZSIgPT0gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUu
ZmFicmljZUBnbWFpbC5jb20+IHdyaXRlczoKID4+IAogPj4gPiBodHRwczovL2dpdGh1Yi5jb20v
aW50ZWwvdGhlcm1hbF9kYWVtb24vYmxvYi92Mi41LjYvUkVBRE1FLnR4dAogPj4gPiBTaWduZWQt
b2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KID4+
IAogPj4gVGhpcyBtZW50aW9ucyB0aGF0IGl0IG5vdyB1c2VzIEdEQnVzIGluc3RlYWQgb2YgZ2xp
Yi1kYnVzIGJ5IGRlZmF1bHQKID4+IG5vdzoKID4+IAogPj4gaHR0cHM6Ly9naXRodWIuY29tL2lu
dGVsL3RoZXJtYWxfZGFlbW9uL2NvbW1pdC85MmE4NDU5NTgyYzgyNjM0M2JhMjJlM2RjOGZhNWU1
NjNhZTNmOWFjCiA+PiAKID4+IERvIHdlIHRoZW4gc3RpbGwgbmVlZCB0aGUgZGJ1cy1nbGliIGRl
cGVuZGVuY3k/CgogPiBZZXMsIGRidXMtZ2xpYiBpcyBzdGlsbCBuZWVkZWQ6CiA+IGh0dHBzOi8v
Z2l0aHViLmNvbS9pbnRlbC90aGVybWFsX2RhZW1vbi9ibG9iL2VhOGI3NzNmNzY2NDFhN2E0OWQ2
NTg0NjY5ZTE3MzcxYzIyYWQwM2UvY29uZmlndXJlLmFjI0w3MQoKQWhoLCBpbmRlZWQgLSBPZGQu
CgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
