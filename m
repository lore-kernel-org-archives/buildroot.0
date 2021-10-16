Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E61DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:58:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FFD860FF2
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FFD860FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAD1983518;
	Sat, 16 Oct 2021 08:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zS1Ii0FG7ouN; Sat, 16 Oct 2021 08:58:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3811783267;
	Sat, 16 Oct 2021 08:58:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B2001BF873
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B3E783267
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1zrgf1HcWtUr for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:58:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16B1B8316A
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:58:04 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B0CCD1C0005;
 Sat, 16 Oct 2021 08:58:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mbfVw-0000y5-JK; Sat, 16 Oct 2021 10:58:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211016084136.2475297-1-fontaine.fabrice@gmail.com>
 <87fst1nyr3.fsf@dell.be.48ers.dk>
 <CAPi7W80qKoytyqrvZoQhWY16qq5kt=XgkxKOwrE-DSGH37YZdA@mail.gmail.com>
Date: Sat, 16 Oct 2021 10:58:00 +0200
In-Reply-To: <CAPi7W80qKoytyqrvZoQhWY16qq5kt=XgkxKOwrE-DSGH37YZdA@mail.gmail.com>
 (Fabrice Fontaine's message of "Sat, 16 Oct 2021 10:51:31 +0200")
Message-ID: <87bl3pny7b.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wireguard-linux-compat: add
 missing comment about kernel dependency
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBMZSBzYW0uIDE2IG9jdC4gMjAyMSDDoCAxMDo0NiwgUGV0ZXIg
S29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiBhIMOpY3JpdCA6CiA+PiAKID4+ID4+Pj4+
ICJGYWJyaWNlIiA9PSBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNv
bT4gd3JpdGVzOgogPj4gCiA+PiA+IEFkZCBhIGNvbW1lbnQgd2hlbiBrZXJuZWwgaXMgbm90IGVu
YWJsZWQgKG1pc3Npbmcgc2luY2UgdGhlIGFkZGl0aW9uIG9mCiA+PiA+IHRoZSBwYWNrYWdlIGlu
IGNvbW1pdCBkZTU5MWM1YzNhOTNhNDBkMDQ5YTMyYmQ3OWMzMGNjNjZkYWY1ZmIyKQogPj4gCiA+
PiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPgogPj4gPiAtLS0KID4+ID4gIHBhY2thZ2Uvd2lyZWd1YXJkLWxpbnV4LWNvbXBhdC9D
b25maWcuaW4gfCAzICsrKwogPj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQog
Pj4gCiA+PiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dpcmVndWFyZC1saW51eC1jb21wYXQvQ29u
ZmlnLmluCiA+PiA+IGIvcGFja2FnZS93aXJlZ3VhcmQtbGludXgtY29tcGF0L0NvbmZpZy5pbgog
Pj4gPiBpbmRleCA1YTMyM2EzNWU1Li40ZThlOTViZGMzIDEwMDY0NAogPj4gPiAtLS0gYS9wYWNr
YWdlL3dpcmVndWFyZC1saW51eC1jb21wYXQvQ29uZmlnLmluCiA+PiA+ICsrKyBiL3BhY2thZ2Uv
d2lyZWd1YXJkLWxpbnV4LWNvbXBhdC9Db25maWcuaW4KID4+ID4gQEAgLTIxLDYgKzIxLDkgQEAg
Y29uZmlnIEJSMl9QQUNLQUdFX1dJUkVHVUFSRF9MSU5VWF9DT01QQVQKID4+IAogPj4gPiAgICAg
ICAgaHR0cHM6Ly93d3cud2lyZWd1YXJkLmNvbQogPj4gCiA+PiA+ICtjb21tZW50ICJ3aXJlZ3Vh
cmQtbGludXgtY29tcGF0IG5lZWRzIGEgTGludXgga2VybmVsIHRvIGJlIGJ1aWx0IgogPj4gPiAr
ICAgIGRlcGVuZHMgb24gIUJSMl9MSU5VWF9LRVJORUwKID4+IAogPj4gSXMgdGhpcyByZWFsbHkg
YSBzZW5zaWJsZSBjb21tZW50PyBJIHdvdWxkIGltYWdpbmUgdGhhdCBuZWVkaW5nIGEgTGludXgK
ID4+IGtlcm5lbCBpcyBhbiBvYnZpb3VzIHJlcXVpcmVtZW50IGZvciBhIGtlcm5lbCBkcml2ZXI/
CiA+IFdlIGhhdmUgdGhpcyBjb21tZW50IGZvciBvdGhlciBkcml2ZXJzIHN1Y2ggYXMgZGFoZGkt
bGludXggYW5kIHhyODE5LXhyYWRpby4KID4gU28gSSB0aGluayB3ZSBzaG91bGQgYmUgY29uc2lz
dGVudCBpbiBhbGwgcGFja2FnZXMuCgpPaywgSSdsbCB0YWtlIGNhcmUgb2YgaXQuCgotLSAKQnll
LCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
