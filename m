Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAF7C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 10:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87DE560B78;
	Wed, 23 Nov 2022 10:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87DE560B78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S8XLewjO-z99; Wed, 23 Nov 2022 10:21:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0092611AB;
	Wed, 23 Nov 2022 10:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0092611AB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFBEB1BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 10:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A96D41918
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 10:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A96D41918
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8_FnyFOTrytq for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 10:21:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EE1F4190E
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EE1F4190E
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 10:21:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E05121477;
 Wed, 23 Nov 2022 02:21:17 -0800 (PST)
Received: from localhost.localdomain (unknown [10.57.7.127])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC3F43F587;
 Wed, 23 Nov 2022 02:21:10 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:20:35 +0100
Message-Id: <20221123102035.2221-3-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123102035.2221-1-vincent.stehle@arm.com>
References: <20221123102035.2221-1-vincent.stehle@arm.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] boot/edk2: refine license
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

VGhlIGVkazIgcHJvamVjdCBpcyBsaWNlbnNlZCB1bmRlciB0aGUgQlNELTItQ2xhdXNlIGxpY2Vu
c2Ugd2l0aCBhIHBhdGVudApncmFudCwgYXMgcGVyIGNvbW1pdCAzMDRiZmY3MjIzYTggKCJlZGsy
OiBDaGFuZ2UgTGljZW5zZS50eHQgZnJvbSAyLUNsYXVzZQpCU0QgdG8gQlNEK1BhdGVudCIpLgoK
VGhlcmUgaXMgYSBCU0QtMi1DbGF1c2UtUGF0ZW50IFNQRFggbGljZW5zZSBpZGVudGlmaWVyWzFd
IGZvciB0aGlzIGNhc2UsCnRoZXJlZm9yZSByZWZpbmUgdGhlIGVkazIgcGFja2FnZSB0byB1c2Ug
dGhpcyBtb3JlIHNwZWNpZmljIGlkZW50aWZpZXIuCgpbMV06IGh0dHBzOi8vc3BkeC5vcmcvbGlj
ZW5zZXMvQlNELTItQ2xhdXNlLVBhdGVudC5odG1sCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0
ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CkNjOiBEaWNrIE9sc3NvbiA8aGlAc2Vuemls
bGEuaW8+Ci0tLQogYm9vdC9lZGsyL2VkazIubWsgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9ib290L2VkazIvZWRrMi5t
ayBiL2Jvb3QvZWRrMi9lZGsyLm1rCmluZGV4IDdkODc2NWMzMTAuLjk1M2JlYTZmZDMgMTAwNjQ0
Ci0tLSBhL2Jvb3QvZWRrMi9lZGsyLm1rCisrKyBiL2Jvb3QvZWRrMi9lZGsyLm1rCkBAIC03LDcg
KzcsNyBAQAogRURLMl9WRVJTSU9OID0gZWRrMi1zdGFibGUyMDIxMDIKIEVESzJfU0lURSA9IGh0
dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMgogRURLMl9TSVRFX01FVEhPRCA9IGdpdAot
RURLMl9MSUNFTlNFID0gQlNELTItQ2xhdXNlCitFREsyX0xJQ0VOU0UgPSBCU0QtMi1DbGF1c2Ut
UGF0ZW50CiBFREsyX0xJQ0VOU0VfRklMRVMgPSBMaWNlbnNlLnR4dAogRURLMl9DUEVfSURfVkVO
RE9SID0gdGlhbm9jb3JlCiBFREsyX0RFUEVOREVOQ0lFUyA9IGVkazItcGxhdGZvcm1zIGhvc3Qt
cHl0aG9uMyBob3N0LWFjcGljYSBob3N0LXV0aWwtbGludXgKLS0gCjIuMzUuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
