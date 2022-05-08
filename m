Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE106C433F5
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 14:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 552AA60E93;
	Sun,  8 May 2022 14:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0L1gC4C9Dxhz; Sun,  8 May 2022 14:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66C3A60E2E;
	Sun,  8 May 2022 14:43:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B8D81BF409
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 14:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0754040169
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 14:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GKBSB_oQAgqO for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 14:43:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD6EE40012
 for <buildroot@buildroot.org>; Sun,  8 May 2022 14:43:46 +0000 (UTC)
Received: from [213.215.189.91] (port=17872 helo=[192.168.101.175])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nni8N-0000mL-4T; Sun, 08 May 2022 16:43:44 +0200
Message-ID: <2b14df50-4c9c-37e1-7f7e-543816a9f5b2@lucaceresoli.net>
Date: Sun, 8 May 2022 16:43:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: TIAN Yuanhao <tianyuanhao3@163.com>
References: <20220418142855.3489541-1-tianyuanhao3@163.com>
 <bf3aa2a8-54d4-0b1f-a70c-5966b1e6e2d7@mind.be>
 <886d75d1-b878-f521-3c07-df7ceee8040b@lucaceresoli.net>
 <83d40c0d-c9f5-27e2-4e4c-14fa1d1f4507@163.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <83d40c0d-c9f5-27e2-4e4c-14fa1d1f4507@163.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: bump to 903b6fc
 (v5.2.2.4 branch HEAD)
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGlhbiwKCk9uIDA2LzA1LzIyIDE3OjE0LCBUSUFOIFl1YW5oYW8gd3JvdGU6Cj4gSGkgTHVj
YSwKPiAKPiBPbiA1LzQvMjIgMDI6NDQsIEx1Y2EgQ2VyZXNvbGkgd3JvdGU6Cj4+IEhpIFRJQU4s
Cj4+Cj4+IE9uIDE5LzA0LzIyIDIyOjM1LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPj4+
Cj4+PiBPbiAxOC8wNC8yMDIyIDE2OjI4LCBUSUFOIFl1YW5oYW8gd3JvdGU6Cj4+Pj4gVGhpcyBh
bGxvd3MgdG8gYnVpbGQgYWdhaW5zdCBuZXdlciBrZXJuZWxzICh1cCB0byA1LjE4KS4KPj4+PiBU
ZXN0ZWQgb24ga2VybmVsIHY1LjE1Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogVElBTiBZdWFu
aGFvIDx0aWFueXVhbmhhbzNAMTYzLmNvbT4KPj4+IMKgwqBBcHBsaWVkIHRvIG1hc3RlciwgdGhh
bmtzLgo+PiBXZSBhcmUgc2VlaW5nIG5ldyBidWlsZCBmYWlsdXJlcyBzaW5jZSB0aGlzIHBhdGNo
IGhhcyBiZWVuIGFwcGxpZWQuIENhbgo+PiB5b3UgaGF2ZSBhIGxvb2s/Cj4+Cj4gQ29uZmlybWVk
LCB0aGUgYnVpbGQgZmFpbGVkIGJlY2F1c2UgdGhlIGtlcm5lbCBjb25maWcgd2FzIG1pc3NpbmcK
PiBDT05GSUdfQ0ZHODAyMTEuCgpPaCwgc3VyZS4gVGhlbiBpdCBzaG91bGQgYmUgZml4ZWQgYnkg
YWRkaW5nICJDT05GSUdfQ0ZHODAyMTE9eSIgdG8KUlRMODE4OEVVX01PRFVMRV9NQUtFX09QVFMu
IENhbiB5b3UgdHJ5IHRoYXQgcGxlYXNlLCBhbmQgc2VuZCBhIGZpeApwYXRjaC4gaWYgaXQgd29y
a3M/CgpUaGFuayB5b3UhCgotLSAKTHVjYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
