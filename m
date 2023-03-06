Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A37C64EC4
	for <buildroot@archiver.kernel.org>; Mon,  6 Mar 2023 21:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C80BA409FA;
	Mon,  6 Mar 2023 21:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C80BA409FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFFndJqJkD2X; Mon,  6 Mar 2023 21:29:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20EE5409EA;
	Mon,  6 Mar 2023 21:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20EE5409EA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 667431BF2E4
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 21:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40369408F9
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 21:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40369408F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uQzlpxBMXV5h for <buildroot@lists.busybox.net>;
 Mon,  6 Mar 2023 21:29:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97E2B408F3
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97E2B408F3
 for <buildroot@buildroot.org>; Mon,  6 Mar 2023 21:29:22 +0000 (UTC)
Received: from x230 ([78.252.129.8]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 326LTIFs027743
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 6 Mar 2023 22:29:19 +0100
Date: Mon, 6 Mar 2023 22:29:18 +0100
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= via buildroot <buildroot@buildroot.org>
Message-ID: <20230306222918.2aab2c4f@x230>
In-Reply-To: <20230306211646.3717-1-vincent.stehle@laposte.net>
References: <20230306211646.3717-1-vincent.stehle@laposte.net>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.35; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH next] package/openfpgaloader: fix typos
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
Cc: Jean Burgat <jeanburgat33@gmail.com>,
 Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAgNiBNYXIgMjAyMyAyMjoxNjo0NiArMDEwMApWaW5jZW50IFN0ZWhsw6kgdmlhIGJ1
aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiBGaXggYSB0eXBvIGlu
IHRoZSBuYW1lIG9mIHR3byBjb25maWd1cmF0aW9uIG9wdGlvbnMuCj4gVGhpcyByZXBhaXJzIHRo
ZSBzZWxlY3Rpb24gb2YgbGliZ3Bpb2Qgc3VwcG9ydC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaW5j
ZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0Pgo+IENjOiBKZWFuIEJ1cmdh
dCA8amVhbmJ1cmdhdDMzQGdtYWlsLmNvbT4KPiAtLS0KPiAKPiAKPiBIaSwKPiAKPiBUaGUgZml4
IGZvciB0aGUgQlIyX1BBQ0tBR0VfT1BFTkZQR0FMT0FERVJfTElCR1BJT0QgaGFzIGEgZnVuY3Rp
b25hbCBjaGFuZ2UKPiBhbmQgaXMgYXBwbGljYWJsZSB0byB0aGUgbmV4dCBicmFuY2ggb25seS4K
PiAKPiBUaGUgZml4IGZvciB0aGUgQlIyX1BBQ0tBR0VfT1BFTkZQR0FMT0FERVJfQ01TSVMgaXMg
YWxzbyBhcHBsaWNhYmxlIHRvIHRoZQo+IG1hc3RlciBicmFuY2ggaWYgZGVzaXJlZCwgYnV0IGFz
IGl0IGhhcyBubyBmdW5jdGlvbmFsIGVmZmVjdCBJIHRoaW5rIGl0IGlzIG5vdAo+IHRoYXQgdXJn
ZW50Lgo+IAo+IEJlc3QgcmVnYXJkcywKPiBWaW5jZW50Lgo+IAo+IAo+ICBwYWNrYWdlL29wZW5m
cGdhbG9hZGVyL0NvbmZpZy5pbiAgICAgICAgIHwgMiArLQo+ICBwYWNrYWdlL29wZW5mcGdhbG9h
ZGVyL29wZW5mcGdhbG9hZGVyLm1rIHwgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5m
cGdhbG9hZGVyL0NvbmZpZy5pbgo+IGIvcGFja2FnZS9vcGVuZnBnYWxvYWRlci9Db25maWcuaW4g
aW5kZXggNGJhMDFkMTJkMy4uYmQ4M2FkNDE1YiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL29wZW5m
cGdhbG9hZGVyL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2Uvb3BlbmZwZ2Fsb2FkZXIvQ29uZmln
LmluCj4gQEAgLTEyLDcgKzEyLDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX09QRU5GUEdBTE9BREVS
Cj4gIAo+ICBpZiBCUjJfUEFDS0FHRV9PUEVORlBHQUxPQURFUgo+ICAKPiAtY29uZmlnIEJSMl9Q
QUNBS0dFX09QRU5GUEdBTE9BREVSX0NNU0lTCj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9PUEVORlBH
QUxPQURFUl9DTVNJUwo+ICAJYm9vbCAiQ01TSVMtREFQIHN1cHBvcnQiCj4gIAlkZXBlbmRzIG9u
IEJSMl9QQUNLQUdFX0hBU19VREVWICMgaGlkYXBpCj4gIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hB
SU5fSEFTX1RIUkVBRFNfTlBUTCAjIGhpZGFwaQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5m
cGdhbG9hZGVyL29wZW5mcGdhbG9hZGVyLm1rCj4gYi9wYWNrYWdlL29wZW5mcGdhbG9hZGVyL29w
ZW5mcGdhbG9hZGVyLm1rIGluZGV4IDA0MmIxNjYxMmUuLjZkN2ZiZDk4NTAgMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS9vcGVuZnBnYWxvYWRlci9vcGVuZnBnYWxvYWRlci5tawo+ICsrKyBiL3BhY2th
Z2Uvb3BlbmZwZ2Fsb2FkZXIvb3BlbmZwZ2Fsb2FkZXIubWsKPiBAQCAtMTcsMTQgKzE3LDE0IEBA
IGVsc2UKPiAgT1BFTkZQR0FMT0FERVJfQ09ORl9PUFRTICs9IC1ERU5BQkxFX1VERVY9T0ZGCj4g
IGVuZGlmCj4gIAo+IC1pZmVxICgkKEJSMl9QQUNBS0dFX09QRU5GUEdBTE9BREVSX0NNU0lTKSx5
KQo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX09QRU5GUEdBTE9BREVSX0NNU0lTKSx5KQo+ICBPUEVO
RlBHQUxPQURFUl9ERVBFTkRFTkNJRVMgKz0gaGlkYXBpCj4gIE9QRU5GUEdBTE9BREVSX0NPTkZf
T1BUUyArPSAtREVOQUJMRV9DTVNJU0RBUD1PTgo+ICBlbHNlCj4gIE9QRU5GUEdBTE9BREVSX0NP
TkZfT1BUUyArPSAtREVOQUJMRV9DTVNJU0RBUD1PRkYKPiAgZW5kaWYKPiAgCj4gLWlmZXEgKCQo
QlIyX1BBQ0FLR0VfT1BFTkZQR0FMT0FERVJfTElCR1BJT0QpLHkpCj4gK2lmZXEgKCQoQlIyX1BB
Q0tBR0VfT1BFTkZQR0FMT0FERVJfTElCR1BJT0QpLHkpCj4gIE9QRU5GUEdBTE9BREVSX0RFUEVO
REVOQ0lFUyArPSBsaWJncGlvZAo+ICBPUEVORlBHQUxPQURFUl9DT05GX09QVFMgKz0gLURFTkFC
TEVfTElCR1BJT0Q9T04KPiAgZWxzZQo+IC0tIApBY2tlZC1ieTogR3dlbmhhZWwgR29hdmVjLW1l
cm91IDxnd2VuaGFlbC5nb2F2ZWMtbWVyb3VAdHJhYnVjYXlyZS5jb20+CgpUaGFua3MhCgpSZWdh
cmRzCgpHd2VuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
