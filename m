Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D85C6379F
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 18:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 226D281975;
	Thu, 23 Feb 2023 18:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 226D281975
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9zYwRnnD5lz; Thu, 23 Feb 2023 18:09:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 557F581B23;
	Thu, 23 Feb 2023 18:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 557F581B23
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE2C01BF2BD
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 18:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0DEA60F7A
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 18:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0DEA60F7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pUj-r9Ioo5lt for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 18:09:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABEEA60F53
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABEEA60F53
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 18:09:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 429E4C14;
 Thu, 23 Feb 2023 10:09:42 -0800 (PST)
Received: from localhost.localdomain (X72Y076X74.nice.arm.com [10.34.129.9])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 937F53F587;
 Thu, 23 Feb 2023 10:08:58 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 19:08:45 +0100
Message-Id: <20230223180847.2512056-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] Bump Arm Foundation
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
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpIZXJlIGFyZSBhIGNvdXBsZSBvZiBwYXRjaGVzIHRvIGJ1bXAgYm9vdC13cmFwcGVyIGFu
ZCB0aGUKYXJtX2ZvdW5kYXRpb252OF9kZWZjb25maWcuCgpUaGV5IHNob3VsZCBiZSBhcHBsaWVk
IGluIG9yZGVyLCBwbGVhc2UuCgpUaGUgdXBkYXRlZCBtb2RlbCB2ZXJzaW9uIG1lbnRpb25lZCBp
biB0aGUgc2Vjb25kIHBhdGNoIHdpbGwgbm90IHJ1biB0aGUKb2xkZXIgYm9vdC13cmFwcGVyICJh
cyBpcyI7IGl0IHdvdWxkIG5lZWQgb3B0aW9uIGAtLWFybS12OC4wJyBmb3IgZXhhbXBsZS4KCkJl
c3QgcmVnYXJkcywKVmluY2VudC4KCgpWaW5jZW50IFN0ZWhsw6kgKDIpOgogIGJvb3QvYm9vdC13
cmFwcGVyLWFhcmNoNjQ6IGJ1bXAgdmVyc2lvbgogIGNvbmZpZ3MvYXJtX2ZvdW5kYXRpb252ODog
YnVtcCB0byBMaW51eCA2LjEuMTMKCiBib2FyZC9hcm0vZm91bmRhdGlvbi12OC9yZWFkbWUudHh0
ICAgICAgICAgICAgICAgIHwgNCArKy0tCiBib290L2Jvb3Qtd3JhcHBlci1hYXJjaDY0L2Jvb3Qt
d3JhcHBlci1hYXJjaDY0Lm1rIHwgMiArLQogY29uZmlncy9hcm1fZm91bmRhdGlvbnY4X2RlZmNv
bmZpZyAgICAgICAgICAgICAgICB8IDcgKysrKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgotLSAKMi4zOS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
