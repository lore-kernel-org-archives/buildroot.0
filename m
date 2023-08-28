Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D13FC83F11
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 11:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCF5D416D8;
	Mon, 28 Aug 2023 11:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCF5D416D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d7etrKPJx9oN; Mon, 28 Aug 2023 11:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B699D416E7;
	Mon, 28 Aug 2023 11:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B699D416E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C82DE1BF410
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 11:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A108281F06
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 11:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A108281F06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B-aXsVG3SjVP for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 11:36:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5150D81F05
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 11:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5150D81F05
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E121B2F4;
 Mon, 28 Aug 2023 04:37:13 -0700 (PDT)
Received: from debian (X72Y076X74.nice.arm.com [10.34.129.0])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 047873F740;
 Mon, 28 Aug 2023 04:36:32 -0700 (PDT)
Date: Mon, 28 Aug 2023 13:36:30 +0200
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZOyGvrtRt1iPwMTO@debian>
Mail-Followup-To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org,
 Dick Olsson <hi@senzilla.io>
References: <20230827145956.3204254-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827145956.3204254-1-ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH next 1/3] boot/edk2: bump to version
 edk2-stable202308
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

T24gU3VuLCBBdWcgMjcsIDIwMjMgYXQgMDQ6NTk6NTRQTSArMDIwMCwgSnVsaWVuIE9saXZhaW4g
d3JvdGU6Cj4gRm9yIGNoYW5nZSBsb2cgc2luY2UgdmVyc2lvbiBlZGsyLXN0YWJsZTIwMjMwNSwg
c2VlOgo+IC0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyL3JlbGVhc2VzL3RhZy9l
ZGsyLXN0YWJsZTIwMjMwOAo+IAo+IFRoZSBtYWluIG1vdGl2YXRpb25zIG9mIHRoaXMgYnVtcCBh
cmUgdGhlIFJJU0MtViBRRU1VIFZpcnQgc3VwcG9ydAo+IGltcHJvdmVtZW50cyAobm90IHlldCBz
dXBwb3J0ZWQgaW4gQnVpbGRyb290KS4KPiAKPiBDYzogRGljayBPbHNzb24gPGhpQHNlbnppbGxh
LmlvPgo+IENjOiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiAtLS0KPiBQYXRjaCBz
ZXJpZXMgdGVzdGVkIG9uIGJyYW5jaCBuZXh0IGF0IGNvbW1pdCA3YjAyY2E4IHdpdGggY29tbWFu
ZHM6Cj4gCj4gICAgIG1ha2UgY2hlY2stcGFja2FnZQo+ICAgICAuLi4KPiAgICAgMCB3YXJuaW5n
cyBnZW5lcmF0ZWQKPiAKPiAgICAgbWFrZSBxZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcKPiAg
ICAgbWFrZQo+ICAgICBvdXRwdXQvaW1hZ2VzL3N0YXJ0LXFlbXUuc2gKPiAKPiAgICAgc3VwcG9y
dC90ZXN0aW5nL3J1bi10ZXN0cyBcCj4gICAgICAgICAtZCBkbCAtbyBvdXRwdXRfZm9sZGVyIFwK
PiAgICAgICAgIHRlc3RzLmJvb3QudGVzdF9lZGsyCj4gICAgIC4uLgo+ICAgICBPSwo+IAo+ICAg
ICBzdXBwb3J0L3Rlc3RpbmcvcnVuLXRlc3RzIFwKPiAgICAgICAgIC1kIGRsIC1vIG91dHB1dF9m
b2xkZXIgXAo+ICAgICAgICAgdGVzdHMuYm9vdC50ZXN0X2dydWIKPiAgICAgLi4uCj4gICAgIE9L
Cj4gCj4gICAgIHN1cHBvcnQvdGVzdGluZy9ydW4tdGVzdHMgXAo+ICAgICAgICAgLWQgZGwgLW8g
b3V0cHV0X2ZvbGRlciBcCj4gICAgICAgICB0ZXN0cy5mcy50ZXN0X2lzbzk2NjAKPiAgICAgLi4u
Cj4gICAgIE9LCgpIaSBKdWxpZW4sCgpUaGFua3MgZm9yIHRoaXMgcGF0Y2hlcyBzZXJpZXMuCkFs
bCB0aGUgYWZvcmVtZW50aW9uZWQgdGVzdHMgd29yayBmb3IgbWUgYXMgd2VsbCwgb24gYm90aCBt
YXN0ZXIgYW5kIG5leHQuCgpGZWVsIGZyZWUgdG8gYWRkIChvciBub3QpOgoKICBUZXN0ZWQtYnk6
IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KCkJlc3QgcmVnYXJkcywK
VmluY2VudC4KCj4gLS0tCj4gIGJvb3QvZWRrMi9lZGsyLmhhc2ggfCAyICstCj4gIGJvb3QvZWRr
Mi9lZGsyLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9ib290L2VkazIvZWRrMi5oYXNoIGIvYm9v
dC9lZGsyL2VkazIuaGFzaAo+IGluZGV4IDM0ZDRiMTBlMjkuLjE3OTE4ZWU3YmIgMTAwNjQ0Cj4g
LS0tIGEvYm9vdC9lZGsyL2VkazIuaGFzaAo+ICsrKyBiL2Jvb3QvZWRrMi9lZGsyLmhhc2gKPiBA
QCAtMSwzICsxLDMgQEAKPiAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAtc2hhMjU2ICBjYTU1MzUx
OTEzZTYyNThlYmQ4YzA4MTA2ZjM2OWFjNzEwNzNkOWNmYWE4MDQyN2ZjNWYxMzFiMDZkODA4OTQw
ICBlZGsyLWVkazItc3RhYmxlMjAyMzA1LWJyMS50YXIuZ3oKPiArc2hhMjU2ICA5Mzg5YWQyMGJj
NzVmMmE4ZmE5ZTdjMWIxOTQ4ZWYwNzQ4MWM5NGU5NmRlYzU3YWUyZjlmOWJlOWM3NTRmOTJjICBl
ZGsyLWVkazItc3RhYmxlMjAyMzA4LWJyMS50YXIuZ3oKPiAgc2hhMjU2ICA1MGNlMjBjOWNmZGIw
ZTE5ZWUzNGZlMGE1MWZjMGFmZTk2MWY3NDM2OTdiMDY4MzU5YWIyZjg2MmI0OTRkZjgwICBMaWNl
bnNlLnR4dAo+IGRpZmYgLS1naXQgYS9ib290L2VkazIvZWRrMi5tayBiL2Jvb3QvZWRrMi9lZGsy
Lm1rCj4gaW5kZXggZjQ5MjU4ZWNiNS4uMTg2ODU0YTE0YyAxMDA2NDQKPiAtLS0gYS9ib290L2Vk
azIvZWRrMi5tawo+ICsrKyBiL2Jvb3QvZWRrMi9lZGsyLm1rCj4gQEAgLTQsNyArNCw3IEBACj4g
ICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLUVESzJfVkVSU0lPTiA9IGVkazIt
c3RhYmxlMjAyMzA1Cj4gK0VESzJfVkVSU0lPTiA9IGVkazItc3RhYmxlMjAyMzA4Cj4gIEVESzJf
U0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMgo+ICBFREsyX1NJVEVfTUVU
SE9EID0gZ2l0Cj4gIEVESzJfTElDRU5TRSA9IEJTRC0yLUNsYXVzZS1QYXRlbnQKPiAtLSAKPiAy
LjQxLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
