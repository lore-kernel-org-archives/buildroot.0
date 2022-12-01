Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFD8C47089
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 21:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CCBF610FC;
	Thu,  1 Dec 2022 21:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CCBF610FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FYFB3mwI3prv; Thu,  1 Dec 2022 21:22:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD4C2610B7;
	Thu,  1 Dec 2022 21:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD4C2610B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D82A1BF2C5
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 21:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 759BA4102E
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 21:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 759BA4102E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ops-x6cnpC1T for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 21:22:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AA7940112
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AA7940112
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 21:22:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4F6B5FF807;
 Thu,  1 Dec 2022 21:22:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p0r0t-0076wS-6Q; Thu, 01 Dec 2022 22:22:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Leonid Yuriev <leo@yuriev.ru>
References: <20221201104313.25K7I8a6@myt5-1a3effcffc39.qloud-c.yandex.net>
 <3b7ef091-b01c-59d3-d31b-8b28e59bf1df@yuriev.ru>
 <20221201165150.4746c32e@windsurf>
 <a89a5a97-317a-b634-65ad-5fa11e526bc0@yuriev.ru>
 <20221201174145.5e70863c@windsurf> <87edtic02y.fsf@dell.be.48ers.dk>
 <1e6ba066-a525-2f51-053d-025fd824aaf2@yuriev.ru>
Date: Thu, 01 Dec 2022 22:22:35 +0100
In-Reply-To: <1e6ba066-a525-2f51-053d-025fd824aaf2@yuriev.ru> (Leonid Yuriev's
 message of "Fri, 2 Dec 2022 00:08:45 +0300")
Message-ID: <87sfhyakf8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-11-30
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkxlb25pZCIgPT0gTGVvbmlkIFl1cmlldiA8bGVvQHl1cmlldi5ydT4gd3JpdGVzOgoK
ID4gMDEuMTIuMjAyMiAyMzo1OSwgUGV0ZXIgS29yc2dhYXJkINC/0LjRiNC10YI6CiA+Pj4+Pj4+
ICJUaG9tYXMiID09IFRob21hcyBQZXRhenpvbmkgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1
aWxkcm9vdC5vcmc+IHdyaXRlczoKID4+ID4gT24gVGh1LCAxIERlYyAyMDIyIDE5OjAxOjU1ICsw
MzAwCiA+PiA+IExlb25pZCBZdXJpZXYgPGxlb0B5dXJpZXYucnU+IHdyb3RlOgogPj4gCiA+PiA+
PiBDb21taXQgZjU0YmYzZWNjNjM4YjYyMTYyYTQzZjhjMjc2NDA3YWQxZmZhMGRkNAogPj4gCiA+
PiA+IFRoYW5rcywgYnV0IHBsZWFzZSBrZWVwIHRoZSBCdWlsZHJvb3QgbWFpbGluZyBsaXN0IGlu
IENjIHdoZW4gcmVwbHlpbmcKID4+ID4gOi0pCiA+PiAKID4+IEFyZSB5b3Ugc3VyZSBhYm91dCB0
aGF0IGNvbW1pdD8gV2UgZG9uJ3Qgc2VlbSB0byBzdWNoIGEgY29tbWl0IGluCiA+PiBidWlsZHJv
b3QsIGFuZCBhcyBmYXIgYXMgSSBjYW4gc2VlIG9uCiA+PiBodHRwczovL2dpdGZsaWMucnUvcHJv
amVjdC9lcnRoaW5rL2xpYm1kYngvY29tbWl0L2Y1NGJmM2VjYzYzOGI2MjE2MmE0M2Y4YzI3NjQw
N2FkMWZmYTBkZDQsCiA+PiBuZWl0aGVyIGRvZXMgdXBzdHJlYW0gbGlibWRieD8KCiA+IE9vcHMs
IGl0IG15IG1pc3Rha2UuCiA+IGh0dHBzOi8vZ2l0LmJ1c3lib3gubmV0L2J1aWxkcm9vdC9jb21t
aXQvP2lkPWNkMjU4MDhkN2QzYjI5MmY2MTA0M2Q2MTJjMmUzNGFhYjVhNDIyZmQKCk9rLCBjb21t
aXR0ZWQgdG8gbWFzdGVyIC0gVGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
