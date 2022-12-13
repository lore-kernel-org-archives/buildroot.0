Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA77C4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 20:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D7160FB6;
	Tue, 13 Dec 2022 20:10:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46D7160FB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id blPPPryN8g-O; Tue, 13 Dec 2022 20:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C1B660AD8;
	Tue, 13 Dec 2022 20:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C1B660AD8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3464F1BF301
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 20:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BDAB4097A
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 20:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BDAB4097A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WrBlsBcS3Rug for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 20:10:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BE8340286
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BE8340286
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 20:10:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (7)
Received: from zm (pub-52.182.29.194.multiplay.pl [194.29.182.52])
 by server220076.nazwa.pl (Postfix) with ESMTP id 0D4061BE607;
 Tue, 13 Dec 2022 21:10:25 +0100 (CET)
References: <20221212151011.2803622-1-james.hilliard1@gmail.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 13 Dec 2022 21:10:12 +0100
In-reply-to: <20221212151011.2803622-1-james.hilliard1@gmail.com>
Message-ID: <87cz8noyj3.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bleak: bump to version
 0.19.5
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
Z25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+
CgpSZXZpZXdlZC1ieTogTWFyY2luIE5pZXN0cm9qIDxtLm5pZXN0cm9qQGdyaW5uLWdsb2JhbC5j
b20+Cgo+IC0tLQo+ICBwYWNrYWdlL3B5dGhvbi1ibGVhay9weXRob24tYmxlYWsuaGFzaCB8IDQg
KystLQo+ICBwYWNrYWdlL3B5dGhvbi1ibGVhay9weXRob24tYmxlYWsubWsgICB8IDQgKystLQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1ibGVhay9weXRob24tYmxlYWsuaGFzaCBiL3BhY2th
Z2UvcHl0aG9uLWJsZWFrL3B5dGhvbi1ibGVhay5oYXNoCj4gaW5kZXggOWE4MzEwYjExYy4uMDAx
ZWY2NWI2NSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1ibGVhay9weXRob24tYmxlYWsu
aGFzaAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWJsZWFrL3B5dGhvbi1ibGVhay5oYXNoCj4gQEAg
LTEsNSArMSw1IEBACj4gICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkv
YmxlYWsvanNvbgo+IC1tZDUgIDU3NTY0MDg3ZDZlMTdhZDE4NTMxMDlmNTMwMjc5YjI3ICBibGVh
ay0wLjE5LjEudGFyLmd6Cj4gLXNoYTI1NiAgZGZmN2M3ZjI4MWRjYjY2MjlkMGQ3MjIyMDljNzll
YzNhYTJhNmMzMzg2N2NiNWMxZWEzZDQ0YjcyY2ExNTVjMCAgYmxlYWstMC4xOS4xLnRhci5nego+
ICttZDUgIGQwMzg0ODNlYzE0NWMzZDMyYzFlZjAzZTA0YzQyNjIxICBibGVhay0wLjE5LjUudGFy
Lmd6Cj4gK3NoYTI1NiAgODc4NDVhOTY0NTNjNThjMTkwMzFjNzM1NDQ0YTdiMzE1NjgwMDUzNGJj
ZDNmMjNiYTc0ZTExOWU5YWUzY2Q4OCAgYmxlYWstMC4xOS41LnRhci5nego+ICAjIExvY2FsbHkg
Y29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwo+ICBzaGEyNTYgIGM0MDI5YTJiNjNiMzgyNGFiNjhi
ZTg0MWY0MTRhZGRiZGRlMjBjYjc5Y2RiZTI3MmZhODBjMGIyYWJlNjUzNzQgIExJQ0VOU0UKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tYmxlYWsvcHl0aG9uLWJsZWFrLm1rIGIvcGFja2Fn
ZS9weXRob24tYmxlYWsvcHl0aG9uLWJsZWFrLm1rCj4gaW5kZXggMDBhNDk0NmVmNi4uOTVhYzFk
MTc2NiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1ibGVhay9weXRob24tYmxlYWsubWsK
PiArKysgYi9wYWNrYWdlL3B5dGhvbi1ibGVhay9weXRob24tYmxlYWsubWsKPiBAQCAtNCw5ICs0
LDkgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+Cj4gLVBZVEhPTl9CTEVBS19W
RVJTSU9OID0gMC4xOS4xCj4gK1BZVEhPTl9CTEVBS19WRVJTSU9OID0gMC4xOS41Cj4gIFBZVEhP
Tl9CTEVBS19TT1VSQ0UgPSBibGVhay0kKFBZVEhPTl9CTEVBS19WRVJTSU9OKS50YXIuZ3oKPiAt
UFlUSE9OX0JMRUFLX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2Fn
ZXMvMzAvYjkvNjBlMWY0NTUzNjVlMjM0MGZlMDc2Y2Y3NjgzZjRlNmQwM2RiMGI3NTlkNGY5M2Zh
NDVlNjhkYzM3MWU1Cj4gK1BZVEhPTl9CTEVBS19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25o
b3N0ZWQub3JnL3BhY2thZ2VzL2U2L2I0L2U2MzgyOTgyNmExNTdkMTgwODMxYTFjNWQzNzIwZTc1
ZDYxM2MxMjkwY2IyMzk1MTBkMTQ4YjkwNjgzNgo+ICBQWVRIT05fQkxFQUtfU0VUVVBfVFlQRSA9
IHNldHVwdG9vbHMKPiAgUFlUSE9OX0JMRUFLX0xJQ0VOU0UgPSBNSVQKPiAgUFlUSE9OX0JMRUFL
X0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCgoKLS0KTWFyY2luIE5pZXN0csOzagpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
