Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D71C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Mar 2022 20:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5DA781377;
	Sun,  6 Mar 2022 20:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tim2Rj2U0tbA; Sun,  6 Mar 2022 20:32:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D072C8136C;
	Sun,  6 Mar 2022 20:32:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08AA61BF401
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 20:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDCD38136C
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 20:32:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 228rjY-p-8kD for <buildroot@lists.busybox.net>;
 Sun,  6 Mar 2022 20:32:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B0F381363
 for <buildroot@busybox.net>; Sun,  6 Mar 2022 20:32:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b52b:1138:2d2c:406c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 522D8B00515;
 Sun,  6 Mar 2022 21:32:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1646598762;
 bh=mWImWu5Minr7eSDKqbmuc1W7R2ryk3gd6zyhT4+VyOg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N68CSpOQvTd0q1d3qZ+izElP2bv+/VFF+T+0eQgMg/lHcTgUbFCBmFETGSEkPNsFG
 AoPinZqNB9BjJcLqC7noiqoF0PU63ijOmthTC4jR/o0vQwStNzlR471FZ7vtSJxHXU
 TLKUiuFqUEQ8hd9ea+1oCpFaItyKYEqdPiJAY5EjnOZReL1NldCX6c8UPkhlACfFCz
 iOcC4o3JN7codXIbwpI35WPu5qmlVgwGlioluPZ+aZuDB6s91TJi7A3JWvL2Tq/qKL
 TfK1NAiNBT/EBpnBZU8yFZfJNIOc8qDeJ4uXA+KuI1foXOaCQIRnpxt40jbRSdX3Dk
 A4bJVzL4/x9jQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Mar 2022 21:32:40 +0100
Date: Sun, 6 Mar 2022 21:32:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220306203240.GE228549@scaer>
References: <20220306120902.132254-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220306120902.132254-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/libxlst: security bump to version
 1.1.35
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpBcyBub3RpY2VkIGJ5IEFsZXhhbmRlcjogdHlwbyBmaXhlZCBpbiB0
aXRsZQoKT24gMjAyMi0wMy0wNiAxMzowOSArMDEwMCwgRnJhbmNvaXMgUGVycmFkIHNwYWtlIHRo
dXNseToKPiAtIGZpeCBDVkUtMjAyMS0zMDU2MAo+IC0gcmVtb3ZlIG1lcmdlZCBwYXRjaAoKLi4u
IHNvIHdlIGNhbiBhbHNvIGRyb3AgdGhlIGF1dG9yZWNvbmYsIGRvbmUuCgo+IC0gbW92ZWQgZnJv
bSB4bWxzb2Z0Lm9yZyB0byBnbm9tZS5vcmcKCi4uLiBzbyB3ZSBjYW4gYWxzbyBmaXggaXQgaW4g
Q29uZmlnLmluLCBkb25lLgoKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZyYW5j
b2lzLnBlcnJhZEBnYWR6Lm9yZz4KCkFwcGxpZWQgdG8gbWFzdGVyIHdpdGggdGhlIGFib3ZlIGZp
eGVkLCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgLi4ubWwyLWNv
bmZpZy1jaGVjay1pbi1jb25maWd1cmUtc2NyaXB0LnBhdGNoIHwgMzEgLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ICBwYWNrYWdlL2xpYnhzbHQvbGlieHNsdC5oYXNoICAgICAgICAgICAgICAgICAgfCAg
NiArKy0tCj4gIHBhY2thZ2UvbGlieHNsdC9saWJ4c2x0Lm1rICAgICAgICAgICAgICAgICAgICB8
ICA1ICstLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25z
KC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYnhzbHQvMDAwMS1GaXgteG1sMi1j
b25maWctY2hlY2staW4tY29uZmlndXJlLXNjcmlwdC5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2xpYnhzbHQvMDAwMS1GaXgteG1sMi1jb25maWctY2hlY2staW4tY29uZmlndXJlLXNj
cmlwdC5wYXRjaCBiL3BhY2thZ2UvbGlieHNsdC8wMDAxLUZpeC14bWwyLWNvbmZpZy1jaGVjay1p
bi1jb25maWd1cmUtc2NyaXB0LnBhdGNoCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMzg0OGRjYjIzLi4wMDAwMDAwMDAKPiAtLS0gYS9wYWNrYWdlL2xpYnhzbHQvMDAwMS1GaXgt
eG1sMi1jb25maWctY2hlY2staW4tY29uZmlndXJlLXNjcmlwdC5wYXRjaAo+ICsrKyAvZGV2L251
bGwKPiBAQCAtMSwzMSArMCwwIEBACj4gLUZyb20gOTBjMzRjOGJiOTBlMDk1YThhOGZlOGIyY2Uz
NjhiZDlmZjE4MzdjYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiAtRnJvbTogTmljayBXZWxs
bmhvZmVyIDx3ZWxsbmhvZmVyQGFldnVtLmRlPgo+IC1EYXRlOiBGcmksIDE1IE5vdiAyMDE5IDEx
OjUzOjExICswMTAwCj4gLVN1YmplY3Q6IFtQQVRDSF0gRml4IHhtbDItY29uZmlnIGNoZWNrIGlu
IGNvbmZpZ3VyZSBzY3JpcHQKPiAtCj4gLUEgJ3ByaW50JyBvcHRpb24gaGFzIG5ldmVyIGJlZW4g
c3VwcG9ydGVkLiBBZnRlciBhIHJlY2VudCBjaGFuZ2UgdG8KPiAtbGlieG1sMiwgaW52YWxpZCBv
cHRpb25zIGNhdXNlIHhtbDItY29uZmlnIHRvIGZhaWwuCj4gLQo+IC1bUmV0cmlldmVkIGZyb206
Cj4gLWh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9saWJ4c2x0Ly0vY29tbWl0LzkwYzM0
YzhiYjkwZTA5NWE4YThmZThiMmNlMzY4YmQ5ZmYxODM3Y2NdCj4gLVNpZ25lZC1vZmYtYnk6IEZh
YnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+IC0tLS0KPiAtIGNv
bmZpZ3VyZS5hYyB8IDIgKy0KPiAtIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IC0KPiAtZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5h
Ywo+IC1pbmRleCAzZGE1N2IxOC4uNTg1YjlkN2MgMTAwNjQ0Cj4gLS0tLSBhL2NvbmZpZ3VyZS5h
Ywo+IC0rKysgYi9jb25maWd1cmUuYWMKPiAtQEAgLTU0OCw3ICs1NDgsNyBAQCBkbmwgbWFrZSBz
dXJlIHhtbDItY29uZmlnIGlzIGV4ZWN1dGFibGUsCj4gLSBkbmwgdGVzdCB2ZXJzaW9uIGFuZCBp
bml0IG91ciB2YXJpYWJsZXMKPiAtIGRubAo+IC0gCj4gLS1pZiB0ZXN0ICJ4JExJQlhNTF9MSUJT
IiA9ICJ4IiAmJiAke1hNTF9DT05GSUd9IC0tbGlicyBwcmludCA+IC9kZXYvbnVsbCAyPiYxCj4g
LStpZiB0ZXN0ICJ4JExJQlhNTF9MSUJTIiA9ICJ4IiAmJiAke1hNTF9DT05GSUd9IC0tbGlicyA+
IC9kZXYvbnVsbCAyPiYxCj4gLSB0aGVuCj4gLSAgICAgQUNfTVNHX0NIRUNLSU5HKGZvciBsaWJ4
bWwgbGlicmFyaWVzID49ICRMSUJYTUxfUkVRVUlSRURfVkVSU0lPTikKPiAtICAgICBYTUxWRVJT
PWAkWE1MX0NPTkZJRyAtLXZlcnNpb25gCj4gLS0tIAo+IC1HaXRMYWIKPiAtCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbGlieHNsdC9saWJ4c2x0Lmhhc2ggYi9wYWNrYWdlL2xpYnhzbHQvbGlieHNs
dC5oYXNoCj4gaW5kZXggMjVhYTMwODM5Li4zOTUyM2E2OTUgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9saWJ4c2x0L2xpYnhzbHQuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbGlieHNsdC9saWJ4c2x0Lmhh
c2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAtIyBMb2NhbGx5IGNhbGN1bGF0ZWQgYWZ0ZXIgY2hlY2tp
bmcgcGdwIHNpZ25hdHVyZQo+IC1zaGEyNTYJOThiMWJkNDZkNjc5MjkyNWFkMmRmZTlhODc0NTJl
YTJhZGViZjY5ZGNiOTkxOWZmZDU1YmY5MjZhN2Y5M2Y3ZglsaWJ4c2x0LTEuMS4zNC50YXIuZ3oK
PiArIyBmcm9tIGh0dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvbGlieHNsdC8xLjEv
bGlieHNsdC0xLjEuMzUuc2hhMjU2c3VtCj4gK3NoYTI1NiAgODI0N2YzM2U5YTg3MmM2YWM4NTlh
YTQ1MDE4YmM0YzRkMDBiOTdlMmZlYWM5ZWViYzEwYzkzY2UxZjM0ZGQ3OSAgbGlieHNsdC0xLjEu
MzUudGFyLnh6Cj4gIAo+ICAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZToKPiAtc2hhMjU2CTdlNDhl
MjkwYjZiZmNjYzJlYzFiMjk3MDIzYTFkNzdmMmZkODc0MTdmNzFmYmI5ZjUwYWFiZWY0MGE4NTE4
MTkJQ09QWUlORwo+ICtzaGEyNTYgIDdlNDhlMjkwYjZiZmNjYzJlYzFiMjk3MDIzYTFkNzdmMmZk
ODc0MTdmNzFmYmI5ZjUwYWFiZWY0MGE4NTE4MTkgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saWJ4c2x0L2xpYnhzbHQubWsgYi9wYWNrYWdlL2xpYnhzbHQvbGlieHNsdC5tawo+IGlu
ZGV4IGQwZjc5ZDI1Mi4uOWM3YmU2ODIyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGlieHNsdC9s
aWJ4c2x0Lm1rCj4gKysrIGIvcGFja2FnZS9saWJ4c2x0L2xpYnhzbHQubWsKPiBAQCAtNCw4ICs0
LDkgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtTElCWFNMVF9WRVJT
SU9OID0gMS4xLjM0Cj4gLUxJQlhTTFRfU0lURSA9IGh0dHA6Ly94bWxzb2Z0Lm9yZy9zb3VyY2Vz
Cj4gK0xJQlhTTFRfVkVSU0lPTiA9IDEuMS4zNQo+ICtMSUJYU0xUX1NPVVJDRSA9IGxpYnhzbHQt
JChMSUJYU0xUX1ZFUlNJT04pLnRhci54ego+ICtMSUJYU0xUX1NJVEUgPSBodHRwczovL2Rvd25s
b2FkLmdub21lLm9yZy9zb3VyY2VzL2xpYnhzbHQvMS4xCj4gIExJQlhTTFRfSU5TVEFMTF9TVEFH
SU5HID0gWUVTCj4gIExJQlhTTFRfTElDRU5TRSA9IE1JVAo+ICBMSUJYU0xUX0xJQ0VOU0VfRklM
RVMgPSBDT1BZSU5HCj4gLS0gCj4gMi4zMi4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUu
IE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycg
Y29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwg
LyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBg
LS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBu
byAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1B
SUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
