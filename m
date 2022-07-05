Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD09C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 09:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5827640A1D;
	Tue,  5 Jul 2022 09:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5827640A1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id akAE1r1atVRb; Tue,  5 Jul 2022 09:59:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 480D140396;
	Tue,  5 Jul 2022 09:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 480D140396
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 296631BF20B
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 09:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 041A582FC9
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 09:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 041A582FC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iIBZAih4ztcJ for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 09:59:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D23F82CF9
Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D23F82CF9
 for <buildroot@busybox.net>; Tue,  5 Jul 2022 09:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.desaster-games.net (Postfix) with ESMTP id D4D0420005;
 Tue,  5 Jul 2022 11:59:19 +0200 (CEST)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
 by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5f8OxRfIPD0z; Tue,  5 Jul 2022 11:59:06 +0200 (CEST)
Received: from linux-es2v.suse.de (unknown [81.95.8.244])
 by mail.desaster-games.net (Postfix) with ESMTPSA id 7D8DB20006;
 Tue,  5 Jul 2022 11:54:18 +0200 (CEST)
From: Michael Vetter <jubalh@iodoru.org>
To: buildroot@busybox.net
Date: Tue,  5 Jul 2022 11:54:17 +0200
Message-Id: <20220705095417.12765-1-jubalh@iodoru.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libstrophe: bump to version 0.12.1
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
Cc: Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmVtb3ZlIHVwc3RyZWFtZWQgcGF0Y2ggMDAwMS1maXgtc3NpemVfdC5wYXRjaAoKU2lnbmVkLW9m
Zi1ieTogTWljaGFlbCBWZXR0ZXIgPGp1YmFsaEBpb2RvcnUub3JnPgotLS0KIHBhY2thZ2UvbGli
c3Ryb3BoZS8wMDAxLWZpeC1zc2l6ZV90LnBhdGNoIHwgNDkgLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KIHBhY2thZ2UvbGlic3Ryb3BoZS9saWJzdHJvcGhlLmhhc2ggICAgICAgIHwgIDIgKy0KIHBh
Y2thZ2UvbGlic3Ryb3BoZS9saWJzdHJvcGhlLm1rICAgICAgICAgIHwgIDIgKy0KIDMgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1MSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL2xpYnN0cm9waGUvMDAwMS1maXgtc3NpemVfdC5wYXRjaAoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbGlic3Ryb3BoZS8wMDAxLWZpeC1zc2l6ZV90LnBhdGNoIGIvcGFja2FnZS9s
aWJzdHJvcGhlLzAwMDEtZml4LXNzaXplX3QucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDM5YjQ1NmRlNTcuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9saWJzdHJvcGhlLzAw
MDEtZml4LXNzaXplX3QucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0OSArMCwwIEBACi1Gcm9t
IGYzMWVmOWMzNWM5YmJhODMxNTEwNzc3ZDU1MWM0MTc5Mjk1YjIwOGYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCi1Gcm9tOiBNaWNoYWVsIFZldHRlciA8anViYWxoQGlvZG9ydS5vcmc+Ci1EYXRl
OiBNb24sIDMwIE1heSAyMDIyIDE0OjQ3OjQ0ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIEluY2x1
ZGUgc3lzL3R5cGVzLmggZm9yIHNzaXplX3QKLU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5
cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6
IDhiaXQKLQotV2hlbiBjb21waWxpbmcgb24gYnVpbGRyb290IEkgZ2V0OgotYHNyYy90bHMuYzoy
MzU6Mjg6IGVycm9yOiDigJhzc2l6ZV904oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlz
Ci1mdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhzaXplX3TigJk/IGAKLQotVG8gaGF2ZSB0aGlz
IFBPU0lYIHR5cGUgYXZhaWxhYmxlIHdlIHdpbGwgbmVlZCB0byBpbmNsdWRlCi1gc3lzL3R5cGVz
LmhgIG9uIExpbnV4LiBVbnN1cmUgYWJvdXQgb3RoZXIgc3lzdGVtcy4KLQotVXBzdHJlYW06IGh0
dHBzOi8vZ2l0aHViLmNvbS9zdHJvcGhlL2xpYnN0cm9waGUvcHVsbC8yMDcKLVNpZ25lZC1vZmYt
Ynk6IE1pY2hhZWwgVmV0dGVyIDxqdWJhbGhAaW9kb3J1Lm9yZz4KLS0tLQotIHNyYy9yYW5kLmMg
fCAxICsKLSBzcmMvdGxzLmMgIHwgNCArKysrCi0gMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKykKLQotZGlmZiAtLWdpdCBhL3NyYy9yYW5kLmMgYi9zcmMvcmFuZC5jCi1pbmRleCAwNjFl
ODVlZS4uMjVlNDYxNGEgMTAwNjQ0Ci0tLS0gYS9zcmMvcmFuZC5jCi0rKysgYi9zcmMvcmFuZC5j
Ci1AQCAtMjgsNiArMjgsNyBAQAotICNpZiBfX0dMSUJDX1BSRVJFUSgyLCAyNSkKLSAjZGVmaW5l
IFVTRV9HRVRSQU5ET00KLSAjaW5jbHVkZSA8c3lzL3JhbmRvbS5oPgotKyNpbmNsdWRlIDxzeXMv
dHlwZXMuaD4KLSAjaW5jbHVkZSA8ZXJybm8uaD4KLSAjZW5kaWYKLSAjZW5kaWYKLWRpZmYgLS1n
aXQgYS9zcmMvdGxzLmMgYi9zcmMvdGxzLmMKLWluZGV4IDE3ZDg1ZGRhLi41NDc0NmJhYSAxMDA2
NDQKLS0tLSBhL3NyYy90bHMuYwotKysrIGIvc3JjL3Rscy5jCi1AQCAtMjEsNiArMjEsMTAgQEAK
LSAjaW5jbHVkZSA8c3RkYXJnLmg+Ci0gI2luY2x1ZGUgPHN0cmluZy5oPgotIAotKyNpZiBkZWZp
bmVkKF9fbGludXhfXykKLSsjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Ci0rI2VuZGlmCi0rCi0gI2lu
Y2x1ZGUgInN0cm9waGUuaCIKLSAKLSAjaW5jbHVkZSAiY29tbW9uLmgiCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2xpYnN0cm9waGUvbGlic3Ryb3BoZS5oYXNoIGIvcGFja2FnZS9saWJzdHJvcGhlL2xp
YnN0cm9waGUuaGFzaAppbmRleCA2NmZmMGU3ZTdlLi5mYTkxNDhlZDBmIDEwMDY0NAotLS0gYS9w
YWNrYWdlL2xpYnN0cm9waGUvbGlic3Ryb3BoZS5oYXNoCisrKyBiL3BhY2thZ2UvbGlic3Ryb3Bo
ZS9saWJzdHJvcGhlLmhhc2gKQEAgLTEsNCArMSw0IEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAot
c2hhMjU2ICA4ZTQ0YWNiMjYwMTg4MTZmOTg1NjYyNmJkNWZmOTI0YTM2Y2M2MTJkMmIzNzQ3ZWU2
MzRkNjI2MzI2YjcyZGY3ICBsaWJzdHJvcGhlLTAuMTIuMC50YXIueHoKK3NoYTI1NiAgNWRhMGE0
ZTEyZTM4MzM5MzYxNDM3NmY4YjQ3ZjhiOTE3MDNjOGZjNWE1NjRhYWNmYzlkYjZiOThkNmE2YTli
ZiAgbGlic3Ryb3BoZS0wLjEyLjEudGFyLnh6CiBzaGEyNTYgIDgyNDc2ZjM2ZmZkNWU4OTVhMTc2
MDEzYzA4MTIxNjZiYTdiN2Q5OWYzZDUzNmZjN2Y1ZWQyZTMzZTlmNzRhMDggIE1JVC1MSUNFTlNF
LnR4dAogc2hhMjU2ICA4Y2ViNGI5ZWU1YWRlZGRlNDdiMzFlOTc1YzFkOTBjNzNhZDI3YjZiMTY1
YTFkY2Q4MGM3YzU0NWViNjViOTAzICBHUEwtTElDRU5TRS50eHQKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGlic3Ryb3BoZS9saWJzdHJvcGhlLm1rIGIvcGFja2FnZS9saWJzdHJvcGhlL2xpYnN0cm9w
aGUubWsKaW5kZXggZjQ4ZDA3Mzc3MC4uY2U5OWM5ZmU0OCAxMDA2NDQKLS0tIGEvcGFja2FnZS9s
aWJzdHJvcGhlL2xpYnN0cm9waGUubWsKKysrIGIvcGFja2FnZS9saWJzdHJvcGhlL2xpYnN0cm9w
aGUubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1MSUJT
VFJPUEhFX1ZFUlNJT04gPSAwLjEyLjAKK0xJQlNUUk9QSEVfVkVSU0lPTiA9IDAuMTIuMQogTElC
U1RST1BIRV9TT1VSQ0UgPSBsaWJzdHJvcGhlLSQoTElCU1RST1BIRV9WRVJTSU9OKS50YXIueHoK
IExJQlNUUk9QSEVfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9zdHJvcGhlL2xpYnN0cm9waGUv
cmVsZWFzZXMvZG93bmxvYWQvJChMSUJTVFJPUEhFX1ZFUlNJT04pCiBMSUJTVFJPUEhFX0RFUEVO
REVOQ0lFUyA9IGhvc3QtcGtnY29uZgotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
