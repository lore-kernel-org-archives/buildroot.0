Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E250C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 02:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8A3F408DC;
	Thu,  3 Nov 2022 02:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8A3F408DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MNhstYJ7XKs3; Thu,  3 Nov 2022 02:09:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06A8B40168;
	Thu,  3 Nov 2022 02:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06A8B40168
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B28631BF37C
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 02:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E9846068B
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 02:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E9846068B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fl935oyrSgkK for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 02:09:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0F24605B7
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0F24605B7
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 02:09:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (19)
Received: from zm (pub-52.182.29.194.multiplay.pl [194.29.182.52])
 by server220076.nazwa.pl (Postfix) with ESMTP id 4E2421BBAEF;
 Thu,  3 Nov 2022 03:09:44 +0100 (CET)
References: <20221103014156.791695-1-m.niestroj@grinn-global.com>
User-agent: mu4e 1.8.11; emacs 28.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Thu, 03 Nov 2022 03:06:17 +0100
In-reply-to: <20221103014156.791695-1-m.niestroj@grinn-global.com>
Message-ID: <871qqkokk7.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/python-dbus-fast: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBpcyBhIGR1cGxpY2F0ZSBvZiBhIHBhdGNoIGZyb20gSmFtZXMuIE15IHBhdGNoIGhvd2V2
ZXIgaW5jbHVkZXMKcnVudGltZSB0ZXN0cywgd2hpY2ggYXJlIG5vdCBpbmNsdWRlZCBpbiBKYW1l
cycgdmVyc2lvbi4gSSBjYW4gZWl0aGVyCnBvc3QgdGhlbSBzZXBhcmF0ZWx5IGFmdGVyIEphbWVz
IHBhdGNoZXMgd2lsbCBiZSBhcHBsaWVkIHRvIG1hc3Rlciwgb3IKYWx0ZXJuYXRpdmVseSBASmFt
ZXMgZmVlbCBmcmVlIHRvIGV4dGVuZCB5b3VyIHBhdGNoZXMgd2hlbiBwcmVwYXJpbmcgdjIuCgpN
YXJjaW4gTmllc3Ryb2ogPG0ubmllc3Ryb2pAZ3Jpbm4tZ2xvYmFsLmNvbT4gd3JpdGVzOgoKPiBT
aWduZWQtb2ZmLWJ5OiBNYXJjaW4gTmllc3Ryb2ogPG0ubmllc3Ryb2pAZ3Jpbm4tZ2xvYmFsLmNv
bT4KPiAtLS0KPiAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDIgKwo+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMSArCj4gIHBhY2thZ2UvcHl0aG9uLWRidXMtZmFzdC9Db25maWcuaW4gICAgICAgICAgICB8
ICA5ICsrKysKPiAgLi4uL3B5dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5oYXNoICAg
IHwgIDUgKysrCj4gIHBhY2thZ2UvcHl0aG9uLWRidXMtZmFzdC9weXRob24tZGJ1cy1mYXN0Lm1r
ICB8IDE0ICsrKysrKwo+ICAuLi4vdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2RidXNfZmFz
dC5weSAgfCA0NCArKysrKysrKysrKysrKysrKysrCj4gIC4uLi90ZXN0cy9wYWNrYWdlL3Rlc3Rf
cHl0aG9uX2RidXNfZmFzdC5weSAgICB8IDQwICsrKysrKysrKysrKysrKysrCj4gIDcgZmlsZXMg
Y2hhbmdlZCwgMTE1IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
cHl0aG9uLWRidXMtZmFzdC9Db25maWcuaW4KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
cHl0aG9uLWRidXMtZmFzdC9weXRob24tZGJ1cy1mYXN0Lmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvcHl0aG9uLWRidXMtZmFzdC9weXRob24tZGJ1cy1mYXN0Lm1rCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9u
X2RidXNfZmFzdC5weQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2UvdGVzdF9weXRob25fZGJ1c19mYXN0LnB5Cj4KCi0tCk1hcmNpbiBOaWVzdHLDs2oK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
