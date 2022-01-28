Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAE0C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 21:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AFC284C78;
	Fri, 28 Jan 2022 21:07:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xE1SE69XCJ3w; Fri, 28 Jan 2022 21:07:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9311B84C73;
	Fri, 28 Jan 2022 21:07:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62B191BF5DC
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50EE341CD4
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NqO3KjcuZvDU for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 21:07:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57F5641CD3
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 21:07:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5825260006;
 Fri, 28 Jan 2022 21:07:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nDYTE-0004oU-M8; Fri, 28 Jan 2022 22:07:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220124071453.16225-1-christian@paral.in>
 <20220126222309.44ad5b0f@windsurf>
Date: Fri, 28 Jan 2022 22:07:48 +0100
In-Reply-To: <20220126222309.44ad5b0f@windsurf> (Thomas Petazzoni's message of
 "Wed, 26 Jan 2022 22:23:09 +0100")
Message-ID: <87mtjf4li3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: security bump to
 version 1.5.9
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290
bGluLmNvbT4gd3JpdGVzOgoKID4gT24gU3VuLCAyMyBKYW4gMjAyMiAyMzoxNDo1MyAtMDgwMAog
PiBDaHJpc3RpYW4gU3Rld2FydCB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zz4gd3JvdGU6CgogPj4gQ1ZFLTIwMjEtNDM4MTY6ICJVbnByaXZpbGVnZWQgcG9kIHVzaW5nIGBo
b3N0UGF0aGAgY2FuIHNpZGUtc3RlcCBhY3RpdmUgTFNNIHdoZW4KID4+IGl0IGlzIFNFTGludXgi
CiA+PiAKID4+IENvbnRhaW5lcnMgbGF1bmNoZWQgdGhyb3VnaCBjb250YWluZXJk4oCZcyBDUkkg
aW1wbGVtZW50YXRpb24gb24gTGludXggc3lzdGVtcwogPj4gd2hpY2ggdXNlIHRoZSBTRUxpbnV4
IHNlY3VyaXR5IG1vZHVsZSBhbmQgY29udGFpbmVyZCB2ZXJzaW9ucyBzaW5jZSB2MS41LjAgY2Fu
CiA+PiBjYXVzZSBhcmJpdHJhcnkgZmlsZXMgYW5kIGRpcmVjdG9yaWVzIG9uIHRoZSBob3N0IHRv
IGJlIHJlbGFiZWxlZCB0byBtYXRjaCB0aGUKID4+IGNvbnRhaW5lciBwcm9jZXNzIGxhYmVsIHRo
cm91Z2ggdGhlIHVzZSBvZiBzcGVjaWFsbHktY29uZmlndXJlZCBiaW5kIG1vdW50cyBpbiBhCiA+
PiBob3N0UGF0aCB2b2x1bWUuIFRoaXMgcmVsYWJlbGluZyBlbGV2YXRlcyBwZXJtaXNzaW9ucyBm
b3IgdGhlIGNvbnRhaW5lciwKID4+IGdyYW50aW5nIGZ1bGwgcmVhZC93cml0ZSBhY2Nlc3Mgb3Zl
ciB0aGUgYWZmZWN0ZWQgZmlsZXMgYW5kIGRpcmVjdG9yaWVzLgogPj4gS3ViZXJuZXRlcyBhbmQg
Y3JpY3RsIGNhbiBib3RoIGJlIGNvbmZpZ3VyZWQgdG8gdXNlIGNvbnRhaW5lcmTigJlzIENSSQog
Pj4gaW1wbGVtZW50YXRpb24uCiA+PiAKID4+IGh0dHBzOi8vZ2l0aHViLmNvbS9hZHZpc29yaWVz
L0dIU0EtbXZmZi1oM2NqLXdqOWMKID4+IGh0dHBzOi8vZ2l0aHViLmNvbS9jb250YWluZXJkL2Nv
bnRhaW5lcmQvcmVsZWFzZXMvdGFnL3YxLjUuOQogPj4gCiA+PiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQHBhcmFsLmluPgogPj4gLS0tCiA+PiBwYWNrYWdlL2Nv
bnRhaW5lcmQvY29udGFpbmVyZC5oYXNoIHwgMiArLQogPj4gcGFja2FnZS9jb250YWluZXJkL2Nv
bnRhaW5lcmQubWsgICB8IDIgKy0KID4+IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKQ29tbWl0dGVkIHRvIDIwMjEuMTEueCwgdGhhbmtzICgyMDIxLjAy
Lnggbm90IGFmZmVjdGVkKS4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
