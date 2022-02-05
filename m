Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE29EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 11:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C11440364;
	Sat,  5 Feb 2022 11:27:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aV6tQpcf6wi7; Sat,  5 Feb 2022 11:27:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23AD5401ED;
	Sat,  5 Feb 2022 11:27:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 91B9F1BF4E4
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 11:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71B3682C2E
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 11:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 673L8iKPR7jQ for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 11:27:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9859582C04
 for <buildroot@busybox.net>; Sat,  5 Feb 2022 11:27:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E8BCE20002;
 Sat,  5 Feb 2022 11:27:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nGJDj-0005NZ-2j; Sat, 05 Feb 2022 12:27:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: julien.boibessot@armadeus.com
References: <20220201170647.109298-1-julien.boibessot@armadeus.com>
Date: Sat, 05 Feb 2022 12:27:11 +0100
In-Reply-To: <20220201170647.109298-1-julien.boibessot@armadeus.com> (julien
 boibessot's message of "Tue, 1 Feb 2022 18:06:47 +0100")
Message-ID: <87o83lwo34.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/ltris: bump version to 1.2.3
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
Cc: buildroot@busybox.net, fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gImp1bGllbiIgPT0ganVsaWVuIGJvaWJlc3NvdCA8anVsaWVuLmJvaWJlc3NvdEBhcm1h
ZGV1cy5jb20+IHdyaXRlczoKCiA+IEZyb206IEp1bGllbiBCT0lCRVNTT1QgPGp1bGllbi5ib2li
ZXNzb3RAYXJtYWRldXMuY29tPgogPiAwMDAxLWZpeC1idWlsZC13aXRoLWdjYy00LjgucGF0Y2gg
d2FzIGludGVncmF0ZWQgbWFpbmxpbmUgYW5kIGNyb3NzLWNvbXBpbGF0aW9uCiA+IHNsaWdodGx5
IGNoYW5nZWQuCiA+IC0tLQogPiAgLi4uL2x0cmlzLzAwMDEtZml4LWJ1aWxkLXdpdGgtZ2NjLTQu
OC5wYXRjaCAgIHwgMjAgLS0tLS0tLS0tLS0tLS0tLS0tLQogPiAgcGFja2FnZS9sdHJpcy9sdHJp
cy5oYXNoICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQogPiAgcGFja2FnZS9sdHJpcy9s
dHJpcy5tayAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQogPiAgMyBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQogPiAgZGVsZXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvbHRyaXMvMDAwMS1maXgtYnVpbGQtd2l0aC1nY2MtNC44LnBhdGNoCgogPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9sdHJpcy8wMDAxLWZpeC1idWlsZC13aXRoLWdjYy00LjgucGF0
Y2ggYi9wYWNrYWdlL2x0cmlzLzAwMDEtZml4LWJ1aWxkLXdpdGgtZ2NjLTQuOC5wYXRjaAogPiBk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKID4gaW5kZXggZDZiYmY2YTk0Ni4uMDAwMDAwMDAwMAog
PiAtLS0gYS9wYWNrYWdlL2x0cmlzLzAwMDEtZml4LWJ1aWxkLXdpdGgtZ2NjLTQuOC5wYXRjaAog
PiArKysgL2Rldi9udWxsCiA+IEBAIC0xLDIwICswLDAgQEAKID4gLUZpeCBidWlsZCB3aXRoIGdj
YyA0LjgKID4gLQogPiAtU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUu
ZmFicmljZUBnbWFpbC5jb20+CiA+IC1bVXBzdHJlYW0gc3RhdHVzOiBodHRwczovL3NvdXJjZWZv
cmdlLm5ldC9wL2xnYW1lcy9wYXRjaGVzLzI4XQogPiAtSW5kZXg6IGx0cmlzL3NyYy9ib3dsLmMK
ID4gLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0KID4gLS0tLSBsdHJpcy9zcmMvYm93bC5jCShyw6l2aXNpb24gNDIxKQog
PiAtKysrIGx0cmlzL3NyYy9ib3dsLmMJKGNvcGllIGRlIHRyYXZhaWwpCiA+IC1AQCAtODI4LDkg
KzgyOCwxMCBAQAogPiAtICovCiA+IC0gdm9pZCBib3dsX2luaXRfYmxvY2tfbWFza3MoKSAKID4g
LSB7CiA+IC0rCWludCBpOwogPiAtIAlpbnQgbWFza3NpemUgPSBzaXplb2YoYmxvY2tfbWFza3Nb
MF0ubWFzayk7IC8vIHNhbWUgZm9yIGFsbAogPiAtIAogPiAtLQlmb3IgKGludCBpID0gMDsgaSA8
IDc7IGkrKykgewogPiAtKwlmb3IgKGkgPSAwOyBpIDwgNzsgaSsrKSB7CiA+IC0gCQlibG9ja19t
YXNrc1tpXS5yeCA9IDI7CiA+IC0gCQlibG9ja19tYXNrc1tpXS5yeSA9IDI7CiA+IC0gCQltZW1z
ZXQoYmxvY2tfbWFza3NbaV0ubWFzaywgMCwgbWFza3NpemUgKTsKID4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbHRyaXMvbHRyaXMuaGFzaCBiL3BhY2thZ2UvbHRyaXMvbHRyaXMuaGFzaAogPiBpbmRl
eCBmNjk2ZTNhZjE3Li4yMGYzNDM0MmZmIDEwMDY0NAogPiAtLS0gYS9wYWNrYWdlL2x0cmlzL2x0
cmlzLmhhc2gKID4gKysrIGIvcGFja2FnZS9sdHJpcy9sdHJpcy5oYXNoCiA+IEBAIC0xLDMgKzEs
MyBAQAogPiAgIyBMb2NhbGx5IGNvbXB1dGVkOgogPiAtc2hhMjU2ICBhN2JjNmM1ZmM2NTM5Yjg4
NTA1MDc3YTFiNDU4MGVkYzliMTc5Y2UwYTZiODI5YzU4ZmJkOTQxNmNmNDU2MTk1ICBsdHJpcy0x
LjIudGFyLmd6CiA+IC1zaGEyNTYgIDY3ZjgyZTA0NWNmN2FjZmVmODUzZWEwZjQyNjU3NWE4MzU5
MTYxYTBhMzI1ZTE5ZjAyYjUyOWE4N2M0YjZjMzQgIENPUFlJTkcKID4gK3NoYTI1NgkwZWM0YWQw
NTNlMDY2YTI5NjUyOWU5MjNjMmY2MjZmYTBhMTljMDk0YzVhZTAzZTQ0MzU5ZjljOWU1MDk1NWE4
ICBsdHJpcy0xLjIuMy50YXIuZ3oKID4gK3NoYTI1Ngk2N2Y4MmUwNDVjZjdhY2ZlZjg1M2VhMGY0
MjY1NzVhODM1OTE2MWEwYTMyNWUxOWYwMmI1MjlhODdjNGI2YzM0ICBDT1BZSU5HCgpOSVQ6IFRo
ZSBzdHlsZSB1c2VkIChhcyBjaGVja2VkIGJ5IGNoZWNrLXBhY2thZ2UpIGlzIHR3byBzcGFjZXMg
YWZ0ZXIKc2hhMjU2LCBub3QgYSB0YWIuCgoKID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHRyaXMv
bHRyaXMubWsgYi9wYWNrYWdlL2x0cmlzL2x0cmlzLm1rCiA+IGluZGV4IDliNTk2MTM0MTcuLjZl
MzdiZGJkMTkgMTAwNjQ0CiA+IC0tLSBhL3BhY2thZ2UvbHRyaXMvbHRyaXMubWsKID4gKysrIGIv
cGFja2FnZS9sdHJpcy9sdHJpcy5tawogPiBAQCAtNSw3ICs1LDcgQEAKID4gICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCiAKID4gIExUUklTX1NJVEUgPSBodHRwOi8vZG93bmxvYWRzLnNvdXJjZWZv
cmdlLm5ldC9sZ2FtZXMvbHRyaXMKID4gLUxUUklTX1ZFUlNJT04gPSAxLjIKID4gK0xUUklTX1ZF
UlNJT04gPSAxLjIuMwogPiAgTFRSSVNfTElDRU5TRSA9IEdQTC0yLjArCiA+ICBMVFJJU19MSUNF
TlNFX0ZJTEVTID0gQ09QWUlORwogCiA+IEBAIC0xMyw3ICsxMyw3IEBAIExUUklTX0RFUEVOREVO
Q0lFUyA9IHNkbCAkKFRBUkdFVF9OTFNfREVQRU5ERU5DSUVTKQogPiAgTFRSSVNfTElCUyA9ICQo
VEFSR0VUX05MU19MSUJTKQogCiA+ICBMVFJJU19DT05GX0VOViA9IFwKID4gLQlTRExfQ09ORklH
PSIkKFNUQUdJTkdfRElSKS91c3IvYmluL3NkbC1jb25maWciIFwKID4gKwlQQVRIPSIkKFBBVEgp
OiQoU1RBR0lOR19ESVIpL3Vzci9iaW4iIFwKClRoYXQncyBubyBnb29kLiBUaGlzIHdvdWxkIG1l
YW4gdGhhdCB0aGUgd3Jvbmcgc2RsLWNvbmZpZyB3b3VsZCBnZXQKcGlja2VkIHVwIGlmIHRoZSBi
dWlsZCBtYWNoaW5lIGhhcyBzZGwtY29uZmlnLgoKTG9va2luZyBhdCB0aGUgY29uZmlndXJlIHNj
cmlwdCwgSSBzZWUgaXQgaGFzIGEgLS13aXRoLXNkbC1leGVjLXByZWZpeCwKc28gd2UgY291bGQg
cGFzcyAtLXdpdGgtc2RsLWV4ZWMtcHJlZml4PSQoU1RBR0lOR19ESVIpL3Vzciwgd2hpY2ggZ29l
cwpmaW5lIGFsbCB0aGUgd2F5IHVudGlsIHRoZSBjb25maWd1cmUgc2NyaXB0IHRocm93cyBhd2F5
IGFsbCB0aGUgc2RsCmRldGVjdGlvbiBhbmQgZG9lczoKCkNGTEFHUz0iJENGTEFHUyAkKHNkbC1j
b25maWcgLS1jZmxhZ3MpIgpMSUJTPSIkTElCUyAkKHNkbC1jb25maWcgLS1saWJzKSIKClRoaXMg
aXMgZXZlbiBkb25lIGFmdGVyIHByZXBlbmRpbmcgL3Vzci9iaW4gdG8gdGhlIFBBVEgsIHNvIHdl
IGNhbm5vdApldmVuIGRvIGxpa2UgaW4gbm9kZWpzIGFuZCBwdXQgc2RsLWNvbmZpZyBpbiBhIGRl
ZGljYXRlZCBkaXJlY3RvcnkgYW5kCnN0aWNrIGl0IGluIHRoZSBmcm9udCBvZiB0aGUgcGF0aCA6
LwoKSSBndWVzcyB0aGV5IHNob3VsZCBqdXN0IGRvOgoKQ0ZMQUdTPSIkQ0ZMQUdTICRTRExfQ0ZM
QUdTIgpMSUJTPSIkTElCUyBTRExfTElCUyIKCkNhcmUgdG8gc2VuZCBhIHBhdGNoIHVwc3RyZWFt
IGZvciB0aGF0IGFuZCBzZW5kIGFuIHVwZGF0ZWQgcGF0Y2ggdG8gdXM/CkluIHRoZSBtZWFuIHRp
bWUgSSBoYXZlIG1hcmtlZCB0aGUgcGF0Y2ggYXMgY2hhbmdlcyByZXF1ZXN0ZWQuCgotLSAKQnll
LCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
