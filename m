Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615E6D7833D
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 17:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 208BB41866;
	Mon,  2 Dec 2024 17:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zL455hbDNC1L; Mon,  2 Dec 2024 17:45:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BCC441867
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BCC441867;
	Mon,  2 Dec 2024 17:45:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 029E060
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 17:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D86286062B
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 17:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAgkOFxioYFD for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 17:45:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E739C605EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E739C605EB
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E739C605EB
 for <buildroot@uclibc.org>; Mon,  2 Dec 2024 17:45:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1tIATt-0001Te-KE
 for buildroot@uclibc.org; Mon, 02 Dec 2024 18:45:09 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 02 Dec 2024 18:44:37 +0100
Message-ID: <pan$30ab5$cc5a9166$89866316$e1ba867c@ID-313208.user.individual.net>
References: <20240922193751.862053-1-bernd@kuhls.net>
 <20240922193751.862053-5-bernd@kuhls.net>
 <c80de03.7818.1921db53aa2.Coremail.andyshrk@163.com>
 <c655577.1b64.192853c1be6.Coremail.andyshrk@163.com>
 <87frn6dptr.fsf__47548.8251003966$1733156129$gmane$org@draig.linaro.org>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH v2 5/6] package/{mesa3d,
 mesa3d-headers}: bump version to 24.2.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gTW9uLCAwMiBEZWMgMjAyNCAxNjoxNDo1NiArMDAwMCBzY2hyaWViIEFsZXggQmVubsOpZToK
Cj4gIkFuZHkgWWFuIiA8YW5keXNocmtAMTYzLmNvbT4gd3JpdGVzOgo+IAo+PiBIZWxsb++8jAo+
PiAgICBDYW4gd2UgZ2V0IHRoaXMgc2VyaWVzIG1lcmdlZO+8nwo+IAo+IEkndmUgZ290IGEgYnJh
bmNoIHdpdGggQmVybmQncyBwYXRjaGVzICsgdGhlIGVuYWJsaW5nIG9mIFZpcnRJTyBWZW51cwo+
IGFuZCBhZGRpbmcgdmttYXJrIHRvIHRoZSBidWlsZC4gSWYgQmVybmQncyBvayB3aXRoIGl0IEkg
Y2FuIHBvc3QgaXQgdG8KPiB0aGUgbGlzdCB0b2RheS4KCkhpIEFuZHksCgpJIHNlbnQgYSBuZXcg
cGF0Y2ggc2VyaWVzIGJ1bXBpbmcgbWVzYTNkIHRvIDI0LjMuMCBhIGNvdXBsZSBvZiBtaW51dGVz
IAphZ286IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlz
dC8/c2VyaWVzPTQzNDkzNAoKUnVuLXRpbWUgdGVzdCB3aXRoIG15IEludGVsLWJhc2VkIHN5c3Rl
bSBhbmQgZ2JtL2VnbCB3b3JrcywgZGlkIG5vdCBidWlsZC0KdGVzdCBpdCB3aXRoIHgxMS93YXls
YW5kIGhvd2V2ZXIuIFBsZWFzZSBhZGQgeW91ciBwYXRjaGVzIHRvIHRoaXMgbW9zdCB1cC0KdG8t
ZGF0ZSBwYXRjaCBzZXJpZXMsIHRoYW5rcy4KClJlZ2FyZHMsIEJlcm5kCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
