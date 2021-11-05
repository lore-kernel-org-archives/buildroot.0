Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D14C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 14:30:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD3AC61183
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 14:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD3AC61183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B48661681;
	Fri,  5 Nov 2021 14:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QhQqJFsDWlCl; Fri,  5 Nov 2021 14:30:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3EA66166A;
	Fri,  5 Nov 2021 14:30:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 895851BF2F8
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 14:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 782A840487
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 14:30:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WOaqZGfP2GeU for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 14:30:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09DEE4018B
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 14:30:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 30EEE240012;
 Fri,  5 Nov 2021 14:30:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mj0EZ-0004n0-Bh; Fri, 05 Nov 2021 15:30:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <87lf22iv3c.fsf@dell.be.48ers.dk>
 <AE14FCC4-756C-4549-A05A-9969D06243F5@benettiengineering.com>
Date: Fri, 05 Nov 2021 15:30:23 +0100
In-Reply-To: <AE14FCC4-756C-4549-A05A-9969D06243F5@benettiengineering.com>
 (Giulio Benetti's message of "Fri, 5 Nov 2021 14:52:47 +0100")
Message-ID: <87czneisjk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] configs/nezha_defconfig: new defconfig
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
Cc: buildroot@buildroot.org, samuel@sholland.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkdpdWxpbyIgPT0gR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGll
bmdpbmVlcmluZy5jb20+IHdyaXRlczoKCkhpLAoKID4+PiBJIGZpbmQgaXQgdG8gYmUgZWFzaWVy
IHRvIHJlYWQuCiA+PiAKID4+IE9rLiBUaGUgImRvY3VtZW50YXRpb24iIGFjdHVhbGx5IGxpc3Rz
IHRoaXMgaW4gNTEyYiBzZWN0b3JzLCBidXQgSSBkb24ndAogPj4gdGhpbmsgZ2VuaW1hZ2UgaGFz
IHNvbWV0aGluZyBuaWNlIHRvIGhhbmRsZSB0aGlzOgoKID4gSSBkb27igJl0IHRoaW5rIGl0IHNo
b3VsZCBtYXR0ZXIgdGhlIGJsb2NrIHNpemUgYmVjYXVzZSB3ZeKAmXJlIGRlc2NyaWJpbmcKID4g
aW4gYnl0ZXMsIG5vdCBpbiBibG9jayBzaXplLCBpZiB3ZSBzYXkgOEsgaXTigJlzIDhLQiwgMTI4
S0IgaXMgMTI4S0IgYW5kCiA+IHNvIG9uLiBDb3JyZWN0PwoKU3VyZSwganVzdCBhYm91dCByZWFk
YWJpbGl0eSAtIEUuRy4gSSBkb24ndCBrbm93IGlmIDEyOEsgaXMgYSBsb3QgbW9yZQpyZWFkYWJs
ZSB0aGFuIDEzMTA3MiBpZiB5b3UgYXJlIGxvb2tpbmcgYXQgZG9jdW1lbnRhdGlvbiB0aGF0IHNh
eXMKc2VjdG9yIDI1NiwgYnV0IE9LLgoKID4gSSBsZXQgeW91IGtub3cgaWYgdGhpcyBpcyBuZWVk
ZWQgZm9yIGFsbCAuY2ZnIGZpbGVzIGFuZCBpZiBpdCB3b3JrcwogPiBvdGhlcndpc2Ugb24gdGhv
c2Ugc3BlY2lmaWMgY2FzZXMgd2UgY2FuIHNwZWNpZnkgcGVyIGJ5dGUuIEkgZmluZCBpdAogPiBt
b3JlIGNsZWFyLgoKID4gSXMgb2s/CgpGb3IgbWUgaXQgaXMsIHllcy4KCi0tIApCeWUsIFBldGVy
IEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
