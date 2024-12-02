Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D9AE69E82
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 18:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9869A407FD;
	Mon,  2 Dec 2024 18:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86kXFjgwkPOR; Mon,  2 Dec 2024 18:19:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8122A40800
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8122A40800;
	Mon,  2 Dec 2024 18:19:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 643741ED7
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4591581E9E
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAcdiejmIMRq for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 18:19:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=glbb-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A879815AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A879815AD
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A879815AD
 for <buildroot@busybox.net>; Mon,  2 Dec 2024 18:19:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1tIB0l-0006HO-Gk
 for buildroot@busybox.net; Mon, 02 Dec 2024 19:19:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 02 Dec 2024 19:18:57 +0100
Message-ID: <pan$18c4d$bb797079$380639ce$855e5cda@ID-313208.user.individual.net>
References: <20240922193751.862053-1-bernd@kuhls.net>
 <20240922193751.862053-5-bernd@kuhls.net>
 <c80de03.7818.1921db53aa2.Coremail.andyshrk@163.com>
 <c655577.1b64.192853c1be6.Coremail.andyshrk@163.com>
 <87frn6dptr.fsf__47548.8251003966$1733156129$gmane$org@draig.linaro.org>
 <pan$30ab5$cc5a9166$89866316$e1ba867c@ID-313208.user.individual.net>
 <874j3mdkt6.fsf@draig.linaro.org>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Cc: buildroot@uclibc.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
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

QW0gTW9uLCAwMiBEZWMgMjAyNCAxODowMzoxNyArMDAwMCBzY2hyaWViIEFsZXggQmVubsOpZToK
Cj4gSSBoYXZlIHVwZGF0ZXMgdG8gdGhlIFZpcnRJTyBwYXRjaGVzIGFuZCBlbmFibGluZyB2a21h
cmsuIFNob3VsZCBJIHBvc3QKPiB0aG9zZSBzZXBhcmF0ZWx5IG9yIGNvbWJpbmUgYW5kIHJlLXBv
c3Qgd2l0aCB5b3VyIGxhdGVzdCBzZXJpZXM/CgpIaSBBbmR5LAoKcGxlYXNlIGNvbWJpbmUgYW5k
IHJlLXBvc3Qgd2l0aCBteSBsYXRlc3Qgc2VyaWVzLCBJIHdpbGwgdGhlbiBtYXJrIG15IApzZXJp
ZXMgYXMgIlN1cGVyc2VkZWQiIGluIHBhdGNod29ya3MuIFRoaXMgYXZvaWRzIGhhdmluZyB0aGUg
YnVpbGRyb290IAptYWludGFpbmVycyB0byBwaWNrIHVwIHNjYXR0ZXJlZCBwYXRjaGVzIDspCgpS
ZWdhcmRzLCBCZXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
