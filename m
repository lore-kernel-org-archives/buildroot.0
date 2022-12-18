Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400F3C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 20:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69CBA408A5;
	Sun, 18 Dec 2022 20:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69CBA408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8JE31M2I_2_B; Sun, 18 Dec 2022 20:30:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7252F40888;
	Sun, 18 Dec 2022 20:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7252F40888
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 920261BF395
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 20:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D76540498
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 20:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D76540498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hru2Gg43l_jz for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 20:30:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0257240167
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0257240167
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 20:30:36 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8E68260004;
 Sun, 18 Dec 2022 20:30:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p70Ir-0045VX-I7; Sun, 18 Dec 2022 21:30:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Indrek Kruusa <indrek.kruusa@gmail.com>
References: <20221218145518.21A4286933@busybox.osuosl.org>
 <CA+fTLhjiOVoqs7uoKXRAVcbkWUJcfSUBMOpkwUtPBeuG1Fxx0A@mail.gmail.com>
Date: Sun, 18 Dec 2022 21:30:33 +0100
In-Reply-To: <CA+fTLhjiOVoqs7uoKXRAVcbkWUJcfSUBMOpkwUtPBeuG1Fxx0A@mail.gmail.com>
 (Indrek Kruusa's message of "Sun, 18 Dec 2022 20:06:46 +0200")
Message-ID: <87359cjvyu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] configs/lichee_rv_dock: new defconfig
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
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkluZHJlayIgPT0gSW5kcmVrIEtydXVzYSA8aW5kcmVrLmtydXVzYUBnbWFpbC5jb20+
IHdyaXRlczoKCiA+IEtvbnRha3QgUGV0ZXIgS29yc2dhYXJkICg8cGV0ZXJAa29yc2dhYXJkLmNv
bT4pIGtpcmp1dGFzIGt1dXDDpGV2YWwgUCwgMTguCiA+IGRldHNlbWJlciAyMDIyIGtlbGwgMTY6
NTU6CgogPj4gY29tbWl0OgogPj4gaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3Qv
Y29tbWl0Lz9pZD1mOWFkMzE3NTA3Y2Y4NTY0MjAwYjg4ZGRhMjQ2MzQwNmQwMTcxMTIyCiA+PiBi
cmFuY2g6IGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9cmVm
cy9oZWFkcy9tYXN0ZXIKID4+IAogPj4gCiA+IFZlcnkgbmljZSwgYnV0IGJlY2F1c2Ugb2YgImxp
bnV4OiBidW1wIF9LRVJORUxfTEFURVNUX1ZFUlNJT04gdG8gNi4xIiBpdCdzCiA+IGJyb2tlbi4K
ID4gRm9yIG5lemhhIGFuZCBsaWNoZWVfcnYqIHRoZSBsaW51eCBoZWFkZXJzIGN1c3RvbSB2ZXJz
aW9uIGhhcyB0byBiZSB1cGRhdGVkLgoKQWhoIHllcywgYmVjYXVzZSBvZiB0aGUgNi4xLXJjMyBi
YXNlZCBrZXJuZWwuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
