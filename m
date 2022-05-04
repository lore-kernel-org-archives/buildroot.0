Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6075DC433EF
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 09:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10F7860E6A;
	Wed,  4 May 2022 09:44:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FA_npXGofto6; Wed,  4 May 2022 09:44:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21FFB60AD5;
	Wed,  4 May 2022 09:44:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48F911BF239
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 09:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3703C41815
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 09:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yzinZWQDTosW for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 09:44:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05C41416E8
 for <buildroot@buildroot.org>; Wed,  4 May 2022 09:44:49 +0000 (UTC)
Received: from [77.244.183.192] (port=62416 helo=[192.168.178.75])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nmBYt-0009BV-Qf; Wed, 04 May 2022 11:44:47 +0200
Message-ID: <886d75d1-b878-f521-3c07-df7ceee8040b@lucaceresoli.net>
Date: Wed, 4 May 2022 11:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, TIAN Yuanhao
 <tianyuanhao3@163.com>, buildroot@buildroot.org
References: <20220418142855.3489541-1-tianyuanhao3@163.com>
 <bf3aa2a8-54d4-0b1f-a70c-5966b1e6e2d7@mind.be>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <bf3aa2a8-54d4-0b1f-a70c-5966b1e6e2d7@mind.be>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVElBTiwKCk9uIDE5LzA0LzIyIDIyOjM1LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToK
PiAKPiAKPiBPbiAxOC8wNC8yMDIyIDE2OjI4LCBUSUFOIFl1YW5oYW8gd3JvdGU6Cj4+IFRoaXMg
YWxsb3dzIHRvIGJ1aWxkIGFnYWluc3QgbmV3ZXIga2VybmVscyAodXAgdG8gNS4xOCkuCj4+IFRl
c3RlZCBvbiBrZXJuZWwgdjUuMTUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFRJQU4gWXVhbmhhbyA8
dGlhbnl1YW5oYW8zQDE2My5jb20+Cj4gCj4gwqBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoK
V2UgYXJlIHNlZWluZyBuZXcgYnVpbGQgZmFpbHVyZXMgc2luY2UgdGhpcyBwYXRjaCBoYXMgYmVl
biBhcHBsaWVkLiBDYW4KeW91IGhhdmUgYSBsb29rPwoKVGhlIGZ1bGwgbGlzdDoKCmh0dHA6Ly9h
dXRvYnVpbGQuYnVpbGRyb290Lm9yZy9pbmRleC5waHA/cmVhc29uPXJ0bDgxODhldS05MDNiNmZj
YjgyMTQ2NWZlOWM2M2U4MzQxNjA4MGRmNzBjMWMzYzkwCgpTb21lIGV4YW1wbGVzOgoKaHR0cDov
L2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvOTUxLzk1MTQ3MDRkNmQ0NGZjMWI1ZGQx
ODhlYWMwNmIyNjk0MjdkM2RlZTIvLwoKaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jl
c3VsdHMvOWVhLzllYTA2MGNjMzVlODU5ZWJjNzNjNjVmZTJkMWY3NDc4ZjliNGZhOGQvCgpodHRw
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy82NTgvNjU4YzA2ZjgxMjU2MTNiNTY1
MTFkMzM1MWNkZmQzZDhlMTlkNDhkYS8vCgpGWUksIGF0IHRoZSBlbmQgb2YgdGhlIGh0dHA6Ly9h
dXRvYnVpbGQuYnVpbGRyb290Lm9yZy8gcGFnZSB0aGVyZSBpcyBhCmxpbmsgdG8gYSAiU2NyaXB0
IHRvIHJlcHJvZHVjZSBhIGJ1aWxkIiB0aGF0IGlzIHF1aXRlIGhhbmR5IHRvIHJlcHJvZHVjZQp0
aGUgcHJvYmxlbSBsb2NhbGx5IGluIG9yZGVyIHRvIGRlYnVnIGl0LgoKVGhhbmsgeW91IQotLSAK
THVjYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
