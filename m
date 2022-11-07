Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CA2C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 17:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8571360BBE;
	Mon,  7 Nov 2022 17:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8571360BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L3OY9t_wrjrp; Mon,  7 Nov 2022 17:19:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD0ED60B78;
	Mon,  7 Nov 2022 17:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD0ED60B78
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6A021BF2EF
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 17:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8210D40286
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 17:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8210D40286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f0YQ4KXR0wvl for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 17:19:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 846B740012
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 846B740012
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 17:19:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (7)
Received: from zm (pub-52.182.29.194.multiplay.pl [194.29.182.52])
 by server220076.nazwa.pl (Postfix) with ESMTP id 78DA21BDAA6;
 Mon,  7 Nov 2022 18:19:35 +0100 (CET)
References: <20221106161149.322781-1-james.hilliard1@gmail.com>
User-agent: mu4e 1.8.11; emacs 28.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 07 Nov 2022 18:18:53 +0100
In-reply-to: <20221106161149.322781-1-james.hilliard1@gmail.com>
Message-ID: <87leomwul5.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pytest: bump to version
 7.2.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cml0ZXM6Cgo+IFNp
Z25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoK
UmV2aWV3ZWQtYnk6IE1hcmNpbiBOaWVzdHJvaiA8bS5uaWVzdHJvakBncmlubi1nbG9iYWwuY29t
PgoKPiAtLS0KPiAgcGFja2FnZS9weXRob24tcHl0ZXN0L3B5dGhvbi1weXRlc3QuaGFzaCB8IDQg
KystLQo+ICBwYWNrYWdlL3B5dGhvbi1weXRlc3QvcHl0aG9uLXB5dGVzdC5tayAgIHwgNCArKy0t
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXB5dGVzdC9weXRob24tcHl0ZXN0Lmhhc2ggYi9w
YWNrYWdlL3B5dGhvbi1weXRlc3QvcHl0aG9uLXB5dGVzdC5oYXNoCj4gaW5kZXggYzJlYWQwYWE2
NC4uMmFlMWU2MWVkNCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1weXRlc3QvcHl0aG9u
LXB5dGVzdC5oYXNoCj4gKysrIGIvcGFja2FnZS9weXRob24tcHl0ZXN0L3B5dGhvbi1weXRlc3Qu
aGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBp
Lm9yZy9weXBpL3B5dGVzdC9qc29uCj4gLW1kNSAgNGE5ODAwMTU4MWExOGQ0MDg0Y2I1MDI3ZmRi
MTQ2N2QgIHB5dGVzdC03LjEuMi50YXIuZ3oKPiAtc2hhMjU2ICBhMDZhMDQyNTQ1Mzg2NGEyNzBi
YzQ1ZTcxZjc4MzMzMGE3NDI4ZGVmYjQyMzBmYjVlNmE3MzFmZGUwNmVjZDQ1ICBweXRlc3QtNy4x
LjIudGFyLmd6Cj4gK21kNSAgNDlkZWNiYWRlNDAxMDlmOWM2OTcwZGY2MGMyMmEyMzAgIHB5dGVz
dC03LjIuMC50YXIuZ3oKPiArc2hhMjU2ICBjNDAxNGViNDBlMTBmMTFmMzU1YWQ0ZTNjMmZiMmM2
YzZkMTkxOWM3M2YzYjVhNDMzZGU0NzA4MjAyY2FkZTU5ICBweXRlc3QtNy4yLjAudGFyLmd6Cj4g
ICMgTG9jYWxseSBjb21wdXRlciBzaGEyNTYKPiAgc2hhMjU2ICBjYTgzNmE1ZjllY2NhM2IyZjM1
MDIzMGZhYTIwYTQ4ZmI4YjE0NTY1M2I1NTY4ZDc4NDg2MmRmODY0NzA2YjliICBMSUNFTlNFCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXB5dGVzdC9weXRob24tcHl0ZXN0Lm1rIGIvcGFj
a2FnZS9weXRob24tcHl0ZXN0L3B5dGhvbi1weXRlc3QubWsKPiBpbmRleCA4NWQ3NjJhYzhiLi4x
Nzk0NTgyZGQzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXB5dGVzdC9weXRob24tcHl0
ZXN0Lm1rCj4gKysrIGIvcGFja2FnZS9weXRob24tcHl0ZXN0L3B5dGhvbi1weXRlc3QubWsKPiBA
QCAtNCw5ICs0LDkgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+Cj4gLVBZVEhP
Tl9QWVRFU1RfVkVSU0lPTiA9IDcuMS4yCj4gK1BZVEhPTl9QWVRFU1RfVkVSU0lPTiA9IDcuMi4w
Cj4gIFBZVEhPTl9QWVRFU1RfU09VUkNFID0gcHl0ZXN0LSQoUFlUSE9OX1BZVEVTVF9WRVJTSU9O
KS50YXIuZ3oKPiAtUFlUSE9OX1BZVEVTVF9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0
ZWQub3JnL3BhY2thZ2VzLzRlLzFmLzM0NjU3YzZhYzU2ZjNjNThkZjY1MGJhNDFmOGZmYjI2MjAy
ODFlYWQ4ZTExYmNkYzdkYjYzY2Y3MmE3OAo+ICtQWVRIT05fUFlURVNUX1NJVEUgPSBodHRwczov
L2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMGIvMjEvMDU1ZjM5YmY4ODYxNTgwYjQz
Zjg0NWY5ZTgyNzBjNzc4NmZlNjI5YjJmODU2MmZmMDkwMDcxMzJlMmU3Cj4gIFBZVEhPTl9QWVRF
U1RfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiAgUFlUSE9OX1BZVEVTVF9MSUNFTlNFID0gTUlU
Cj4gIFBZVEhPTl9QWVRFU1RfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKCgotLQpNYXJjaW4gTmll
c3Ryw7NqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
