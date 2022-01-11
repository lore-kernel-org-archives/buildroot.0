Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D30CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 08:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B84A410C8;
	Tue, 11 Jan 2022 08:36:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id thsPrtirnu9o; Tue, 11 Jan 2022 08:36:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA975410C4;
	Tue, 11 Jan 2022 08:36:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEE9E1BF316
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 08:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADBCB80D4D
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 08:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4f63SwnKXylr for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 08:36:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de
 [80.67.18.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A60C80D1D
 for <buildroot@busybox.net>; Tue, 11 Jan 2022 08:36:37 +0000 (UTC)
Received: from [91.21.118.156] (helo=exchange.go-sys.de)
 by smtprelay03.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>)
 id 1n7Cdu-0006Cs-Gr; Tue, 11 Jan 2022 09:36:34 +0100
Received: from exchange.go-sys.local (192.168.1.17) by exchange.go-sys.local
 (192.168.1.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.2375.17; Tue, 11
 Jan 2022 09:36:18 +0100
Received: from exchange.go-sys.local ([::1]) by exchange.go-sys.local ([::1])
 with mapi id 15.01.2375.017; Tue, 11 Jan 2022 09:36:18 +0100
From: Michael Fischer <mf@go-sys.de>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH 1/1] package/rtl8723bu: bump version to
 d34603a39a7c925d810fe17c6e8dea5063d43a33
Thread-Index: AQHYBjSQkOqgx0DgnEa868xqWLaBDqxcWJ2AgAElVOA=
Date: Tue, 11 Jan 2022 08:36:18 +0000
Message-ID: <1988ce33e1294da4ad3f35d32eec3ab8@go-sys.de>
References: <20220110151302.21093-1-mf@go-sys.de>
 <20220110155823.GS1477939@scaer>
In-Reply-To: <20220110155823.GS1477939@scaer>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.1.133]
x-c2processedorg: 77b28032-c882-4527-ad15-de6c89cb71cd
MIME-Version: 1.0
X-CrossPremisesHeadersFilteredBySendConnector: exchange.go-sys.local
X-OrganizationHeadersPreserved: exchange.go-sys.local
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl8723bu: bump version to
 d34603a39a7c925d810fe17c6e8dea5063d43a33
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
Cc: "buildroot@busybox.net" <buildroot@busybox.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiBFLixBbGwgDQoNCj4gV2hlbiBwYXRjaGluZyBvdXQgdW51c2VkIGNvZGUsIGRvbid0IGNv
bW1lbnQgaXQ7IGp1c3QgcmVtb3ZlIGl0Lg0KDQpJIGp1c3QgZm9sbG93ZWQgdGhlIFJFQURNRS5t
ZCwgYnV0IG5vIHByb2JsZW0gaSdsbCBjaGFuZ2UgdGhhdC4NCi0gU3RlcCAyOiBGaW5kIHRoZSBs
aW5lIHRoYXQgY29udGFpbnMgYEVYVFJBX0NGTEFHUyArPSAtRENPTkZJR19DT05DVVJSRU5UX01P
REVgIGFuZCBpbnNlcnQgYSBgI2Agc3ltYm9sIGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhhdCBsaW5l
LiBUaGlzIGNvbW1lbnRzIHRoYXQgbGluZSBhbmQgZGlzYWJsZXMgY29uY3VycmVudCBtb2RlLg0K
DQpQUzoNCklzIHRoZXJlIHNvbWV0aGluZyB3cm9uZyB3aXRoIHRoZSBtYWlsaW5nIGxpc3QgPw0K
SSBoYXZlIG5vdCByZWNlaXZlZCBhbnkgbWFpbHMgZm9yIGEgd2VlayBub3cuDQoNClJlZ2FyZHMs
DQogIE1pY2hhZWwgRmlzY2hlcg0KDQoNCj4gLS0tLS1VcnNwcsO8bmdsaWNoZSBOYWNocmljaHQt
LS0tLQ0KPiBWb246IFlhbm4gRS4gTU9SSU4gW21haWx0bzp5YW5uLm1vcmluLjE5OThAZnJlZS5m
cl0NCj4gR2VzZW5kZXQ6IE1vbnRhZywgMTAuIEphbnVhciAyMDIyIDE2OjU4DQo+IEFuOiBNaWNo
YWVsIEZpc2NoZXIgPG1mQGdvLXN5cy5kZT4NCj4gQ2M6IGJ1aWxkcm9vdEBidXN5Ym94Lm5ldA0K
PiBCZXRyZWZmOiBSZTogW0J1aWxkcm9vdF0gW1BBVENIIDEvMV0gcGFja2FnZS9ydGw4NzIzYnU6
IGJ1bXAgdmVyc2lvbiB0bw0KPiBkMzQ2MDNhMzlhN2M5MjVkODEwZmUxN2M2ZThkZWE1MDYzZDQz
YTMzDQo+IA0KPiBNaWNoYWVsLCBBbGwsDQo+IA0KPiBPbiAyMDIyLTAxLTEwIDE2OjEzICswMTAw
LCBNaWNoYWVsIEZpc2NoZXIgc3Bha2UgdGh1c2x5Og0KPiA+IHBhdGNoIDAwMDE6IERpc2FibGUg
Y29uY3VycnJlbnQgbW9kZS4gVGhpcyBjYXVzZXMgZGlzY29ubmVjdGlvbnMuDQo+IA0KPiBUaGF0
IHBhdGNoIGlzIG1pc3NpbmcgYSBjb21taXQgbG9nIGFuZCBhIHNpZ24tb2ZmIGZvciBpdHNlbGY6
DQo+IA0KPiAgICAgIyAuL3V0aWxzL2NoZWNrLXBhY2thZ2UgcGFja2FnZS9ydGw4NzIzYnUvMDAw
MS0NCj4gZGlzYWJsZV9jb25jdXJlbnRfbW9kZS5wYXRjaA0KPiAgICAgcGFja2FnZS9ydGw4NzIz
YnUvMDAwMS1kaXNhYmxlX2NvbmN1cmVudF9tb2RlLnBhdGNoOjA6IG1pc3NpbmcgU2lnbmVkLQ0K
PiBvZmYtYnkgaW4gdGhlIGhlYWRlcg0KPiANCj4gKGh0dHA6Ly9uaWdodGx5LmJ1aWxkcm9vdC5v
cmcvI19mb3JtYXRfYW5kX2xpY2Vuc2luZ19vZl90aGVfcGFja2FnZV9wYXRjaGVzKQ0KPiANCj4g
QnV0IHNlZSBiZWxvdy4uLg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEZpc2NoZXIg
PG1mQGdvLXN5cy5kZT4NCj4gPiAtLS0NCj4gPiAgcGFja2FnZS9ydGw4NzIzYnUvMDAwMS1kaXNh
YmxlX2NvbmN1cmVudF9tb2RlLnBhdGNoIHwgMTIgKysrKysrKysrKysrDQo+ID4gIHBhY2thZ2Uv
cnRsODcyM2J1L3J0bDg3MjNidS5oYXNoICAgICAgICAgICAgICAgICAgICB8ICAyICstDQo+ID4g
IHBhY2thZ2UvcnRsODcyM2J1L3J0bDg3MjNidS5tayAgICAgICAgICAgICAgICAgICAgICB8ICAy
ICstDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IHBhY2thZ2UvcnRsODcyM2J1LzAwMDEtZGlzYWJs
ZV9jb25jdXJlbnRfbW9kZS5wYXRjaA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnRs
ODcyM2J1LzAwMDEtZGlzYWJsZV9jb25jdXJlbnRfbW9kZS5wYXRjaA0KPiA+IGIvcGFja2FnZS9y
dGw4NzIzYnUvMDAwMS1kaXNhYmxlX2NvbmN1cmVudF9tb2RlLnBhdGNoDQo+ID4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwLi4wMzdiMTY0MmZjDQo+ID4gLS0tIC9k
ZXYvbnVsbA0KPiA+ICsrKyBiL3BhY2thZ2UvcnRsODcyM2J1LzAwMDEtZGlzYWJsZV9jb25jdXJl
bnRfbW9kZS5wYXRjaA0KPiA+IEBAIC0wLDAgKzEsMTIgQEANCj4gPiArZGlmZiAtcHVyTiBhL01h
a2VmaWxlIGIvTWFrZWZpbGUNCj4gPiArLS0tIGEvTWFrZWZpbGUJMjAyMS0xMS0wNCAyMDozNjo1
NS4wMDAwMDAwMDAgKzAxMDANCj4gPiArKysrIGIvTWFrZWZpbGUJMjAyMi0wMS0xMCAxNDozNTox
Ny4zMzM5MzQwMzkgKzAxMDANCj4gPiArQEAgLTE4LDcgKzE4LDcgQEAgRVhUUkFfQ0ZMQUdTICs9
IC1Xbm8tdW51c2VkLWxhYmVsICBFWFRSQV9DRkxBR1MNCj4gKz0NCj4gPiArLVduby11bnVzZWQt
cGFyYW1ldGVyICBFWFRSQV9DRkxBR1MgKz0gLVduby11bnVzZWQtZnVuY3Rpb24NCj4gPiArRVhU
UkFfQ0ZMQUdTICs9IC1Xbm8tdW51c2VkIC1FWFRSQV9DRkxBR1MgKz0gLQ0KPiBEQ09ORklHX0NP
TkNVUlJFTlRfTU9ERQ0KPiA+ICsrI0VYVFJBX0NGTEFHUyArPSAtRENPTkZJR19DT05DVVJSRU5U
X01PREUNCj4gDQo+IFdoZW4gcGF0Y2hpbmcgb3V0IHVudXNlZCBjb2RlLCBkb24ndCBjb21tZW50
IGl0OyBqdXN0IHJlbW92ZSBpdC4NCj4gDQo+IENhbiB5b3UgZml4IHRob3NlIHR3byBpc3N1ZXMg
YW5kIHJlc3VibWl0LCBwbGVzZT8NCj4gDQo+IFJlZ2FyZHMsDQo+IFlhbm4gRS4gTU9SSU4uDQo+
IA0KPiA+ICsgY2NmbGFncy15ICs9IC1EX19DSEVDS19FTkRJQU5fXw0KPiA+ICsNCj4gPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9ydGw4NzIzYnUvcnRsODcyM2J1Lmhhc2gNCj4gPiBiL3BhY2thZ2Uv
cnRsODcyM2J1L3J0bDg3MjNidS5oYXNoDQo+ID4gaW5kZXggMDRiYzc3NmEwNy4uZGY5OTBhOGQ2
MyAxMDA2NDQNCj4gPiAtLS0gYS9wYWNrYWdlL3J0bDg3MjNidS9ydGw4NzIzYnUuaGFzaA0KPiA+
ICsrKyBiL3BhY2thZ2UvcnRsODcyM2J1L3J0bDg3MjNidS5oYXNoDQo+ID4gQEAgLTEsMiArMSwy
IEBADQo+ID4gICMgTG9jYWxseSBjb21wdXRlZA0KPiA+IC1zaGEyNTYNCj4gPiA0YzczMTRkY2Nl
YmRhMWU1NWVjOGRjZjBkNWNhODkxNWMyNDkwZDE3YTlmNTY5MjNmMjVlNmUwZTk0NWMxMGNjDQo+
ID4gcnRsODcyM2J1LTljZTFjMzg0MzlmNGY1NzRiYjdhZGFmMzM5NDk4MzVjMjU1MzZhMjgudGFy
Lmd6DQo+ID4gK3NoYTI1Ng0KPiA+ICtjOWNkZTc1Nzk0MWM4OGM2MTE3NTYwYTJjMzUwZGM5YzQz
ODJkY2Q2YTMxM2IxY2FlN2M2ZTdlYWRlNzA1NWJmDQo+ID4gK3J0bDg3MjNidS1kMzQ2MDNhMzlh
N2M5MjVkODEwZmUxN2M2ZThkZWE1MDYzZDQzYTMzLnRhci5neg0KPiA+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3J0bDg3MjNidS9ydGw4NzIzYnUubWsNCj4gPiBiL3BhY2thZ2UvcnRsODcyM2J1L3J0
bDg3MjNidS5tayBpbmRleCBjMzVmYWQ1ODMyLi5lNzM5ODdjZmViIDEwMDY0NA0KPiA+IC0tLSBh
L3BhY2thZ2UvcnRsODcyM2J1L3J0bDg3MjNidS5taw0KPiA+ICsrKyBiL3BhY2thZ2UvcnRsODcy
M2J1L3J0bDg3MjNidS5taw0KPiA+IEBAIC00LDcgKzQsNyBAQA0KPiA+ICAjDQo+ID4NCj4gPg0K
PiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjDQo+ICMjIyMjIw0KPiA+ICMjIyMjIyMjIyMNCj4gPg0KPiA+IC1SVEw4NzIzQlVf
VkVSU0lPTiA9IDljZTFjMzg0MzlmNGY1NzRiYjdhZGFmMzM5NDk4MzVjMjU1MzZhMjgNCj4gPiAr
UlRMODcyM0JVX1ZFUlNJT04gPSBkMzQ2MDNhMzlhN2M5MjVkODEwZmUxN2M2ZThkZWE1MDYzZDQz
YTMzDQo+ID4gIFJUTDg3MjNCVV9TSVRFID0gJChjYWxsDQo+ID4gZ2l0aHViLGx3ZmluZ2VyLHJ0
bDg3MjNidSwkKFJUTDg3MjNCVV9WRVJTSU9OKSkNCj4gPiAgUlRMODcyM0JVX0xJQ0VOU0UgPSBH
UEwtMi4wLCBwcm9wcmlldGFyeSAoKi5iaW4gZmlybXdhcmUgYmxvYnMpDQo+ID4NCj4gPiAtLQ0K
PiA+IDIuMjAuMQ0KPiA+DQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0DQo+ID4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcNCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QNCj4gDQo+IC0tDQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uDQo+IHwg
IFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8
IEVyaWNzJw0KPiB8IGNvbnNwaXJhY3k6IHwNCj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2Fy
ZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwNCj4g
fCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAg
IHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwNCj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcv
IHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwNCj4gJy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS0tLScNCj4gDQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
