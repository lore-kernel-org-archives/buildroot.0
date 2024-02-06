Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C85C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 22:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0273042048;
	Tue,  6 Feb 2024 22:42:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fo77EYWSMurv; Tue,  6 Feb 2024 22:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBB3442064
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBB3442064;
	Tue,  6 Feb 2024 22:42:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15BC01BF2C4
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1032F83412
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:42:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xR9rM3jkF9RL for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 22:42:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0762083372
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0762083372
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0762083372
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 22:42:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 921B860002;
 Tue,  6 Feb 2024 22:42:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rXU92-00ENTG-0F;
 Tue, 06 Feb 2024 23:42:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20240108064820.3450359-1-james.hilliard1@gmail.com>
 <0eb549da-1140-4071-8e58-376d9dd5f434@bubu1.eu>
 <a7c57251-16f3-4c1f-b271-df3108f2d8bc@bubu1.eu>
Date: Tue, 06 Feb 2024 23:42:18 +0100
In-Reply-To: <a7c57251-16f3-4c1f-b271-df3108f2d8bc@bubu1.eu> (Marcus Hoffmann
 via buildroot's message of "Tue, 6 Feb 2024 13:42:02 +0100")
Message-ID: <87fry52p11.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python-anyio: bump to version
 4.2.0
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIk1hcmN1cyIgPT0gTWFyY3VzIEhvZmZtYW5uIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6CgogPiBIaSwKID4gT24gMDguMDEuMjQgMTQ6MDMsIE1h
cmN1cyBIb2ZmbWFubiB2aWEgYnVpbGRyb290IHdyb3RlOgogPj4gSGkgSmFtZXMsCiA+PiBPbiAw
OC4wMS4yNCAwNzo0OCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6CiA+Pj4gU2lnbmVkLW9mZi1ieTog
SmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CiA+Pj4gLS0tCiA+Pj4g
wqAgcGFja2FnZS9weXRob24tYW55aW8vcHl0aG9uLWFueWlvLmhhc2ggfCA0ICsrLS0KID4+PiDC
oCBwYWNrYWdlL3B5dGhvbi1hbnlpby9weXRob24tYW55aW8ubWvCoMKgIHwgNCArKy0tCiA+Pj4g
wqAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiA+Pj4g
CiA+Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWFueWlvL3B5dGhvbi1hbnlpby5oYXNo
CiA+Pj4gYi9wYWNrYWdlL3B5dGhvbi1hbnlpby9weXRob24tYW55aW8uaGFzaAogPj4+IGluZGV4
IDFjZWE1NDliYzEuLmU3N2QzMDI0OWMgMTAwNjQ0CiA+Pj4gLS0tIGEvcGFja2FnZS9weXRob24t
YW55aW8vcHl0aG9uLWFueWlvLmhhc2gKID4+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1hbnlpby9w
eXRob24tYW55aW8uaGFzaAogPj4+IEBAIC0xLDUgKzEsNSBAQAogPj4+IMKgICMgbWQ1LCBzaGEy
NTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvYW55aW8vanNvbgogPj4+IC1tZDXCoCA1OGQy
ODhkZDg0ZTI4ZTI1MDdmZjljZTdlNDYyMDAxMMKgIGFueWlvLTMuNy4xLnRhci5negogPj4+IC1z
aGEyNTYKID4+PiA0NGEzYzlhYmEwZjVkZWZhNDMyNjFhOGIzZWZiOTc4OTFmMmJkN2Q4MDRlMGUx
ZjU2NDE5YmVmYTFhZGZjNzgwCiA+Pj4gYW55aW8tMy43LjEudGFyLmd6CiA+Pj4gK21kNcKgIDIy
ZTY2MGZmZjFhNTg0ZTcyMjgxZjBkNmEwODNlNGUwwqAgYW55aW8tNC4yLjAudGFyLmd6CiA+Pj4g
K3NoYTI1NgogPj4+IGUxODc1YmI0YjRlMmRlMTY2OWY0YmM3ODY5YjZkM2Y1NDIzMWNkY2VkNzE2
MDVlNmU2NGM5YmU3N2UzYmU1MGYKID4+PiBhbnlpby00LjIuMC50YXIuZ3oKID4+IFRoaXMgd2Fz
IGludHJvZHVjZWQgaW4gdGhpcyB2ZXJzaW9uIGJlY2F1c2UgZmFzdGFwaSBkaWRuJ3Qgc3VwcG9y
dCBhCiA+PiBuZXdlciB2ZXJzaW9uLgogPj4gRmFzdGFwaSAwLjEwOC4wIHN1cHBvcnRzIHN0YXJs
ZXR0ZSAwLjMyIG5vdywgd2hpY2ggc3VwcG9ydHMgYW55aW8KID4+IDQuMi4wLgogPj4gU28gSSB0
aGluayB0aGVzZSBzaG91bGQgYmUgYnVtcGVkIHRvZ2V0aGVyL2luIHRoZSBzYW1lIHNlcmllcz8K
CiA+IE5vdyB0aGF0IG1vcmUgcmVjZW50IGZhc3RhcGkgYW5kIHN0YXJsZXR0ZSB2ZXJzaW9ucyBh
cmUgYXZhaWxhYmxlIHRoaXMKID4gY2FuIGJlIGFwcGxpZWQuCgpDb21taXR0ZWQsIHRoYW5rcy4K
Ci0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
