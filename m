Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA29C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 01:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02CE160E6B;
	Thu,  3 Nov 2022 01:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02CE160E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QafpcHjf57bs; Thu,  3 Nov 2022 01:52:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18A4360B70;
	Thu,  3 Nov 2022 01:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18A4360B70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ECA671BF337
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 01:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D622760B70
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 01:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D622760B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t78jJZqgunTt for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 01:52:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAE1F60A9E
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAE1F60A9E
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 01:52:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (23)
Received: from zm (pub-52.182.29.194.multiplay.pl [194.29.182.52])
 by server220076.nazwa.pl (Postfix) with ESMTP id 54F401BC4AA;
 Thu,  3 Nov 2022 02:52:39 +0100 (CET)
References: <20221102185739.2346971-1-james.hilliard1@gmail.com>
 <20221102185739.2346971-2-james.hilliard1@gmail.com>
User-agent: mu4e 1.8.11; emacs 28.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 03 Nov 2022 02:52:23 +0100
In-reply-to: <20221102185739.2346971-2-james.hilliard1@gmail.com>
Message-ID: <87a658olcp.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/python-bleak: bump to version
 0.19.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cml0ZXM6Cgo+IFJl
cGxhY2UgcHl0aG9uLWRidXMtbmV4dCBkZXBlbmRlbmN5IHdpdGggcHl0aG9uLWRidXMtZmFzdC4K
Pgo+IEFkZCBuZXcgYXN5bmMtdGltZW91dCBkZXBlbmRlbmN5Lgo+Cj4gU2lnbmVkLW9mZi1ieTog
SmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2th
Z2UvcHl0aG9uLWJsZWFrL0NvbmZpZy5pbiAgICAgICAgIHwgMyArKy0KPiAgcGFja2FnZS9weXRo
b24tYmxlYWsvcHl0aG9uLWJsZWFrLmhhc2ggfCA0ICsrLS0KPiAgcGFja2FnZS9weXRob24tYmxl
YWsvcHl0aG9uLWJsZWFrLm1rICAgfCA0ICsrLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24t
YmxlYWsvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tYmxlYWsvQ29uZmlnLmluCj4gaW5kZXgg
MDg1YzE2ZmFlOC4uNjkxNDUwZjg2YiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1ibGVh
ay9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3B5dGhvbi1ibGVhay9Db25maWcuaW4KPiBAQCAt
MSw2ICsxLDcgQEAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9CTEVBSwo+ICAJYm9vbCAi
cHl0aG9uLWJsZWFrIgo+IC0Jc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9EQlVTX05FWFQgIyBy
dW50aW1lCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX0FTWU5DX1RJTUVPVVQgIyBydW50
aW1lCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX0RCVVNfRkFTVCAjIHJ1bnRpbWUKPiAg
CWhlbHAKPiAgCSAgQmx1ZXRvb3RoIExvdyBFbmVyZ3kgcGxhdGZvcm0gQWdub3N0aWMgS2xpZW50
Lgo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWJsZWFrL3B5dGhvbi1ibGVhay5oYXNo
IGIvcGFja2FnZS9weXRob24tYmxlYWsvcHl0aG9uLWJsZWFrLmhhc2gKPiBpbmRleCA1YWNhYzg3
N2M5Li45YTgzMTBiMTFjIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWJsZWFrL3B5dGhv
bi1ibGVhay5oYXNoCj4gKysrIGIvcGFja2FnZS9weXRob24tYmxlYWsvcHl0aG9uLWJsZWFrLmhh
c2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAgIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5v
cmcvcHlwaS9ibGVhay9qc29uCj4gLW1kNSAgMGMyNmIyNzAzNThhNzgyNzY3MDEyMjIwZmM1OTVh
YTUgIGJsZWFrLTAuMTIuMS50YXIuZ3oKPiAtc2hhMjU2ICA0YTgwYTI0Y2M5NDRlNTJlODU2MDU0
NjM5ZjI5ODIyOWMzOWEyZmM3MjBlNWY3YWRiZWViYjExN2QxMDg0OWVkICBibGVhay0wLjEyLjEu
dGFyLmd6Cj4gK21kNSAgNTc1NjQwODdkNmUxN2FkMTg1MzEwOWY1MzAyNzliMjcgIGJsZWFrLTAu
MTkuMS50YXIuZ3oKPiArc2hhMjU2ICBkZmY3YzdmMjgxZGNiNjYyOWQwZDcyMjIwOWM3OWVjM2Fh
MmE2YzMzODY3Y2I1YzFlYTNkNDRiNzJjYTE1NWMwICBibGVhay0wLjE5LjEudGFyLmd6Cj4gICMg
TG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gIHNoYTI1NiAgYzQwMjlhMmI2M2Iz
ODI0YWI2OGJlODQxZjQxNGFkZGJkZGUyMGNiNzljZGJlMjcyZmE4MGMwYjJhYmU2NTM3NCAgTElD
RU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1ibGVhay9weXRob24tYmxlYWsubWsg
Yi9wYWNrYWdlL3B5dGhvbi1ibGVhay9weXRob24tYmxlYWsubWsKPiBpbmRleCAzYWU2ZDkwMzEx
Li4wMGE0OTQ2ZWY2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWJsZWFrL3B5dGhvbi1i
bGVhay5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWJsZWFrL3B5dGhvbi1ibGVhay5tawo+IEBA
IC00LDkgKzQsOSBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4KPiAtUFlUSE9O
X0JMRUFLX1ZFUlNJT04gPSAwLjEyLjEKPiArUFlUSE9OX0JMRUFLX1ZFUlNJT04gPSAwLjE5LjEK
PiAgUFlUSE9OX0JMRUFLX1NPVVJDRSA9IGJsZWFrLSQoUFlUSE9OX0JMRUFLX1ZFUlNJT04pLnRh
ci5nego+IC1QWVRIT05fQkxFQUtfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9y
Zy9wYWNrYWdlcy82Ny80Yi9iYTAwYzY5YTI0YThkMDhjODZmMDJjYWE0NTcyN2EyYWQyODQ0Yzdi
ZWU5NjMwY2NiMDYzYmUyMjZmNzEKPiArUFlUSE9OX0JMRUFLX1NJVEUgPSBodHRwczovL2ZpbGVz
LnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMzAvYjkvNjBlMWY0NTUzNjVlMjM0MGZlMDc2Y2Y3
NjgzZjRlNmQwM2RiMGI3NTlkNGY5M2ZhNDVlNjhkYzM3MWU1Cj4gIFBZVEhPTl9CTEVBS19TRVRV
UF9UWVBFID0gc2V0dXB0b29scwo+ICBQWVRIT05fQkxFQUtfTElDRU5TRSA9IE1JVAo+ICBQWVRI
T05fQkxFQUtfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKClJldmlld2VkLWJ5OiBNYXJjaW4gTmll
c3Ryb2ogPG0ubmllc3Ryb2pAZ3Jpbm4tZ2xvYmFsLmNvbT4KCi0tCk1hcmNpbiBOaWVzdHLDs2oK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
