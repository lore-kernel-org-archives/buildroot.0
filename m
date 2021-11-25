Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9413FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 10:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE4236077F;
	Thu, 25 Nov 2021 10:25:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id icYqIKBdOHWv; Thu, 25 Nov 2021 10:25:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35FB1606FD;
	Thu, 25 Nov 2021 10:25:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 911541BF331
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 10:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B5C7401F2
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 10:25:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A0FOc1JGdsNs for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 10:25:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23621400D5
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 10:25:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 216011042;
 Thu, 25 Nov 2021 02:25:46 -0800 (PST)
Received: from localhost.localdomain (C02TH0X6HF1T.nice.arm.com [10.34.124.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F1E53F5A1;
 Thu, 25 Nov 2021 02:25:45 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 11:24:41 +0100
Message-Id: <20211125102441.5351-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH next] configs/aarch64_efi: bump kernel version
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
cGRhdGUgdGhlIGluc3RydWN0aW9ucyB0byBydW4gb24gcWVtdSB3aXRoIGEgVS1Cb290IGJhc2Vk
IGZpcm13YXJlLgoKU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhs
ZUBhcm0uY29tPgpDYzogRXJpY28gTnVuZXMgPG51bmVzLmVyaWNvQGdtYWlsLmNvbT4KQ2M6IERp
Y2sgT2xzc29uIDxoaUBzZW56aWxsYS5pbz4KLS0tCgoKSGksCgpUaGlzIHdhcyAobGlnaHRseSkg
dGVzdGVkIG9uIHFlbXUgd2l0aCBib3RoIGVkazIgYW5kIFUtQm9vdFsxXSBmaXJtd2FyZSwgYXMg
d2VsbAphcyBvbiBST0NLUHJvNjQgd2l0aCBVLUJvb3QgZmlybXdhcmVbMl0uCgpCZXN0IHJlZ2Fy
ZHMsClZpbmNlbnQuCgpbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9nbGlrZWx5L3UtYm9vdC10ZmEt
YnVpbGQKWzJdOiBodHRwczovL2dpdGxhYi5hcm0uY29tL3N5c3RlbXJlYWR5L2Zpcm13YXJlLWJ1
aWxkL3JrMzM5OS1tYW5pZmVzdC8tL3RyZWUvcm9ja3BybzY0LTIxLjA5CgoKIGJvYXJkL2FhcmNo
NjQtZWZpL2dlbmltYWdlLWVmaS5jZmcgfCAyICstCiBib2FyZC9hYXJjaDY0LWVmaS9yZWFkbWUu
dHh0ICAgICAgIHwgMiArLQogY29uZmlncy9hYXJjaDY0X2VmaV9kZWZjb25maWcgICAgICB8IDYg
KysrLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9ib2FyZC9hYXJjaDY0LWVmaS9nZW5pbWFnZS1lZmkuY2ZnIGIvYm9hcmQv
YWFyY2g2NC1lZmkvZ2VuaW1hZ2UtZWZpLmNmZwppbmRleCA4ZWMxZjEwZmQ4Mi4uMTNkNjllNWU0
MjUgMTAwNjQ0Ci0tLSBhL2JvYXJkL2FhcmNoNjQtZWZpL2dlbmltYWdlLWVmaS5jZmcKKysrIGIv
Ym9hcmQvYWFyY2g2NC1lZmkvZ2VuaW1hZ2UtZWZpLmNmZwpAQCAtOCw3ICs4LDcgQEAgaW1hZ2Ug
ZWZpLXBhcnQudmZhdCB7CiAJCX0KIAl9CiAKLQlzaXplID0gMzJNCisJc2l6ZSA9IDY0TQogfQog
CiBpbWFnZSBkaXNrLmltZyB7CmRpZmYgLS1naXQgYS9ib2FyZC9hYXJjaDY0LWVmaS9yZWFkbWUu
dHh0IGIvYm9hcmQvYWFyY2g2NC1lZmkvcmVhZG1lLnR4dAppbmRleCAxNjQ5OTNlZWE0OS4uMGU3
ZWEwYjVkZDcgMTAwNjQ0Ci0tLSBhL2JvYXJkL2FhcmNoNjQtZWZpL3JlYWRtZS50eHQKKysrIGIv
Ym9hcmQvYWFyY2g2NC1lZmkvcmVhZG1lLnR4dApAQCAtNDUsNyArNDUsNyBAQCB0aGUgaW5zdHJ1
Y3Rpb25zIGluIFszXSwgd2l0aCBxZW11X2FybTY0X2RlZmNvbmZpZy4KIAogVGhpcyBzaG91bGQg
Z2l2ZSB5b3UgYSBub3JfZmxhc2guYmluLCB3aGljaCB5b3UgY2FuIHVzZSB3aXRoIHFlbXUgYXMg
YW4KIGFsdGVybmF0aXZlIHRvIFFFTVVfRUZJLmZkLiBZb3Ugd2lsbCBhbHNvIG5lZWQgdG8gY2hh
bmdlIHRoZSBtYWNoaW5lCi1zcGVjaWZpY2F0aW9uIHRvICItTSB2aXJ0LHNlY3VyZSIgb24gcWVt
dSBjb21tYW5kIGxpbmUsIHRvIGVuYWJsZSBUcnVzdFpvbmUKK3NwZWNpZmljYXRpb24gdG8gIi1N
IHZpcnQsc2VjdXJlPW9uIiBvbiBxZW11IGNvbW1hbmQgbGluZSwgdG8gZW5hYmxlIFRydXN0Wm9u
ZQogc3VwcG9ydCwgYW5kIHlvdSB3aWxsIG5lZWQgdG8gaW5jcmVhc2UgdGhlIG1lbW9yeSB3aXRo
ICItbSAxMDI0Ii4KIAogWzFdOiBodHRwczovL2dpdGh1Yi5jb20vQVJNLXNvZnR3YXJlL2ViYnIK
ZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYWFyY2g2NF9lZmlfZGVmY29uZmlnIGIvY29uZmlncy9hYXJj
aDY0X2VmaV9kZWZjb25maWcKaW5kZXggNmNiOGQxZmFjMjEuLjFiZDA2YzUxZjM3IDEwMDY0NAot
LS0gYS9jb25maWdzL2FhcmNoNjRfZWZpX2RlZmNvbmZpZworKysgYi9jb25maWdzL2FhcmNoNjRf
ZWZpX2RlZmNvbmZpZwpAQCAtMjIsMTMgKzIyLDEzIEBAIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJf
U0laRT0iMjAwTSIKIEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL2FhcmNoNjQt
ZWZpL3Bvc3QtaW1hZ2Uuc2ggc3VwcG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoIgogQlIyX1JPT1RG
U19QT1NUX1NDUklQVF9BUkdTPSItYyBib2FyZC9hYXJjaDY0LWVmaS9nZW5pbWFnZS1lZmkuY2Zn
IgogCi0jIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJuZWwsIGEgNS4xMSBzZXJpZXMKLUJSMl9Q
QUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV8xMT15CisjIExpbnV4IGhlYWRlcnMg
c2FtZSBhcyBrZXJuZWwsIGEgNS4xNSBzZXJpZXMKK0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVB
REVSU19DVVNUT01fNV8xNT15CiAKICMgS2VybmVsCiBCUjJfTElOVVhfS0VSTkVMPXkKIEJSMl9M
SU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQotQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVS
U0lPTl9WQUxVRT0iNS4xMS4xNiIKK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFM
VUU9IjUuMTUuNCIKIEJSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQog
QlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5TU0w9eQogCi0tIAoyLjMzLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
