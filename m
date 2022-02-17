Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49F0C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 13:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5722041825;
	Thu, 17 Feb 2022 13:12:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pTSq6s3VtyfQ; Thu, 17 Feb 2022 13:12:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9141441816;
	Thu, 17 Feb 2022 13:12:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F5891C113E
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 13:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E74E41816
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 13:12:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 84AyNeZtltMI for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 13:12:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFDE74180B
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 13:12:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7DF77240005;
 Thu, 17 Feb 2022 13:12:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nKgZo-0000D4-Iu; Thu, 17 Feb 2022 14:12:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20211124205607.3021277-1-aperez@igalia.com>
 <87mtjlwlvo.fsf@dell.be.48ers.dk> <20220124161611.GB162969@momiji>
 <20220217133620.GB757559@momiji>
Date: Thu, 17 Feb 2022 14:12:04 +0100
In-Reply-To: <20220217133620.GB757559@momiji> (Adrian Perez de Castro's
 message of "Thu, 17 Feb 2022 13:36:20 +0100")
Message-ID: <87a6epfxi3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: bump version to
 2.34.2
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

Pj4+Pj4gIkFkcmlhbiIgPT0gQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5j
b20+IHdyaXRlczoKCkhpLAoKID4+ID4gV2hhdCBhYm91dCB3ZWJraXRndGs/IEl0IHdvdWxkIGFs
c28gYmUgZ29vZCB0byBtb3ZlIHRoYXQgdG8gdGhlIDIuMzQueAogPj4gPiBzZXJpZXMgYmVmb3Jl
IHdlIHJlbGVhc2UgMjAyMi4wMi4KID4+IAogPj4gSSBoYXZlIGFsbCB0aGUgaW50ZW50aW9uIHRv
IHVwZGF0ZSBXZWJLaXRHVEsgYXMgc29vbiBhcyBJIGhhdmUgc29tZSBzcGFyZQogPj4gY3ljbGVz
IHRvIGZpZ3VyZSBvdXQgYSBidWlsZCBpc3N1ZSB3aGVuIFgxMSBoZWFkZXJzIGFyZSBub3QgcHJl
c2VudCAoZS5nLgogPj4gaW4gV2F5bGFuZC1vbmx5IGNvbmZpZ3VyYXRpb25zKTsgY3VycmVudGx5
IEkgYWxyZWFkeSBoYXZlIGEgV0lQIHBhdGNoIHNldAogPj4gaGVyZToKID4+IAogPj4gaHR0cHM6
Ly9naXQuc3IuaHQvfmFwZXJlemRjL2J1aWxkcm9vdC9sb2cvd2lwL3dlYmtpdGd0awoKID4gSGVy
ZSB3ZSBnbzogaHR0cHM6Ly9idWdzLndlYmtpdC5vcmcvc2hvd19idWcuY2dpP2lkPTIzNjc3MCDi
gJQgdHVybnMgb3V0IHRoZQogPiBidWlsZCB3YXMgYnJva2VuIGluIHRoZSBkZXZlbG9wbWVudCBi
cmFuY2ggYXMgd2VsbCwgYW5kIEkgcGxhbiB0byBiYWNrcG9ydAogPiB0aGUgcGF0Y2ggdG8gMi4z
NC54LgoKID4+IEFsc28gSSBqdXN0IHN1Ym1pdHRlZCBzb21lIG1vbWVudHMgYWdvIGEgc21hbGwg
cGF0Y2ggdG8gdXBkYXRlIHRoZSBXUEUgV2ViS2l0CiA+PiBwYWNrYWdlIHRvIDIuMzQuNCBhcyB3
ZWxsLgoKID4gSSBhbSByZWxlYXNpbmcgMi4zNC42IHRoaXMgd2Vlaywgd2hpY2ggd2lsbCBpbmNs
dWRlIHRoZSBwYXRjaCBtZW50aW9uZWQKID4gYWJvdmUsIHNvIEkgd2lsbCBzdWJtaXQgZGlyZWN0
bHkgYW4gdXBkYXRlIHRvIDIuMzQuNiBvbmNlIGl0IGhhcyBiZWVuCiA+IHB1Ymxpc2hlZC4KCk9r
LiBFdmVuIHRob3VnaCB3ZSBhcmUgcG9zdC1yYzEsIEkgdGhpbmsgaXQgc3RpbGwgbWFrZXMgc2Vu
c2UgdG8gaW5jbHVkZQp0aGlzIG9uIG1hc3RlciBmb3IgMjAyMi4wMi4KCi0tIApCeWUsIFBldGVy
IEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
