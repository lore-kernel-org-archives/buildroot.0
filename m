Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F80AC433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Mar 2022 06:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C556381270;
	Thu,  3 Mar 2022 06:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NFxgMNGiucd5; Thu,  3 Mar 2022 06:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 010E281242;
	Thu,  3 Mar 2022 06:44:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B21FC1BF8A8
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 06:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FF7081242
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 06:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b_88GczXiqfk for <buildroot@lists.busybox.net>;
 Thu,  3 Mar 2022 06:44:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1833081000
 for <buildroot@buildroot.org>; Thu,  3 Mar 2022 06:44:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A533E240002;
 Thu,  3 Mar 2022 06:44:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nPfCU-0003D7-Mj; Thu, 03 Mar 2022 07:44:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Fran=C3=A7ois?= Perrad <francois.perrad@gadz.org>
References: <87pmn6y8hv.fsf@dell.be.48ers.dk>
 <CAB0FRsseLgz+bpirX0XScARnNhxox-36V5a0O9fm8QMK1o2t_A@mail.gmail.com>
Date: Thu, 03 Mar 2022 07:44:34 +0100
In-Reply-To: <CAB0FRsseLgz+bpirX0XScARnNhxox-36V5a0O9fm8QMK1o2t_A@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Thu, 3 Mar 2022
 07:12:50 +0100")
Message-ID: <87mti7bkml.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] Buildroot 2022.02-rc3 released
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZyYW7Dp29pcyIgPT0gRnJhbsOnb2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdh
ZHoub3JnPiB3cml0ZXM6CgogPiBMZSBsdW4uIDI4IGbDqXZyLiAyMDIyIMOgIDIyOjQxLCBQZXRl
ciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IGEKID4gw6ljcml0IDoKCiA+PiBIaSwK
ID4+IAogPj4gQnVpbGRyb290IDIwMjIuMDItcmMzIGlzIHJlbGVhc2VkIC0gR28gZG93bmxvYWQg
aXQgYXQ6CiA+PiAKID4+IGh0dHA6Ly9idWlsZHJvb3QubmV0L2Rvd25sb2Fkcy9idWlsZHJvb3Qt
MjAyMi4wMi1yYzMudGFyLmd6CiA+PiAKID4+IG9yCiA+PiAKID4+IGh0dHA6Ly9idWlsZHJvb3Qu
bmV0L2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyMi4wMi1yYzMudGFyLnh6CiA+PiAKID4+IAogPiBU
aGVzZSAyIGxpbmtzIGFyZSBicm9rZW4uCgogPiBGcmFuw6dvaXMKCiA+ICQgd2dldCBodHRwOi8v
YnVpbGRyb290Lm5ldC9kb3dubG9hZHMvYnVpbGRyb290LTIwMjIuMDItcmMzLnRhci5negogPiAt
LTIwMjItMDMtMDMgMDc6MTE6MTktLQogPiBodHRwOi8vYnVpbGRyb290Lm5ldC9kb3dubG9hZHMv
YnVpbGRyb290LTIwMjIuMDItcmMzLnRhci5negogPiBSZXNvbHZpbmcgYnVpbGRyb290Lm5ldCAo
YnVpbGRyb290Lm5ldCkuLi4gMTQwLjIxMS4xNjcuMTIyCiA+IENvbm5lY3RpbmcgdG8gYnVpbGRy
b290Lm5ldCAoYnVpbGRyb290Lm5ldCl8MTQwLjIxMS4xNjcuMTIyfDo4MC4uLgogPiBjb25uZWN0
ZWQuCiA+IEhUVFAgcmVxdWVzdCBzZW50LCBhd2FpdGluZyByZXNwb25zZS4uLiA0MDQgTm90IEZv
dW5kCiA+IDIwMjItMDMtMDMgMDc6MTE6MTkgRVJST1IgNDA0OiBOb3QgRm91bmQuCgpVcHMsIHNv
bWV0aGluZyB3ZW50IHdyb25nIHdpdGggdGhlIHVwbG9hZC4gRml4ZWQgbm93LCB0aGFua3MhCgot
LSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
