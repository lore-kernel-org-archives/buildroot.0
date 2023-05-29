Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E636C77B7E
	for <buildroot@archiver.kernel.org>; Mon, 29 May 2023 07:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05D1E417C8;
	Mon, 29 May 2023 07:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05D1E417C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qo_WHaucbNVK; Mon, 29 May 2023 07:03:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48AC0417C2;
	Mon, 29 May 2023 07:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48AC0417C2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 701D01BF831
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 07:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CBBD611F6
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 07:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CBBD611F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3z5TI6iAbGpi for <buildroot@lists.busybox.net>;
 Mon, 29 May 2023 07:03:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CB0C608A6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CB0C608A6
 for <buildroot@buildroot.org>; Mon, 29 May 2023 07:03:47 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3B73C0005;
 Mon, 29 May 2023 07:03:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q3Wuu-008Yuw-4a; Mon, 29 May 2023 09:03:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Timothy Groves <the.tail.kinker@gmail.com>
References: <7de40638-e5ee-8e1f-5395-46a468fd2d45@gmail.com>
Date: Mon, 29 May 2023 09:03:44 +0200
In-Reply-To: <7de40638-e5ee-8e1f-5395-46a468fd2d45@gmail.com> (Timothy
 Groves's message of "Sat, 20 May 2023 07:22:56 -0400")
Message-ID: <87ttvvsjov.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] Total newbie in over my head
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

Pj4+Pj4gIlRpbW90aHkiID09IFRpbW90aHkgR3JvdmVzIDx0aGUudGFpbC5raW5rZXJAZ21haWwu
Y29tPiB3cml0ZXM6CgpIaSwKCiA+IEkganVzdCB0cmllZCBidWlsZHJvb3QgZm9yIHRoZSBmaXJz
dCB0aW1lLsKgIE15IHVzZSBjYXNlIGxvb2tzIGxlc3MKID4gdGhhbiB1c3VhbDrCoCBJJ20gdHJ5
aW5nIHRvIGdldCBhICpyZWFsbHkqIG9sZCBsYXB0b3AgZnVuY3Rpb25hbAogPiBhZ2Fpbi7CoCBC
dXQgbXkgYXR0ZW1wdHMgdG8gYnVpbGQgYSBsaXZlIGNkIG1lZXQgd2l0aCBmYWlsdXJlLgoKT0su
IFRoaXMgY2FuIGJlIGRvbmUgd2l0aCBCdWlsZHJvb3QsIGJ1dCBnaXZlbiB0aGF0IGl0IGlzIGEg
bm9ybWFsIFBDLAp3aHkgbm90IGp1c3QgYW4gKG9sZCB2ZXJzaW9uIG9mKSBhIG5vcm1hbCBMaW51
eCBkaXN0cmlidXRpb24/CgoKID4gSSd2ZSBlbmFibGVkIGlzb2xpbnV4LCBzZWxlY3RlZCB0aGUg
aXNvOTY2MCBmaWxlIHN5c3RlbSwgYW5kIHNlbGVjdGVkCiA+IGlzb2xpbnV4IGFzIG15IGJvb3Qg
bG9hZGVyLsKgIChUaGlzIGJlY2F1c2Ugb2YgdGhlIGxhY2sgb2YgY2Qtcm9tIG9uCiA+IHRoZSB0
YXJnZXQgbWFjaGluZTvCoCBJIG5lZWRlZCB0byBjcmVhdGUgYSBsaXZlIFVTQiBzdGljay4pwqAg
QnV0IHdoZW4gSSAKID4gYXR0ZW1wdCB0byBib290IHRoZSByZXN1bHRpbmcgaW1hZ2UgdXNpbmcg
cWVtdSwgaXQgaW5zaXN0cyB0aGF0IGl0CiA+IGNhbm5vdCBmaW5kIGEgYm9vdGFibGUgaW1hZ2Uu
CgpIYXJkIHRvIHNheSB3aXRob3V0IG1vcmUgZGV0YWlscywgYnV0IEkgYmVsaWV2ZSB5b3UgbmVl
ZCB0byB1c2UgdGhlCmlzb2h5YnJpZCB2YXJpYW50IHRvIGJlIGFibGUgdG8gYm9vdCBhbiBpc285
NjYwIGZpbGUgc3lzdGVtIGZyb20gYSBVU0IKc3RpY2s6CgpodHRwczovL3dpa2kuc3lzbGludXgu
b3JnL3dpa2kvaW5kZXgucGhwP3RpdGxlPUlzb2h5YnJpZAoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dh
YXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
