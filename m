Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9728DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 19:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5381583218;
	Tue, 12 Apr 2022 19:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TCCGHmoBXsoj; Tue, 12 Apr 2022 19:55:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5164B82F20;
	Tue, 12 Apr 2022 19:54:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82DB01BF3FD
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7305182F20
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6dkXqQ5z_LB for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 19:54:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97DE982F0F
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 19:54:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7133:9439:48a3:ea79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0C84313F838;
 Tue, 12 Apr 2022 21:54:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649793296;
 bh=I70/2VIPPCtBtwLS/7O7TSFxvoJjVc+X8ApQ7JqDV1w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EcRTWNR8jHZBrlPmhwcYm/6uOOkXAo8R0lyzjcdPmP4ILkWMjwljMKbb03Y1qYTat
 6ageB0aQK8UZb2T90wFA6wweFmwJBYMrimKdPjhWMD3Z2XlvAbeE0CgWqqxcFfvh5M
 P3PNaT5QU6Gc/ZPspzDcCRzg7cH0mXatKVe4IFkzsCTtOrGMI01De0xC3LjnIianpP
 4zoiz9O1q3GZCXt8gf8LL/dLnF2Jh5S42fFcNVURc7EarLMi5BEcOSYvTo948E71gZ
 9aJAzZUKQXvMRUiWlrJ+dFLu2dxCtxVP97YQAR5kSlxmC8d+WnRaXH+T1oO7nmUqk4
 YsM8lslX/9itA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 12 Apr 2022 21:54:53 +0200
Date: Tue, 12 Apr 2022 21:54:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220412195453.GG4029883@scaer>
References: <20220412180157.2709680-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220412180157.2709680-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/libevdev: bump  to version 1.12.1
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA0LTEyIDIwOjAxICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2xpYmV2ZGV2L2xpYmV2ZGV2Lmhhc2gg
fCA2ICsrKy0tLQo+ICBwYWNrYWdlL2xpYmV2ZGV2L2xpYmV2ZGV2Lm1rICAgfCAyICstCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2xpYmV2ZGV2L2xpYmV2ZGV2Lmhhc2ggYi9wYWNrYWdlL2xpYmV2ZGV2
L2xpYmV2ZGV2Lmhhc2gKPiBpbmRleCA2OGE1ZWJkY2IuLmRkNzZlMTU4ZSAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2xpYmV2ZGV2L2xpYmV2ZGV2Lmhhc2gKPiArKysgYi9wYWNrYWdlL2xpYmV2ZGV2
L2xpYmV2ZGV2Lmhhc2gKPiBAQCAtMSw2ICsxLDYgQEAKPiAtIyBGcm9tIGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2lucHV0LXRvb2xzLzIwMjEtTm92ZW1iZXIvMDAxNTcz
Lmh0bWwKPiAtc2hhMjU2ICAyZjcyOWUzNDgwNjk1NzkxZjk0ODJlODM4OGJkNzIzNDAyYjg5ZjBl
YWYxMTgwNTdiYmRlYTNjZWNlZTliMjM3ICBsaWJldmRldi0xLjEyLjAudGFyLnh6Cj4gLXNoYTUx
MiAgNmMxYzEzNjJkNTExMmNkZjM4MTZkMWY3MzVjMjdlNjI1ZjU0NjNlYmYxMGE4M2Q2NzVjZDkz
NjRjM2ZiMjkxZWJjYjkxYzA1MWRhNDQyZjFhMzZlZDI4YmE3ZGQ5OWFmNzQ1NDY3MDdmNjEyNzRm
N2Q1NzE1YzU0NGEwZWQwNGMgIGxpYmV2ZGV2LTEuMTIuMC50YXIueHoKPiArIyBGcm9tIGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2lucHV0LXRvb2xzLzIwMjItTWFyY2gv
MDAxNTc0Lmh0bWwKPiArc2hhMjU2ICAxZGJiYTQxYmM1MTZkM2NhN2FiYzBkYTViODYyZWZlM2Vh
OGE3MDE4ZmE2ZTliOTdjZTlkMzk0MDFiMjI0MjZjICBsaWJldmRldi0xLjEyLjEudGFyLnh6Cj4g
K3NoYTUxMiAgZWVmY2UyODdhNjY1ZTRmODllYjJlMDQzN2RmZWZkNDVlY2Y4OTI1YzdkYWMzNWEx
YmRkNDYxNTg1NDFmNzdmMjAzMmM2MTQ2OTAwYTMwYTAxMzIxNzUxZDU1YTliNTM3YmQxZDYxNzc3
Y2NhOWNmYTAyYzM5YTZlMzFjOTdiZTQgIGxpYmV2ZGV2LTEuMTIuMS50YXIueHoKPiAgCj4gICMg
SGFzaCBmb3IgbGljZW5zZSBmaWxlczoKPiAgc2hhMjU2ICA2ZjEzZGU3Y2UyOGU0OTQ4YmE5NTE3
MGUwNzIzZWUxMjU0YzE5NzhjZTFmMTI3YWY4MmFlY2E1OTdiNTY3Y2I5ICBDT1BZSU5HCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbGliZXZkZXYvbGliZXZkZXYubWsgYi9wYWNrYWdlL2xpYmV2ZGV2
L2xpYmV2ZGV2Lm1rCj4gaW5kZXggY2Q4MDE1NGJlLi43MjZhNWFmY2UgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9saWJldmRldi9saWJldmRldi5tawo+ICsrKyBiL3BhY2thZ2UvbGliZXZkZXYvbGli
ZXZkZXYubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iwo+ICAKPiAtTElCRVZERVZfVkVSU0lPTiA9IDEuMTIuMAo+ICtMSUJFVkRFVl9WRVJTSU9OID0g
MS4xMi4xCj4gIExJQkVWREVWX1NJVEUgPSBodHRwOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy9zb2Z0
d2FyZS9saWJldmRldgo+ICBMSUJFVkRFVl9TT1VSQ0UgPSBsaWJldmRldi0kKExJQkVWREVWX1ZF
UlNJT04pLnRhci54ego+ICBMSUJFVkRFVl9MSUNFTlNFID0gTUlUCj4gLS0gCj4gMi4zMi4wCj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8
IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1
NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAg
ICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJ
TlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVr
Lm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAon
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
