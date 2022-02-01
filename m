Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586E0C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 17:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2BD54162B;
	Tue,  1 Feb 2022 17:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VjRHvGtTIwpA; Tue,  1 Feb 2022 17:07:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1DF741624;
	Tue,  1 Feb 2022 17:07:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC4281BF4E2
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4BF982861
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:06:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mwo5n5JlHR4M for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 17:06:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D700827FD
 for <buildroot@busybox.net>; Tue,  1 Feb 2022 17:06:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [91.172.110.41])
 (Authenticated sender: julien.boibessot@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 4136419F4F8;
 Tue,  1 Feb 2022 18:06:50 +0100 (CET)
From: julien.boibessot@armadeus.com
To: buildroot@busybox.net
Date: Tue,  1 Feb 2022 18:06:47 +0100
Message-Id: <20220201170647.109298-1-julien.boibessot@armadeus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ltris: bump version to 1.2.3
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
Cc: fontaine.fabrice@gmail.com,
 Julien BOIBESSOT <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogSnVsaWVuIEJPSUJFU1NPVCA8anVsaWVuLmJvaWJlc3NvdEBhcm1hZGV1cy5jb20+Cgow
MDAxLWZpeC1idWlsZC13aXRoLWdjYy00LjgucGF0Y2ggd2FzIGludGVncmF0ZWQgbWFpbmxpbmUg
YW5kIGNyb3NzLWNvbXBpbGF0aW9uCnNsaWdodGx5IGNoYW5nZWQuCi0tLQogLi4uL2x0cmlzLzAw
MDEtZml4LWJ1aWxkLXdpdGgtZ2NjLTQuOC5wYXRjaCAgIHwgMjAgLS0tLS0tLS0tLS0tLS0tLS0t
LQogcGFja2FnZS9sdHJpcy9sdHJpcy5oYXNoICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKyst
LQogcGFja2FnZS9sdHJpcy9sdHJpcy5tayAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKyst
LQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbHRyaXMvMDAwMS1maXgtYnVpbGQtd2l0aC1nY2MtNC44
LnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdHJpcy8wMDAxLWZpeC1idWlsZC13aXRoLWdj
Yy00LjgucGF0Y2ggYi9wYWNrYWdlL2x0cmlzLzAwMDEtZml4LWJ1aWxkLXdpdGgtZ2NjLTQuOC5w
YXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZDZiYmY2YTk0Ni4uMDAwMDAwMDAw
MAotLS0gYS9wYWNrYWdlL2x0cmlzLzAwMDEtZml4LWJ1aWxkLXdpdGgtZ2NjLTQuOC5wYXRjaAor
KysgL2Rldi9udWxsCkBAIC0xLDIwICswLDAgQEAKLUZpeCBidWlsZCB3aXRoIGdjYyA0LjgKLQot
U2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5j
b20+Ci1bVXBzdHJlYW0gc3RhdHVzOiBodHRwczovL3NvdXJjZWZvcmdlLm5ldC9wL2xnYW1lcy9w
YXRjaGVzLzI4XQotSW5kZXg6IGx0cmlzL3NyYy9ib3dsLmMKLT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBsdHJp
cy9zcmMvYm93bC5jCShyw6l2aXNpb24gNDIxKQotKysrIGx0cmlzL3NyYy9ib3dsLmMJKGNvcGll
IGRlIHRyYXZhaWwpCi1AQCAtODI4LDkgKzgyOCwxMCBAQAotICovCi0gdm9pZCBib3dsX2luaXRf
YmxvY2tfbWFza3MoKSAKLSB7Ci0rCWludCBpOwotIAlpbnQgbWFza3NpemUgPSBzaXplb2YoYmxv
Y2tfbWFza3NbMF0ubWFzayk7IC8vIHNhbWUgZm9yIGFsbAotIAotLQlmb3IgKGludCBpID0gMDsg
aSA8IDc7IGkrKykgewotKwlmb3IgKGkgPSAwOyBpIDwgNzsgaSsrKSB7Ci0gCQlibG9ja19tYXNr
c1tpXS5yeCA9IDI7Ci0gCQlibG9ja19tYXNrc1tpXS5yeSA9IDI7Ci0gCQltZW1zZXQoYmxvY2tf
bWFza3NbaV0ubWFzaywgMCwgbWFza3NpemUgKTsKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHRyaXMv
bHRyaXMuaGFzaCBiL3BhY2thZ2UvbHRyaXMvbHRyaXMuaGFzaAppbmRleCBmNjk2ZTNhZjE3Li4y
MGYzNDM0MmZmIDEwMDY0NAotLS0gYS9wYWNrYWdlL2x0cmlzL2x0cmlzLmhhc2gKKysrIGIvcGFj
a2FnZS9sdHJpcy9sdHJpcy5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNvbXB1dGVk
Ogotc2hhMjU2ICBhN2JjNmM1ZmM2NTM5Yjg4NTA1MDc3YTFiNDU4MGVkYzliMTc5Y2UwYTZiODI5
YzU4ZmJkOTQxNmNmNDU2MTk1ICBsdHJpcy0xLjIudGFyLmd6Ci1zaGEyNTYgIDY3ZjgyZTA0NWNm
N2FjZmVmODUzZWEwZjQyNjU3NWE4MzU5MTYxYTBhMzI1ZTE5ZjAyYjUyOWE4N2M0YjZjMzQgIENP
UFlJTkcKK3NoYTI1NgkwZWM0YWQwNTNlMDY2YTI5NjUyOWU5MjNjMmY2MjZmYTBhMTljMDk0YzVh
ZTAzZTQ0MzU5ZjljOWU1MDk1NWE4ICBsdHJpcy0xLjIuMy50YXIuZ3oKK3NoYTI1Ngk2N2Y4MmUw
NDVjZjdhY2ZlZjg1M2VhMGY0MjY1NzVhODM1OTE2MWEwYTMyNWUxOWYwMmI1MjlhODdjNGI2YzM0
ICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL2x0cmlzL2x0cmlzLm1rIGIvcGFja2FnZS9s
dHJpcy9sdHJpcy5tawppbmRleCA5YjU5NjEzNDE3Li42ZTM3YmRiZDE5IDEwMDY0NAotLS0gYS9w
YWNrYWdlL2x0cmlzL2x0cmlzLm1rCisrKyBiL3BhY2thZ2UvbHRyaXMvbHRyaXMubWsKQEAgLTUs
NyArNSw3IEBACiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCiBMVFJJU19TSVRFID0gaHR0cDov
L2Rvd25sb2Fkcy5zb3VyY2Vmb3JnZS5uZXQvbGdhbWVzL2x0cmlzCi1MVFJJU19WRVJTSU9OID0g
MS4yCitMVFJJU19WRVJTSU9OID0gMS4yLjMKIExUUklTX0xJQ0VOU0UgPSBHUEwtMi4wKwogTFRS
SVNfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKIApAQCAtMTMsNyArMTMsNyBAQCBMVFJJU19ERVBF
TkRFTkNJRVMgPSBzZGwgJChUQVJHRVRfTkxTX0RFUEVOREVOQ0lFUykKIExUUklTX0xJQlMgPSAk
KFRBUkdFVF9OTFNfTElCUykKIAogTFRSSVNfQ09ORl9FTlYgPSBcCi0JU0RMX0NPTkZJRz0iJChT
VEFHSU5HX0RJUikvdXNyL2Jpbi9zZGwtY29uZmlnIiBcCisJUEFUSD0iJChQQVRIKTokKFNUQUdJ
TkdfRElSKS91c3IvYmluIiBcCiAJTElCUz0iJChMVFJJU19MSUJTKSIKIAogaWZlcSAoJChCUjJf
UEFDS0FHRV9MVFJJU19BVURJTykseSkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
