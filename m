Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CD5C636D6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 18:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 724C981B23;
	Thu, 23 Feb 2023 18:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 724C981B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5zUUuz3I9do3; Thu, 23 Feb 2023 18:09:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9BAF821B6;
	Thu, 23 Feb 2023 18:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9BAF821B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 777E21BF2BD
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 18:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E61560F53
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 18:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E61560F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f-qi1lb0sy3M for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 18:09:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8CCD60F74
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8CCD60F74
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 18:09:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31F89FEC;
 Thu, 23 Feb 2023 10:09:43 -0800 (PST)
Received: from localhost.localdomain (X72Y076X74.nice.arm.com [10.34.129.9])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 836B33F587;
 Thu, 23 Feb 2023 10:08:59 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 19:08:46 +0100
Message-Id: <20230223180847.2512056-2-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223180847.2512056-1-vincent.stehle@arm.com>
References: <20230223180847.2512056-1-vincent.stehle@arm.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] boot/boot-wrapper-aarch64: bump version
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

QnVtcCBib290LXdyYXBwZXIgdG8gdGhlIGxhdGVzdCB2ZXJzaW9uLgoKU2lnbmVkLW9mZi1ieTog
VmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgpDYzogVGhvbWFzIFBldGF6
em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KLS0tCiBib290L2Jvb3Qtd3JhcHBl
ci1hYXJjaDY0L2Jvb3Qtd3JhcHBlci1hYXJjaDY0Lm1rIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYm9vdC9ib290LXdy
YXBwZXItYWFyY2g2NC9ib290LXdyYXBwZXItYWFyY2g2NC5tayBiL2Jvb3QvYm9vdC13cmFwcGVy
LWFhcmNoNjQvYm9vdC13cmFwcGVyLWFhcmNoNjQubWsKaW5kZXggMzBiMzUyZjhlNy4uOTVmN2Uy
Mjc2MCAxMDA2NDQKLS0tIGEvYm9vdC9ib290LXdyYXBwZXItYWFyY2g2NC9ib290LXdyYXBwZXIt
YWFyY2g2NC5taworKysgYi9ib290L2Jvb3Qtd3JhcHBlci1hYXJjaDY0L2Jvb3Qtd3JhcHBlci1h
YXJjaDY0Lm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAot
Qk9PVF9XUkFQUEVSX0FBUkNINjRfVkVSU0lPTiA9IDhkNWE3NjUyNTFkOTExM2MzYzBmOWZhMTRk
ZTQyYTllNzQ4NmZlOGEKK0JPT1RfV1JBUFBFUl9BQVJDSDY0X1ZFUlNJT04gPSA5ZjI2YTFjMWYy
N2JkNmI1YjY2YzI2NTExNDg0ODAwN2ZjMjJlNGFhCiBCT09UX1dSQVBQRVJfQUFSQ0g2NF9TSVRF
ID0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbWFyay9i
b290LXdyYXBwZXItYWFyY2g2NC5naXQKIEJPT1RfV1JBUFBFUl9BQVJDSDY0X1NJVEVfTUVUSE9E
ID0gZ2l0CiBCT09UX1dSQVBQRVJfQUFSQ0g2NF9MSUNFTlNFID0gQlNELTMtQ2xhdXNlCi0tIAoy
LjM5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
