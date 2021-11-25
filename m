Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E659C433F5
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 18:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C09460768;
	Thu, 25 Nov 2021 18:28:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P1iaU0ZyvmdV; Thu, 25 Nov 2021 18:28:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BBE860764;
	Thu, 25 Nov 2021 18:28:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C6F21BF94B
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 18:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BDB140174
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 18:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XMXg2oTiUGFv for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 18:27:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C0FA4015F
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 18:27:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B9D91FB;
 Thu, 25 Nov 2021 10:27:58 -0800 (PST)
Received: from localhost.localdomain (C02TH0X6HF1T.nice.arm.com [10.34.124.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 872FB3F73B;
 Thu, 25 Nov 2021 10:27:57 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 19:26:55 +0100
Message-Id: <20211125182655.9365-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211125102441.5351-1-vincent.stehle@arm.com>
References: <20211125102441.5351-1-vincent.stehle@arm.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH next v2] configs/aarch64_efi: bump kernel version
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

QnVtcCBMaW51eCBrZXJuZWwgdmVyc2lvbiB0byA1LjE1LjQuCgpXZSBlbmxhcmdlIHRoZSBib290
IHBhcnRpdGlvbiB0byBmb2xsb3cgdGhlIGtlcm5lbCBpbWFnZSBzaXplIGluY3JlYXNlIGFuZAp1
cGRhdGUgdGhlIGRvY3VtZW50YXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kg
PHZpbmNlbnQuc3RlaGxlQGFybS5jb20+ClJldmlld2VkLWJ5OiBEaWNrIE9sc3NvbiA8aGlAc2Vu
emlsbGEuaW8+CkNjOiBFcmljbyBOdW5lcyA8bnVuZXMuZXJpY29AZ21haWwuY29tPgotLS0KCkNo
YW5nZXMgc2luY2UgdjE6Ci0gVXBkYXRlIGNvbW1pdCBtZXNzYWdlCgogYm9hcmQvYWFyY2g2NC1l
ZmkvZ2VuaW1hZ2UtZWZpLmNmZyB8IDIgKy0KIGJvYXJkL2FhcmNoNjQtZWZpL3JlYWRtZS50eHQg
ICAgICAgfCAyICstCiBjb25maWdzL2FhcmNoNjRfZWZpX2RlZmNvbmZpZyAgICAgIHwgNiArKyst
LS0KIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2JvYXJkL2FhcmNoNjQtZWZpL2dlbmltYWdlLWVmaS5jZmcgYi9ib2FyZC9hYXJj
aDY0LWVmaS9nZW5pbWFnZS1lZmkuY2ZnCmluZGV4IDhlYzFmMTBmZDgyLi4xM2Q2OWU1ZTQyNSAx
MDA2NDQKLS0tIGEvYm9hcmQvYWFyY2g2NC1lZmkvZ2VuaW1hZ2UtZWZpLmNmZworKysgYi9ib2Fy
ZC9hYXJjaDY0LWVmaS9nZW5pbWFnZS1lZmkuY2ZnCkBAIC04LDcgKzgsNyBAQCBpbWFnZSBlZmkt
cGFydC52ZmF0IHsKIAkJfQogCX0KIAotCXNpemUgPSAzMk0KKwlzaXplID0gNjRNCiB9CiAKIGlt
YWdlIGRpc2suaW1nIHsKZGlmZiAtLWdpdCBhL2JvYXJkL2FhcmNoNjQtZWZpL3JlYWRtZS50eHQg
Yi9ib2FyZC9hYXJjaDY0LWVmaS9yZWFkbWUudHh0CmluZGV4IDE2NDk5M2VlYTQ5Li4wZTdlYTBi
NWRkNyAxMDA2NDQKLS0tIGEvYm9hcmQvYWFyY2g2NC1lZmkvcmVhZG1lLnR4dAorKysgYi9ib2Fy
ZC9hYXJjaDY0LWVmaS9yZWFkbWUudHh0CkBAIC00NSw3ICs0NSw3IEBAIHRoZSBpbnN0cnVjdGlv
bnMgaW4gWzNdLCB3aXRoIHFlbXVfYXJtNjRfZGVmY29uZmlnLgogCiBUaGlzIHNob3VsZCBnaXZl
IHlvdSBhIG5vcl9mbGFzaC5iaW4sIHdoaWNoIHlvdSBjYW4gdXNlIHdpdGggcWVtdSBhcyBhbgog
YWx0ZXJuYXRpdmUgdG8gUUVNVV9FRkkuZmQuIFlvdSB3aWxsIGFsc28gbmVlZCB0byBjaGFuZ2Ug
dGhlIG1hY2hpbmUKLXNwZWNpZmljYXRpb24gdG8gIi1NIHZpcnQsc2VjdXJlIiBvbiBxZW11IGNv
bW1hbmQgbGluZSwgdG8gZW5hYmxlIFRydXN0Wm9uZQorc3BlY2lmaWNhdGlvbiB0byAiLU0gdmly
dCxzZWN1cmU9b24iIG9uIHFlbXUgY29tbWFuZCBsaW5lLCB0byBlbmFibGUgVHJ1c3Rab25lCiBz
dXBwb3J0LCBhbmQgeW91IHdpbGwgbmVlZCB0byBpbmNyZWFzZSB0aGUgbWVtb3J5IHdpdGggIi1t
IDEwMjQiLgogCiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9BUk0tc29mdHdhcmUvZWJicgpkaWZm
IC0tZ2l0IGEvY29uZmlncy9hYXJjaDY0X2VmaV9kZWZjb25maWcgYi9jb25maWdzL2FhcmNoNjRf
ZWZpX2RlZmNvbmZpZwppbmRleCA2Y2I4ZDFmYWMyMS4uMWJkMDZjNTFmMzcgMTAwNjQ0Ci0tLSBh
L2NvbmZpZ3MvYWFyY2g2NF9lZmlfZGVmY29uZmlnCisrKyBiL2NvbmZpZ3MvYWFyY2g2NF9lZmlf
ZGVmY29uZmlnCkBAIC0yMiwxMyArMjIsMTMgQEAgQlIyX1RBUkdFVF9ST09URlNfRVhUMl9TSVpF
PSIyMDBNIgogQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvYWFyY2g2NC1lZmkv
cG9zdC1pbWFnZS5zaCBzdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2giCiBCUjJfUk9PVEZTX1BP
U1RfU0NSSVBUX0FSR1M9Ii1jIGJvYXJkL2FhcmNoNjQtZWZpL2dlbmltYWdlLWVmaS5jZmciCiAK
LSMgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbCwgYSA1LjExIHNlcmllcwotQlIyX1BBQ0tB
R0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzExPXkKKyMgTGludXggaGVhZGVycyBzYW1l
IGFzIGtlcm5lbCwgYSA1LjE1IHNlcmllcworQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJT
X0NVU1RPTV81XzE1PXkKIAogIyBLZXJuZWwKIEJSMl9MSU5VWF9LRVJORUw9eQogQlIyX0xJTlVY
X0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Ci1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9O
X1ZBTFVFPSI1LjExLjE2IgorQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0i
NS4xNS40IgogQlIyX0xJTlVYX0tFUk5FTF9VU0VfQVJDSF9ERUZBVUxUX0NPTkZJRz15CiBCUjJf
TElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15CiAKLS0gCjIuMzMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
