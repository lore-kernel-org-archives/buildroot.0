Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70ED6C4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 14:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA5F960BA3;
	Sun, 20 Nov 2022 14:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA5F960BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NNA9mZht7tWC; Sun, 20 Nov 2022 14:17:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F037C60B0F;
	Sun, 20 Nov 2022 14:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F037C60B0F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A25A1BF317
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 14:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D93ED60B0F
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 14:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D93ED60B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LghC8ZSMXmUZ for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 14:17:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 579AD60B0E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 579AD60B0E
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 14:17:26 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 795B4240006;
 Sun, 20 Nov 2022 14:17:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1owl8M-004U5G-6M; Sun, 20 Nov 2022 15:17:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Nov 2022 15:17:20 +0100
Message-Id: <20221120141721.1068907-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.28.0
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXN0ZXJpc2sgMTYuMjYuMCBmaXhlZCB0aGUgZm9sbG93aW5nIHNlY3VyaXR5IGlzc3VlczoKCi0g
W0FTVEVSSVNLLTI5NDc2XSDigJMgcmVzX3N0aXJfc2hha2VuOiBCbGluZCBTU1JGIHZ1bG5lcmFi
aWxpdGllcwogIGh0dHBzOi8vaXNzdWVzLmFzdGVyaXNrLm9yZy9qaXJhL2Jyb3dzZS9BU1RFUklT
Sy0yOTQ3NgoKLSBbQVNURVJJU0stMjk4MzhdIOKAkyAke1NRTF9FU0MoKX0gbm90IGNvcnJlY3Rs
eSBlc2NhcGluZyBhIHRlcm1pbmF0aW5nIFwKICBodHRwczovL2lzc3Vlcy5hc3Rlcmlzay5vcmcv
amlyYS9icm93c2UvQVNURVJJU0stMjk4MzgKCi0gW0FTVEVSSVNLLTI5ODcyXSDigJMgcmVzX3N0
aXJfc2hha2VuOiBSZXNvdXJjZSBleGhhdXN0aW9uIHdpdGggbGFyZ2UgZmlsZXMKICBodHRwczov
L2lzc3Vlcy5hc3Rlcmlzay5vcmcvamlyYS9icm93c2UvQVNURVJJU0stMjk4NzIKCmh0dHBzOi8v
d3d3LmFzdGVyaXNrLm9yZy9hc3Rlcmlzay1uZXdzL2FzdGVyaXNrLTE2LTI2LTAtbm93LWF2YWls
YWJsZS8KCkl0IHVuZm9ydHVuYXRlbHkgYWxzbyBpbnRyb2R1Y2VkIGEgY2hhbmdlIHRvIGNoYW5f
aWF4MiwgYnJlYWtpbmcgYnVpbGRzCndpdGhvdXQgT3BlblNTTDoKaHR0cHM6Ly9naXRodWIuY29t
L2FzdGVyaXNrL2FzdGVyaXNrL2NvbW1pdC81OWE4Y2RhY2EyZGJiNWVlYjczODJkZmJlNzhjMGMx
Y2JlZDhjZTZkCgpXaGljaCB3YXMgYWdhaW4gZml4ZWQgaW4gMTYuMjguMDoKaHR0cHM6Ly9naXRo
dWIuY29tL2FzdGVyaXNrL2FzdGVyaXNrL2NvbW1pdC9mODEyZGZiNjhjNmVkN2FlNTViNGMxNjM3
MTZmZDFkZGMwNjNmZjU0CgpTbyBidW1wIHRvIDE2LjI4LjA6Cmh0dHBzOi8vd3d3LmFzdGVyaXNr
Lm9yZy9hc3Rlcmlzay1uZXdzL2FzdGVyaXNrLTE2LTI4LTAtbm93LWF2YWlsYWJsZS8KClRoZSBs
aWJ4bWwyIHN1cHBvcnQgbm93IHVzZXMgcGtnLWNvbmZpZywgc28gZHJvcCB0aGUgbGlieG1sMi1j
b25maWcgaGFuZGxpbmc6Cmh0dHBzOi8vZ2l0aHViLmNvbS9hc3Rlcmlzay9hc3Rlcmlzay9jb21t
aXQvYmY5ZGFmYTdjMjIzMDJiMmYxYTEyYjgyMTZkYTYzMTAyMTE2ZDljOQoKU2lnbmVkLW9mZi1i
eTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgotLS0KIHBhY2thZ2UvYXN0
ZXJpc2svYXN0ZXJpc2suaGFzaCB8IDIgKy0KIHBhY2thZ2UvYXN0ZXJpc2svYXN0ZXJpc2subWsg
ICB8IDcgKystLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9hc3Rlcmlzay9hc3Rlcmlzay5oYXNoIGIvcGFj
a2FnZS9hc3Rlcmlzay9hc3Rlcmlzay5oYXNoCmluZGV4IDg4MGQ2NzU2MmQuLjk3OTJkODJhYzUg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYXN0ZXJpc2svYXN0ZXJpc2suaGFzaAorKysgYi9wYWNrYWdl
L2FzdGVyaXNrL2FzdGVyaXNrLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIExvY2FsbHkgY29tcHV0
ZWQKLXNoYTI1NiAgMGZiODE3OTQzYTI3NmY1ZTU0MGMyYTk0MzJlODg0MWNkMzM5M2U3YzFiZDEy
NTAwNTVjNjIwOTAyZjZlYWZjOCAgYXN0ZXJpc2stMTYuMjUuMi50YXIuZ3oKK3NoYTI1NiAgNmU5
YzJmMzUwZGIwMThkZjg1NGIxMzAxNjg3Y2VkODk5M2ZhY2IyNzg3Njk4MzM2ZTU1Y2QxOWUwYWUz
ZWJmZSAgYXN0ZXJpc2stMTYuMjguMC50YXIuZ3oKIAogIyBzaGExIGZyb206IGh0dHA6Ly9kb3du
bG9hZHMuYXN0ZXJpc2sub3JnL3B1Yi90ZWxlcGhvbnkvc291bmRzL3JlbGVhc2VzCiAjIHNoYTI1
NiBsb2NhbGx5IGNvbXB1dGVkCmRpZmYgLS1naXQgYS9wYWNrYWdlL2FzdGVyaXNrL2FzdGVyaXNr
Lm1rIGIvcGFja2FnZS9hc3Rlcmlzay9hc3Rlcmlzay5tawppbmRleCA5YjU5OTk3YjgwLi4xODRm
NDAwMzFmIDEwMDY0NAotLS0gYS9wYWNrYWdlL2FzdGVyaXNrL2FzdGVyaXNrLm1rCisrKyBiL3Bh
Y2thZ2UvYXN0ZXJpc2svYXN0ZXJpc2subWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwogCi1BU1RFUklTS19WRVJTSU9OID0gMTYuMjUuMgorQVNURVJJU0tfVkVS
U0lPTiA9IDE2LjI4LjAKICMgVXNlIHRoZSBnaXRodWIgbWlycm9yOiBpdCdzIGFuIG9mZmljaWFs
IG1pcnJvciBtYWludGFpbmVkIGJ5IERpZ2l1bSwgYW5kCiAjIHByb3ZpZGVzIHRhcmJhbGxzLCB3
aGljaCB0aGUgbWFpbiBBc3RlcmlzayBnaXQgdHJlZSAoYmVoaW5kIEdlcnJpdCkgZG9lcyBub3Qu
CiBBU1RFUklTS19TSVRFID0gJChjYWxsIGdpdGh1Yixhc3Rlcmlzayxhc3RlcmlzaywkKEFTVEVS
SVNLX1ZFUlNJT04pKQpAQCAtMTE1LDggKzExNSw3IEBAIEFTVEVSSVNLX0NPTkZfT1BUUyArPSAt
LXdpdGhvdXQtYXZjb2RlYwogQVNURVJJU0tfQ09ORl9PUFRTICs9IC0td2l0aG91dC1zcGFuZHNw
CiAKIEFTVEVSSVNLX0NPTkZfRU5WID0gXAotCWFjX2N2X2ZpbGVfYnJpZGdlc19icmlkZ2Vfc29m
dG1peF9pbmNsdWRlX2hyaXJzX2g9dHJ1ZSBcCi0JYWNfY3ZfcGF0aF9DT05GSUdfTElCWE1MMj0k
KFNUQUdJTkdfRElSKS91c3IvYmluL3htbDItY29uZmlnCisJYWNfY3ZfZmlsZV9icmlkZ2VzX2Jy
aWRnZV9zb2Z0bWl4X2luY2x1ZGVfaHJpcnNfaD10cnVlCiAKICMgVXNlcyBfX2F0b21pY19mZXRj
aF9hZGRfNAogaWZlcSAoJChCUjJfVE9PTENIQUlOX0hBU19MSUJBVE9NSUMpLHkpCkBAIC0zMTQs
OCArMzEzLDYgQEAgSE9TVF9BU1RFUklTS19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwogIyBzbyBk
byBub3QgaW5oZXJpdCB0aGUgdGFyZ2V0IHNldHVwLgogSE9TVF9BU1RFUklTS19BVVRPUkVDT05G
ID0gTk8KIAotSE9TVF9BU1RFUklTS19DT05GX0VOViA9IENPTkZJR19MSUJYTUwyPSQoSE9TVF9E
SVIpL2Jpbi94bWwyLWNvbmZpZwotCiBIT1NUX0FTVEVSSVNLX0NPTkZfT1BUUyA9IFwKIAktLXdp
dGhvdXQtbmV3dCBcCiAJLS13aXRob3V0LWN1cnNlcyBcCi0tIAoyLjMwLjIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
