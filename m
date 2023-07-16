Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F6FC0015E
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 20:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F6C860C1D;
	Sun, 16 Jul 2023 20:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F6C860C1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sd1v80r_ITLy; Sun, 16 Jul 2023 20:05:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 687F960BEB;
	Sun, 16 Jul 2023 20:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 687F960BEB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 157831BF365
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 20:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2E7F60BEB
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 20:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2E7F60BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oLDc7I5lEA32 for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 20:05:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6786E60AF1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6786E60AF1
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 20:05:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7BCD0E0002;
 Sun, 16 Jul 2023 20:05:46 +0000 (UTC)
Message-ID: <f7360ea5-bde6-f924-dba8-718e35c8d170@korsgaard.com>
Date: Sun, 16 Jul 2023 22:05:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20230703091001.12573-1-sebastien.szymanski@armadeus.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20230703091001.12573-1-sebastien.szymanski@armadeus.com>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/pkgconf: fix broken URL
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDMvMDcvMjAyMyAxMS4xMCwgU8OpYmFzdGllbiBTenltYW5za2kgd3JvdGU6Cj4gUmVsZWFz
ZSB0YXJiYWxsIGxvY2F0aW9uIGhhcyBjaGFuZ2VkIFsxXSwgdXBkYXRlIFBLR0NPTkZfU0lURS4K
PiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3BrZ2NvbmYvcGtnY29uZi9jb21taXQvNDM3YzJh
MzIxOGJmY2IxY2FlN2ZhMzhhNGNjZDBjYjI5NTc1ZmYwNwo+IAo+IFNpZ25lZC1vZmYtYnk6IFPD
qWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KCkNv
bW1pdHRlZCB0byAyMDIzLjAyLnggYW5kIDIwMjMuMDUueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0
ZXIgS29yc2dhYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
