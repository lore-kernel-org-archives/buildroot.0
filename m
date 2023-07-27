Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60CAC001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 12:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48F6F60E72;
	Thu, 27 Jul 2023 12:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48F6F60E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UE6oPzNlL5Oq; Thu, 27 Jul 2023 12:27:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8911860E17;
	Thu, 27 Jul 2023 12:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8911860E17
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D5E521BF47F
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 12:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B52D960E17
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 12:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B52D960E17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TmgwpcTdweNh for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 12:27:47 +0000 (UTC)
X-Greylist: delayed 482 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 27 Jul 2023 12:27:47 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 583AD60838
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 583AD60838
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 12:27:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (6)
Received: from zm (pub-46.182.29.194.multiplay.pl [194.29.182.46])
 by server220076.nazwa.pl (Postfix) with ESMTP id 4AEC01BDA95;
 Thu, 27 Jul 2023 14:19:42 +0200 (CEST)
References: <20230725141301.313135-1-james.hilliard1@gmail.com>
User-agent: mu4e 1.10.5; emacs 28.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 27 Jul 2023 14:19:13 +0200
In-reply-to: <20230725141301.313135-1-james.hilliard1@gmail.com>
Message-ID: <87lef11r8i.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-typing-extensions: bump
 to version 4.7.1
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
IC0tLQo+ICAuLi4vcHl0aG9uLXR5cGluZy1leHRlbnNpb25zL3B5dGhvbi10eXBpbmctZXh0ZW5z
aW9ucy5oYXNoICAgIHwgNCArKy0tCj4gIHBhY2thZ2UvcHl0aG9uLXR5cGluZy1leHRlbnNpb25z
L3B5dGhvbi10eXBpbmctZXh0ZW5zaW9ucy5tayAgfCA0ICsrLS0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9weXRob24tdHlwaW5nLWV4dGVuc2lvbnMvcHl0aG9uLXR5cGluZy1leHRlbnNpb25zLmhhc2gg
Yi9wYWNrYWdlL3B5dGhvbi10eXBpbmctZXh0ZW5zaW9ucy9weXRob24tdHlwaW5nLWV4dGVuc2lv
bnMuaGFzaAo+IGluZGV4IGY5ZDFkZTVlMjguLmZlZGI5ZTA0NDYgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9weXRob24tdHlwaW5nLWV4dGVuc2lvbnMvcHl0aG9uLXR5cGluZy1leHRlbnNpb25zLmhh
c2gKPiArKysgYi9wYWNrYWdlL3B5dGhvbi10eXBpbmctZXh0ZW5zaW9ucy9weXRob24tdHlwaW5n
LWV4dGVuc2lvbnMuaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAjIG1kNSwgc2hhMjU2IGZyb20g
aHR0cHM6Ly9weXBpLm9yZy9weXBpL3R5cGluZ19leHRlbnNpb25zL2pzb24KPiAtbWQ1ICAxMTFh
N2QzNzI5MmEyNDE4MTE1MDJiZDFiNjQwMzJiZSAgdHlwaW5nX2V4dGVuc2lvbnMtNC42LjMudGFy
Lmd6Cj4gLXNoYTI1NiAgZDkxZDU5MTkzNTdmZTdmNjgxYTlmMmI1YjRjYjJhNWYxZWYwYTFlOWY1
OWM0ZDhmZjBkMzQ5MWUwNWMwZmZkNSAgdHlwaW5nX2V4dGVuc2lvbnMtNC42LjMudGFyLmd6Cj4g
K21kNSAgMDZlN2ZmZjRiMWQ1MWY4ZGM2ZjQ5YjE2ZTcxZGU1NGUgIHR5cGluZ19leHRlbnNpb25z
LTQuNy4xLnRhci5nego+ICtzaGEyNTYgIGI3NWRkYzI2NGYwYmE1NjE1ZGI3YmEyMTdkYWViOTk3
MDFhZDI5NTM1M2M0NWY5ZTk1OTYzMzM3Y2VlZWZmYjIgIHR5cGluZ19leHRlbnNpb25zLTQuNy4x
LnRhci5nego+ICAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwo+ICBzaGEyNTYg
IDNiMmY4MWZlMjFkMTgxYzQ5OWM1OWEyNTZjOGUxOTY4NDU1ZDY2ODlkMjY5YWE4NTM3M2JmYjZh
ZjQxZGEzYmYgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tdHlwaW5nLWV4
dGVuc2lvbnMvcHl0aG9uLXR5cGluZy1leHRlbnNpb25zLm1rIGIvcGFja2FnZS9weXRob24tdHlw
aW5nLWV4dGVuc2lvbnMvcHl0aG9uLXR5cGluZy1leHRlbnNpb25zLm1rCj4gaW5kZXggMmMwNzg0
NjE1NC4uOWQ0MWIwYTZhNSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi10eXBpbmctZXh0
ZW5zaW9ucy9weXRob24tdHlwaW5nLWV4dGVuc2lvbnMubWsKPiArKysgYi9wYWNrYWdlL3B5dGhv
bi10eXBpbmctZXh0ZW5zaW9ucy9weXRob24tdHlwaW5nLWV4dGVuc2lvbnMubWsKPiBAQCAtNCw5
ICs0LDkgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+Cj4gLVBZVEhPTl9UWVBJ
TkdfRVhURU5TSU9OU19WRVJTSU9OID0gNC42LjMKPiArUFlUSE9OX1RZUElOR19FWFRFTlNJT05T
X1ZFUlNJT04gPSA0LjcuMQo+ICBQWVRIT05fVFlQSU5HX0VYVEVOU0lPTlNfU09VUkNFID0gdHlw
aW5nX2V4dGVuc2lvbnMtJChQWVRIT05fVFlQSU5HX0VYVEVOU0lPTlNfVkVSU0lPTikudGFyLmd6
Cj4gLVBZVEhPTl9UWVBJTkdfRVhURU5TSU9OU19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25o
b3N0ZWQub3JnL3BhY2thZ2VzLzQyLzU2L2NmYWE3YTUyODE3MzRkYWRjODQyZjNhMjJlNTA0NDdj
Njc1YTFjNWE1YjlmNmFkOGEwN2I0NjdiZmZlNwo+ICtQWVRIT05fVFlQSU5HX0VYVEVOU0lPTlNf
U0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8zYy84Yi8wMTEx
ZGQ3ZDZjMTQ3OGJmODNiYWExY2FiODVjNjg2NDI2YzdhNjI3NDExOWFjZWIyYmQ5ZDM1Mzk1YWQK
PiAgUFlUSE9OX1RZUElOR19FWFRFTlNJT05TX1NFVFVQX1RZUEUgPSBmbGl0Cj4gIFBZVEhPTl9U
WVBJTkdfRVhURU5TSU9OU19MSUNFTlNFID0gUHl0aG9uLTIuMAo+ICBQWVRIT05fVFlQSU5HX0VY
VEVOU0lPTlNfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKClJldmlld2VkLWJ5OiBNYXJjaW4gTmll
c3Ryb2ogPG0ubmllc3Ryb2pAZ3Jpbm4tZ2xvYmFsLmNvbT4KCi0tCk1hcmNpbiBOaWVzdHLDs2oK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
