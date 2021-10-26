Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA21EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:28:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4992560EC0
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4992560EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E7624011D;
	Tue, 26 Oct 2021 12:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Da4YSzb_mVj; Tue, 26 Oct 2021 12:28:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B6EE400F9;
	Tue, 26 Oct 2021 12:28:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D08101BF38D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD516403D2
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:28:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IKH2Ii0uxRbR for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 12:28:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE8E2401EF
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:28:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 74CC11BF209;
 Tue, 26 Oct 2021 12:28:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mfLYp-0006ZO-Il; Tue, 26 Oct 2021 14:28:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20211021064029.31168-1-peter@korsgaard.com>
Date: Tue, 26 Oct 2021 14:28:11 +0200
In-Reply-To: <20211021064029.31168-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 21 Oct 2021 08:40:28 +0200")
Message-ID: <87o87ct1gk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.21.1
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdy
aXRlczoKCiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgc2VjdXJpdHkgaXNzdWVzOgogPiAxNi4xNS4w
OgogPiAtIEFTVEVSSVNLLTI5MDU3OiBwanNpcDogQ3Jhc2ggb24gY2FsbCByZWplY3Rpb24gZHVy
aW5nIGhpZ2ggbG9hZAoKID4gMTYuMTUuMToKID4gLSBBU1QtMjAyMC0wMDM6IFJlbW90ZSBjcmFz
aCBpbiByZXNfcGpzaXBfZGl2ZXJzaW9uCiA+ICAgQSBjcmFzaCBjYW4gb2NjdXIgaW4gQXN0ZXJp
c2sgd2hlbiBhIFNJUCBtZXNzYWdlIGlzIHJlY2VpdmVkIHRoYXQgaGFzIGEKID4gICBIaXN0b3J5
LUluZm8gaGVhZGVyLCB3aGljaCBjb250YWlucyBhIHRlbC11cmkuCiA+ICAgaHR0cHM6Ly9kb3du
bG9hZHMuYXN0ZXJpc2sub3JnL3B1Yi9zZWN1cml0eS9BU1QtMjAyMC0wMDMucGRmCgogPiAtIEFT
VC0yMDIwLTAwNDogUmVtb3RlIGNyYXNoIGluIHJlc19wanNpcF9kaXZlcnNpb24KID4gICBBIGNy
YXNoIGNhbiBvY2N1ciBpbiBBc3RlcmlzayB3aGVuIGEgU0lQIDE4MSByZXNwb25zZSBpcyByZWNl
aXZlZCB0aGF0IGhhcwogPiAgIGEgRGl2ZXJzaW9uIGhlYWRlciwgd2hpY2ggY29udGFpbnMgYSB0
ZWwtdXJpLgogPiAgIGh0dHBzOi8vZG93bmxvYWRzLmFzdGVyaXNrLm9yZy9wdWIvc2VjdXJpdHkv
QVNULTIwMjAtMDA0LnBkZgoKID4gMTYuMTYuMDoKID4gLSBBU1RFUklTSy0yOTIxOTogcmVzX3Bq
c2lwX2RpdmVyc2lvbjogQ3Jhc2ggaWYgVGVsIFVSSSBjb250YWlucyBIaXN0b3J5LUluZm8KCiA+
IDE2LjE2LjE6CiA+IC0gQVNULTIwMjEtMDAxOiBSZW1vdGUgY3Jhc2ggaW4gcmVzX3Bqc2lwX2Rp
dmVyc2lvbgogPiAgIElmIGEgcmVnaXN0ZXJlZCB1c2VyIGlzIHRyaWNrZWQgaW50byBkaWFsaW5n
IGEgbWFsaWNpb3VzIG51bWJlciB0aGF0IHNlbmRzCiA+ICAgbG90cyBvZiAxODEgcmVzcG9uc2Vz
IHRvIEFzdGVyaXNrLCBlYWNoIG9uZSB3aWxsIGNhdXNlIGEgMTgxIHRvIGJlIHNlbnQKID4gICBi
YWNrIHRvIHRoZSBvcmlnaW5hbCBjYWxsZXIgd2l0aCBhbiBpbmNyZWFzaW5nIG51bWJlciBvZiBl
bnRyaWVzIGluIHRoZQogPiAgIOKAnFN1cHBvcnRlZOKAnSBoZWFkZXIuICBFdmVudHVhbGx5IHRo
ZSBudW1iZXIgb2YgZW50cmllcyBpbiB0aGUgaGVhZGVyCiA+ICAgZXhjZWVkcyB0aGUgc2l6ZSBv
ZiB0aGUgZW50cnkgYXJyYXkgYW5kIGNhdXNlcyBhIGNyYXNoLgogPiAgIGh0dHBzOi8vZG93bmxv
YWRzLmFzdGVyaXNrLm9yZy9wdWIvc2VjdXJpdHkvQVNULTIwMjEtMDAxLnBkZgoKID4gLSBBU1Qt
MjAyMS0wMDI6IFJlbW90ZSBjcmFzaCBwb3NzaWJsZSB3aGVuIG5lZ290aWF0aW5nIFQuMzgKID4g
ICBXaGVuIHJlLW5lZ290aWF0aW5nIGZvciBULjM4IGlmIHRoZSBpbml0aWFsIHJlbW90ZSByZXNw
b25zZSB3YXMgZGVsYXllZAogPiAgIGp1c3QgZW5vdWdoIEFzdGVyaXNrIHdvdWxkIHNlbmQgYm90
aCBhdWRpbyBhbmQgVC4zOCBpbiB0aGUgU0RQLiAgSWYgdGhpcwogPiAgIGhhcHBlbmVkLCBhbmQg
dGhlIHJlbW90ZSByZXNwb25kZWQgd2l0aCBhIGRlY2xpbmVkIFQuMzggc3RyZWFtIHRoZW4KID4g
ICBBc3RlcmlzayB3b3VsZCBjcmFzaC4KID4gICBodHRwczovL2Rvd25sb2Fkcy5hc3Rlcmlzay5v
cmcvcHViL3NlY3VyaXR5L0FTVC0yMDIxLTAwMi5wZGYKCiA+IC0gQVNULTIwMjEtMDAzOiBSZW1v
dGUgYXR0YWNrZXIgY291bGQgcHJlbWF0dXJlbHkgdGVhciBkb3duIFNSVFAgY2FsbHMKID4gICBB
biB1bmF1dGhlbnRpY2F0ZWQgcmVtb3RlIGF0dGFja2VyIGNvdWxkIHJlcGxheSBTUlRQIHBhY2tl
dHMgd2hpY2ggY291bGQKID4gICBjYXVzZSBhbiBBc3RlcmlzayBpbnN0YW5jZSBjb25maWd1cmVk
IHdpdGhvdXQgc3RyaWN0IFJUUCB2YWxpZGF0aW9uIHRvCiA+ICAgdGVhciBkb3duIGNhbGxzIHBy
ZW1hdHVyZWx5LgogPiAgIGh0dHBzOi8vZG93bmxvYWRzLmFzdGVyaXNrLm9yZy9wdWIvc2VjdXJp
dHkvQVNULTIwMjEtMDAzLnBkZgoKID4gLSBBU1QtMjAyMS0wMDQ6IEFuIHVuc3VzcGVjdGluZyB1
c2VyIGNvdWxkIGNyYXNoIEFzdGVyaXNrIHdpdGggbXVsdGlwbGUKID4gICBob2xkL3VuaG9sZCBy
ZXF1ZXN0cwogPiAgIER1ZSB0byBhIHNpZ25lZG5lc3MgY29tcGFyaXNvbiBtaXNtYXRjaCwgYW4g
YXV0aGVudGljYXRlZCBXZWJSVEMgY2xpZW50CiA+ICAgY291bGQgY2F1c2UgYSBzdGFjayBvdmVy
ZmxvdyBhbmQgQXN0ZXJpc2sgY3Jhc2ggYnkgc2VuZGluZyBtdWx0aXBsZQogPiAgIGhvbGQvdW5o
b2xkIHJlcXVlc3RzIGluIHF1aWNrIHN1Y2Nlc3Npb24uCiA+ICAgaHR0cHM6Ly9kb3dubG9hZHMu
YXN0ZXJpc2sub3JnL3B1Yi9zZWN1cml0eS9BU1QtMjAyMS0wMDQucGRmCgogPiAtIEFTVC0yMDIx
LTAwNTogUmVtb3RlIENyYXNoIFZ1bG5lcmFiaWxpdHkgaW4gUEpTSVAgY2hhbm5lbCBkcml2ZXIK
ID4gICBHaXZlbiBhIHNjZW5hcmlvIHdoZXJlIGFuIG91dGdvaW5nIGNhbGwgaXMgcGxhY2VkIGZy
b20gQXN0ZXJpc2sgdG8gYQogPiAgIHJlbW90ZSBTSVAgc2VydmVyIGl0IGlzIHBvc3NpYmxlIGZv
ciBhIGNyYXNoIHRvIG9jY3VyLgogPiAgIGh0dHBzOi8vZG93bmxvYWRzLmFzdGVyaXNrLm9yZy9w
dWIvc2VjdXJpdHkvQVNULTIwMjEtMDA1LnBkZgoKID4gMTYuMTYuMjoKID4gLSBBU1QtMjAyMS0w
MDY6IENyYXNoIHdoZW4gbmVnb3RpYXRpbmcgVC4zOCB3aXRoIGEgemVybyBwb3J0CiA+ICAgV2hl
biBBc3RlcmlzayBzZW5kcyBhIHJlLWludml0ZSBpbml0aWF0aW5nIFQuMzggZmF4aW5nIGFuZCB0
aGUgZW5kcG9pbnQKID4gICByZXNwb25kcyB3aXRoIGEgbT1pbWFnZSBsaW5lIGFuZCB6ZXJvIHBv
cnQsIGEgY3Jhc2ggd2lsbCBvY2N1ciBpbgogPiAgIEFzdGVyaXNrLgogPiAgIFRoaXMgaXMgYSBy
ZW9jY3VycmVuY2Ugb2YgQVNULTIwMTktMDA0LgogPiAgIGh0dHBzOi8vZG93bmxvYWRzLmFzdGVy
aXNrLm9yZy9wdWIvc2VjdXJpdHkvQVNULTIwMjEtMDA2LnBkZgoKID4gMTYuMTcuMDoKID4gLSBB
U1RFUklTSy0yOTIwMyAvIEFTVC0yMDIxLTAwMiDigJQgQW5vdGhlciBzY2VuYXJpbyBpcyBjYXVz
aW5nIGEgY3Jhc2gKCiA+IC0gQVNURVJJU0stMjkyNjA6IHNSVFAgUmVwbGF5IFByb3RlY3Rpb24g
aWdub3JlZDsgZXZlbiB0ZWFycyBkb3duIGxvbmcgY2FsbHMKCiA+IC0gQVNURVJJU0stMjkyMjc6
IHJlc19wanNpcF9kaXZlcnNpb246IHNlbmRpbmcgbXVsdGlwbGUgMTgxIHJlc3BvbnNlcyBjYXVz
ZXMKID4gICBtZW1vcnkgY29ycnVwdGlvbiBhbmQgY3Jhc2gKCiA+IDE2LjE5LjE6CiA+IC0gQVNU
LTIwMjEtMDA3OiBSZW1vdGUgQ3Jhc2ggVnVsbmVyYWJpbGl0eSBpbiBQSlNJUCBjaGFubmVsIGRy
aXZlcgogPiAgIFdoZW4gQXN0ZXJpc2sgcmVjZWl2ZXMgYSByZS1JTlZJVEUgd2l0aG91dCBTRFAg
YWZ0ZXIgaGF2aW5nIHNlbnQgYSBCWUUKID4gICByZXF1ZXN0IGEgY3Jhc2ggd2lsbCBvY2N1ci4g
IFRoaXMgb2NjdXJzIGR1ZSB0byB0aGUgQXN0ZXJpc2sgY2hhbm5lbCBubwogPiAgIGxvbmdlciBi
ZWluZyBwcmVzZW50IHdoaWxlIGNvZGUgYXNzdW1lcyBpdCBpcy4KID4gICBodHRwczovL2Rvd25s
b2Fkcy5hc3Rlcmlzay5vcmcvcHViL3NlY3VyaXR5L0FTVC0yMDIxLTAwNy5wZGYKCiA+IC0gQVNU
LTIwMjEtMDA4OiBSZW1vdGUgY3Jhc2ggd2hlbiB1c2luZyBJQVgyIGNoYW5uZWwgZHJpdmVyCiA+
ICAgSWYgdGhlIElBWDIgY2hhbm5lbCBkcml2ZXIgcmVjZWl2ZXMgYSBwYWNrZXQgdGhhdCBjb250
YWlucyBhbiB1bnN1cHBvcnRlZAogPiAgIG1lZGlhIGZvcm1hdCBpdCBjYW4gY2F1c2UgYSBjcmFz
aCB0byBvY2N1ciBpbiBBc3Rlcmlzay4KID4gICBodHRwczovL2Rvd25sb2Fkcy5hc3Rlcmlzay5v
cmcvcHViL3NlY3VyaXR5L0FTVC0yMDIxLTAwOC5wZGYKCiA+IC0gQVNULTIwMjEtMDA5OiBwanBy
b2plY3QvcGpzaXA6IGNyYXNoIHdoZW4gU1NMIHNvY2tldCBkZXN0cm95ZWQgZHVyaW5nCiA+ICAg
aGFuZHNoYWtlCiA+ICAgRGVwZW5kaW5nIG9uIHRoZSB0aW1pbmcsIGl04oCZcyBwb3NzaWJsZSBm
b3IgQXN0ZXJpc2sgdG8gY3Jhc2ggd2hlbiB1c2luZyBhCiA+ICAgVExTIGNvbm5lY3Rpb24gaWYg
dGhlIHVuZGVybHlpbmcgc29ja2V0IHBhcmVudC9saXN0ZW5lciBnZXRzIGRlc3Ryb3llZAogPiAg
IGR1cmluZyB0aGUgaGFuZHNoYWtlLgogPiAgIGh0dHBzOi8vZG93bmxvYWRzLmFzdGVyaXNrLm9y
Zy9wdWIvc2VjdXJpdHkvQVNULTIwMjEtMDA5LnBkZgoKID4gMTYuMjAuMDoKID4gLSBBU1RFUklT
Sy0yOTQxNTogQ3Jhc2ggaW4gUEpTSVAgVExTIHRyYW5zcG9ydAoKID4gLSBBU1RFUklTSy0yOTM4
MTogY2hhbl9wanNpcDogUmVtb3RlIGRlbmlhbCBvZiBzZXJ2aWNlIGJ5IGFuIGF1dGhlbnRpY2F0
ZWQKID4gICB1c2VyCgogPiBJbiBhZGRpdGlvbiwgYSBsYXJnZSBudW1iZXIgb2YgYnVnZml4ZXMu
CgogPiBEcm9wIG5vdyB1cHN0cmVhbWVkCiA+IDAwMDYtQUNfSEVBREVSX1NUREMtY2F1c2VzLWEt
Y29tcGlsZS1mYWlsdXJlLXdpdGgtYXV0b2NvbmYtMi03MC5wYXRjaC4KCiA+IFNpZ25lZC1vZmYt
Ynk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KCkNvbW1pdHRlZCB0byAy
MDIxLjAyLnggYW5kIDIwMjEuMDgueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJk
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
