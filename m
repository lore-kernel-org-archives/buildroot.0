Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE84C433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1D43402BE;
	Wed, 26 Jan 2022 21:23:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FV5zkSNQph_n; Wed, 26 Jan 2022 21:23:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C11440290;
	Wed, 26 Jan 2022 21:23:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C95971BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B895E40290
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:23:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ki-J3eoOwVaB for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:23:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DC3E4026E
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:23:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 583D240002;
 Wed, 26 Jan 2022 21:23:11 +0000 (UTC)
Date: Wed, 26 Jan 2022 22:23:09 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220126222309.44ad5b0f@windsurf>
In-Reply-To: <20220124071453.16225-1-christian@paral.in>
References: <20220124071453.16225-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAyMyBKYW4gMjAyMiAyMzoxNDo1MyAtMDgwMApDaHJpc3RpYW4gU3Rld2FydCB2aWEg
YnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IENWRS0yMDIxLTQz
ODE2OiAiVW5wcml2aWxlZ2VkIHBvZCB1c2luZyBgaG9zdFBhdGhgIGNhbiBzaWRlLXN0ZXAgYWN0
aXZlIExTTSB3aGVuCj4gaXQgaXMgU0VMaW51eCIKPiAKPiBDb250YWluZXJzIGxhdW5jaGVkIHRo
cm91Z2ggY29udGFpbmVyZOKAmXMgQ1JJIGltcGxlbWVudGF0aW9uIG9uIExpbnV4IHN5c3RlbXMK
PiB3aGljaCB1c2UgdGhlIFNFTGludXggc2VjdXJpdHkgbW9kdWxlIGFuZCBjb250YWluZXJkIHZl
cnNpb25zIHNpbmNlIHYxLjUuMCBjYW4KPiBjYXVzZSBhcmJpdHJhcnkgZmlsZXMgYW5kIGRpcmVj
dG9yaWVzIG9uIHRoZSBob3N0IHRvIGJlIHJlbGFiZWxlZCB0byBtYXRjaCB0aGUKPiBjb250YWlu
ZXIgcHJvY2VzcyBsYWJlbCB0aHJvdWdoIHRoZSB1c2Ugb2Ygc3BlY2lhbGx5LWNvbmZpZ3VyZWQg
YmluZCBtb3VudHMgaW4gYQo+IGhvc3RQYXRoIHZvbHVtZS4gVGhpcyByZWxhYmVsaW5nIGVsZXZh
dGVzIHBlcm1pc3Npb25zIGZvciB0aGUgY29udGFpbmVyLAo+IGdyYW50aW5nIGZ1bGwgcmVhZC93
cml0ZSBhY2Nlc3Mgb3ZlciB0aGUgYWZmZWN0ZWQgZmlsZXMgYW5kIGRpcmVjdG9yaWVzLgo+IEt1
YmVybmV0ZXMgYW5kIGNyaWN0bCBjYW4gYm90aCBiZSBjb25maWd1cmVkIHRvIHVzZSBjb250YWlu
ZXJk4oCZcyBDUkkKPiBpbXBsZW1lbnRhdGlvbi4KPiAKPiBodHRwczovL2dpdGh1Yi5jb20vYWR2
aXNvcmllcy9HSFNBLW12ZmYtaDNjai13ajljCj4gaHR0cHM6Ly9naXRodWIuY29tL2NvbnRhaW5l
cmQvY29udGFpbmVyZC9yZWxlYXNlcy90YWcvdjEuNS45Cj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBwYXJhbC5pbj4KPiAtLS0KPiAgcGFja2FnZS9jb250
YWluZXJkL2NvbnRhaW5lcmQuaGFzaCB8IDIgKy0KPiAgcGFja2FnZS9jb250YWluZXJkL2NvbnRh
aW5lcmQubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9t
YXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
