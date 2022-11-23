Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C2AC433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 10:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAA0E4194E;
	Wed, 23 Nov 2022 10:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAA0E4194E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYhvVXvCnxlG; Wed, 23 Nov 2022 10:21:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1FFB41918;
	Wed, 23 Nov 2022 10:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1FFB41918
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 513FA1BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 10:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D3994018D
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 10:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D3994018D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWkG3bZXRU4I for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 10:21:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33C6640158
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33C6640158
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 10:21:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 213F11FB;
 Wed, 23 Nov 2022 02:21:16 -0800 (PST)
Received: from localhost.localdomain (unknown [10.57.7.127])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0F5C73F587;
 Wed, 23 Nov 2022 02:21:08 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:20:33 +0100
Message-Id: <20221123102035.2221-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] refine license of edk2*
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
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpUaGUgZm9sbG93aW5nIGNvdXBsZSBwYXRjaGVzIHJlZmluZSB0aGUgbGljZW5zZSBvZiBl
ZGsyIGFuZCBlZGsyLXBsYXRmb3Jtcy4KCkxvZ2ljYWxseSBzcGVha2luZyB0aGlzIGlzIGEgc2lu
Z2xlIGNvbW1pdCBidXQgYXMgYm9vdC9lZGsyIGFuZApwYWNrYWdlL2VkazItcGxhdGZvcm1zIGFy
ZSB2ZXJ5IGRpc3RpbmN0IHBhdGhzIEkgcHJlZmVyIHRvIHNlbmQgdHdvIGRpc3RpbmN0CnBhdGNo
ZXMuIExldCBtZSBrbm93IGlmIGEgc2luZ2xlIHBhdGNoIGlzIHByZWZlcnJlZCBhbmQgSSB3aWxs
IHJlLXNlbmQuCgpCZXN0IHJlZ2FyZHMsClZpbmNlbnQuCgoKVmluY2VudCBTdGVobMOpICgyKToK
ICBwYWNrYWdlL2VkazItcGxhdGZvcm1zOiByZWZpbmUgbGljZW5zZQogIGJvb3QvZWRrMjogcmVm
aW5lIGxpY2Vuc2UKCiBib290L2VkazIvZWRrMi5tayAgICAgICAgICAgICAgICAgICAgICAgIHwg
MiArLQogcGFja2FnZS9lZGsyLXBsYXRmb3Jtcy9lZGsyLXBsYXRmb3Jtcy5tayB8IDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKLS0gCjIuMzUu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
