Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B76DCF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 19:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5499605C4;
	Sun, 22 Sep 2024 19:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKMyr266LZdZ; Sun, 22 Sep 2024 19:27:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F3EA605CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F3EA605CA;
	Sun, 22 Sep 2024 19:27:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E54D1BF3D4
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 19:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 067CC605C4
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 19:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GvHrENU7UUyC for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 19:27:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A2B2C605CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2B2C605CA
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2B2C605CA
 for <buildroot@uclibc.org>; Sun, 22 Sep 2024 19:27:15 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1ssSEg-0004sF-9K
 for buildroot@uclibc.org; Sun, 22 Sep 2024 21:27:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 22 Sep 2024 21:26:45 +0200
Message-ID: <pan$d922e$d480999b$de8d76a7$4d2b55f8@ID-313208.user.individual.net>
References: <20240822181546.64900-1-bernd@kuhls.net>
 <20240822181546.64900-5-bernd@kuhls.net>
 <2a21a576.8037.191efc37b94.Coremail.andyshrk@163.com>
 <19f56d2a.1aaa.191f9e145f6.Coremail.andyshrk@163.com>
 <ZuiEAeBfrMsUWAjC__26229.9065290549$1726514217$gmane$org@landeda>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH/next 5/6] package/{mesa3d,
 mesa3d-headers}: bump version to 24.2.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gTW9uLCAxNiBTZXAgMjAyNCAyMToxNjoxNyArMDIwMCBzY2hyaWViIFlhbm4gRS4gTU9SSU46
Cgo+IE9uIDIwMjQtMDktMTYgMTY6MDkgKzA4MDAsIEFuZHkgWWFuIHNwYWtlIHRodXNseToKPj4g
SSBmb3VuZCB0aGUgYnVpbGQgZXJyb3Igd2FzIGdvbmUgd2hlbiBJIGFkZCAgaG9zdC1weXRob24t
cHl5YW1sICB0bwo+PiBNRVNBM0RfREVQRU5ERU5DSUVT77yMCj4+IFNob3VsZCB0aGlzIGJlIGFk
ZGVkIHRoZXJlIO+8nwo+IAo+IEl0IHNob3VsZCBpbmRlZWQgcHJvYmFibHkgYmUgYWRkZWQsIGJ1
dCBjb25kaXRpb25hbGx5LCBpLmUuIG9ubHkgd2hlbgo+IHRoZSBhZmZlY3RlZCBkcml2ZXIgaXMg
ZW5hYmxlZCwgc29tbmV0aGluZyBsaWtlOgoKSGkgWWFubiwgaGkgQW5keSwKCnRoZSBpcmlzIGRy
aXZlciBpcyB0aGUgb25seSBvbmUgSSBhbSB1c2luZyBhdCBydW50aW1lIGFuZCB0aGVyZWZvcmUg
dGhlIApyZWFzb24gd2h5IEkgZGlkIG5vdCBzZWUgdGhpcyBlcnJvciBiZWZvcmUuIE9ubHkgZm9y
IHRoaXMgZHJpdmVyIEkgbmVlZGVkIAp0byBjcmVhdGUgYSBob3N0LW1lc2EzZCBwYWNrYWdlLCB3
aGljaCBpbiB0dXJuIGRlcGVuZHMgb24gaG9zdC1weXRob24tCnB5eWFtbCwgYnV0IHRoZSBkZXBl
bmRlbmN5IHRvIGhvc3QtcHl0aG9uLXB5eWFtbCBpcyBuZWVkZWQgZm9yIHRoZSB0YXJnZXQgCnZl
cnNpb24gb2YgbWVzYTNkIGFzIHdlbGwgcmVnYXJkbGVzcyB3aGljaCBkcml2ZXJzIGFyZSBlbmFi
bGVkOiBodHRwczovLwpnaXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL2Jsb2IvbWVz
YS0yNC4yLjAvbWVzb24uYnVpbGQ/CmJsYW1lPTEjTDk2MQoKVGhlIG5leHQgaXRlcmF0aW9uIG9m
IHRoZSBwYXRjaCBzZXJpZXMgd2lsbCBpbmNsdWRlIHRoZSBmaXguCgpSZWdhcmRzLCBCZXJuZAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
