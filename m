Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494BDC43219
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 10:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D39AD60B97;
	Wed, 23 Nov 2022 10:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D39AD60B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IYyTSbuABPRj; Wed, 23 Nov 2022 10:21:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07B7861196;
	Wed, 23 Nov 2022 10:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07B7861196
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF9AE1BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 10:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAF9981FFB
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 10:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAF9981FFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nNfxbaP6osCt for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 10:21:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED09A81F61
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED09A81F61
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 10:21:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05DD823A;
 Wed, 23 Nov 2022 02:21:17 -0800 (PST)
Received: from localhost.localdomain (unknown [10.57.7.127])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E507B3F587;
 Wed, 23 Nov 2022 02:21:09 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:20:34 +0100
Message-Id: <20221123102035.2221-2-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123102035.2221-1-vincent.stehle@arm.com>
References: <20221123102035.2221-1-vincent.stehle@arm.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/edk2-platforms: refine license
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

VGhlIGVkazItcGxhdGZvcm1zIHByb2plY3QgaXMgbGljZW5zZWQgdW5kZXIgdGhlIEJTRC0yLUNs
YXVzZSBsaWNlbnNlIHdpdGgKYSBwYXRlbnQgZ3JhbnQsIGFzIHBlciBjb21taXQgYWU2MDRlNGZm
ZThmICgiZWRrMi1wbGF0Zm9ybXM6IENoYW5nZQpMaWNlbnNlLnR4dCBmcm9tIDItQ2xhdXNlIEJT
RCB0byBCU0QrUGF0ZW50IikuCgpUaGVyZSBpcyBhIEJTRC0yLUNsYXVzZS1QYXRlbnQgU1BEWCBs
aWNlbnNlIGlkZW50aWZpZXJbMV0gZm9yIHRoaXMgY2FzZSwKdGhlcmVmb3JlIHJlZmluZSB0aGUg
ZWRrMi1wbGF0Zm9ybXMgcGFja2FnZSB0byB1c2UgdGhpcyBtb3JlIHNwZWNpZmljCmlkZW50aWZp
ZXIuCgpbMV06IGh0dHBzOi8vc3BkeC5vcmcvbGljZW5zZXMvQlNELTItQ2xhdXNlLVBhdGVudC5o
dG1sCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5j
b20+CkNjOiBEaWNrIE9sc3NvbiA8aGlAc2VuemlsbGEuaW8+Ci0tLQogcGFja2FnZS9lZGsyLXBs
YXRmb3Jtcy9lZGsyLXBsYXRmb3Jtcy5tayB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZWRrMi1wbGF0Zm9y
bXMvZWRrMi1wbGF0Zm9ybXMubWsgYi9wYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZv
cm1zLm1rCmluZGV4IDdkZTU5YzFhZmMuLjZiMTU1YmYwMTMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
ZWRrMi1wbGF0Zm9ybXMvZWRrMi1wbGF0Zm9ybXMubWsKKysrIGIvcGFja2FnZS9lZGsyLXBsYXRm
b3Jtcy9lZGsyLXBsYXRmb3Jtcy5tawpAQCAtNyw3ICs3LDcgQEAKICMgS2VlcCBpbiBzeW5jIHdp
dGggbGF0ZXN0IGNvbW1pdCBhcyBvZiB0aGUgcmVsZWFzZSBkYXRlIGZvciBib290L2VkazIKIEVE
SzJfUExBVEZPUk1TX1ZFUlNJT04gPSBkYjkyMmUxMjUzY2I2ZjFmYzQ1NjgwNWJjNDJmYjdkNDAx
ZWVkNWMyCiBFREsyX1BMQVRGT1JNU19TSVRFID0gJChjYWxsIGdpdGh1Yix0aWFub2NvcmUsZWRr
Mi1wbGF0Zm9ybXMsJChFREsyX1BMQVRGT1JNU19WRVJTSU9OKSkKLUVESzJfUExBVEZPUk1TX0xJ
Q0VOU0UgPSBCU0QtMi1DbGF1c2UKK0VESzJfUExBVEZPUk1TX0xJQ0VOU0UgPSBCU0QtMi1DbGF1
c2UtUGF0ZW50CiBFREsyX1BMQVRGT1JNU19MSUNFTlNFX0ZJTEVTID0gTGljZW5zZS50eHQKIEVE
SzJfUExBVEZPUk1TX0lOU1RBTExfVEFSR0VUID0gTk8KIEVESzJfUExBVEZPUk1TX0lOU1RBTExf
U1RBR0lORyA9IFlFUwotLSAKMi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
