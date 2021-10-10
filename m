Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B270EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 08:17:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAFC560EFE
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 08:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAFC560EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BC584051E;
	Sun, 10 Oct 2021 08:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DNEiV3bRi3Nh; Sun, 10 Oct 2021 08:17:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B212E40512;
	Sun, 10 Oct 2021 08:17:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CCD11BF285
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 08:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6867F40512
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 08:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lbWJm5vmBBnJ for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 08:17:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41DC04050B
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 08:17:32 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id BE7CD240006;
 Sun, 10 Oct 2021 08:17:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mZU1P-00089t-JB; Sun, 10 Oct 2021 10:17:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jeremy Kerr <jk@ozlabs.org>
References: <87a6jl5qvb.fsf@tarshish> <20211007060119.GG2081069@scaer>
 <87bl3ym1qr.fsf@tarshish>
 <9a43025b2c5eb6be4848e07ff761e6a86080e50c.camel@ozlabs.org>
Date: Sun, 10 Oct 2021 10:17:27 +0200
In-Reply-To: <9a43025b2c5eb6be4848e07ff761e6a86080e50c.camel@ozlabs.org>
 (Jeremy Kerr's message of "Sun, 10 Oct 2021 10:54:32 +0800")
Message-ID: <87k0ils38o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] Buildroot patchwork strange Submitter
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkplcmVteSIgPT0gSmVyZW15IEtlcnIgPGprQG96bGFicy5vcmc+IHdyaXRlczoKCkhp
LAoKID4gSGkgQmFydWNoLAogPj4gWW91IGNhbiBzZWUgdGhhdCB0aGUgJ0Zyb20nIGhlYWRlciBz
aG93cyB0aGUgY29ycmVjdCBzZW5kZXI6CiA+PiAKID4+IMKgIEZyb206IFlhaXIgQmVuLUF2cmFo
YW0gdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+CgogPiBUaGF0J3Mgbm90
IHJlYWxseSB0aGUgY29ycmVjdCBzZW5kZXI7IGl0J3MgYmVlbiBtb2RpZmllZCBieSB0aGUgbGlz
dAogPiBzb2Z0d2FyZS4KCiA+PiBJIHNlZSB0aGUgc2FtZSBpbiB0aGlzIGVtYWlsIGZyb20gbXkg
YXJjaGl2ZS4KID4+IAogPj4gU3RpbGwsIHBhdGNod29yayBwcmV2aW91c2x5IHVzZWQgbXkgbmFt
ZSBhcyAiU3VibWl0dGVyIiwgYW5kIG5vdwogPj4gQ2hyaXN0aWFuJ3MuIFNvIEkgdGhpbmsgc29t
ZXRoaW5nIGlzIHdyb25nIHdpdGggcGF0Y2h3b3JrLgoKID4gWWVwLCB3ZSB0cnkgdG8gZmluZCB0
aGUgY29ycmVjdCBzZW5kZXIgaWYgdGhlIEZyb206IGhlYWRlciByZXBvcnRzIHRoZQogPiBsaXN0
IGFkZHJlc3MgYXMgdGhlIHNlbmRlci4KCiA+IEhvd2V2ZXIsIHRoZSBidWlsZHJvb3QgbGlzdCBo
YXMgY2hhbmdlZCBiYWNrLWFuZC1mb3J0aCBiZXR3ZWVuCiA+IGJ1aWxkcm9vdEBsaXN0cy5idWls
ZHJvb3Qub3JnIGFuZCBidWlsZHJvb3RAYnVpbGRyb290Lm9yZyBhIGNvdXBsZSBvZgogPiB0aW1l
cyByZWNlbnRseS4gVGhlIGxpc3QgYWRkcmVzcyB3YXMgc2V0IHRvCiA+IGJ1aWxkcm9vdEBsaXN0
cy5idWlsZHJvb3Qub3JnLCB3aGljaCBkaWRuJ3QgbWF0Y2ggdGhhdCAndmlhJyBoZWFkZXIuCgog
PiBJJ3ZlIHNpbmNlIHNldCBpdCB0byBidWlsZHJvb3RAYnVpbGRyb290Lm9yZywgc28gdGhlIHJl
dmVyc2UtZG1hcmMtZml4CiA+IHNob3VsZCB3b3JrIGFnYWluIC0gbGV0IG1lIGtub3cgaG93IGl0
IGdvZXMuCgpZZXMsIHNvcnJ5IGFib3V0IHRoYXQgYWxsIG9mIHlvdSwgaXQgc2hvdWxkIGFsbCBi
ZSBiYWNrIHN0YWJsZSBhZ2Fpbi4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
