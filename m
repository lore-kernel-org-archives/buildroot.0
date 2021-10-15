Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22ADC433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 16:26:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3560B61181
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 16:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3560B61181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3CAE60EEA;
	Fri, 15 Oct 2021 16:26:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EbzQKawu4Vl7; Fri, 15 Oct 2021 16:26:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2664B60AF6;
	Fri, 15 Oct 2021 16:26:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8AD21BF8B4
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 16:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 965AA4059F
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 16:26:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTlaTn4UiEHO for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 16:26:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39989400BB
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 16:26:42 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout07.t-online.de (Postfix) with SMTP id E85D213064;
 Fri, 15 Oct 2021 18:26:15 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.199.253]) by fwd79.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mbQ29-441K410; Fri, 15 Oct 2021 18:26:13 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:35138)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mbQ28-0004oS-Rg;
 Fri, 15 Oct 2021 18:26:13 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 18:26:12 +0200
Message-Id: <20211015162612.1662548-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1634315173-0000146E-6C975665/0/0 CLEAN NORMAL
X-TOI-MSGID: f4252f88-166f-4064-ae24-66c4a0ce6228
Subject: [Buildroot] [PATCH v2 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 21.2.4
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIG5ldyBjcm9jdXMgZ2FsbGl1bSBkcml2ZXI6Cmh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5v
cmcvbWVzYS9tZXNhL2NvbW1pdC8/aWQ9ZjM2MzA1NDhmMWRhOTA0ZWM2YzYzYjQzZWNlN2U2OGFm
ZGI4ODY3ZQoKQWRkIHBhdGNoIHRvIGZpeCBidWlsZCBlcnJvci4KClNpZ25lZC1vZmYtYnk6IEJl
cm5kIEt1aGxzIDxiZXJuZC5rdWhsc0B0LW9ubGluZS5kZT4KLS0tCnYyOiBBZGQgcGF0Y2ggdG8g
Zml4IGJ1aWxkIGVycm9yCgogcGFja2FnZS9tZXNhM2QtaGVhZGVycy9tZXNhM2QtaGVhZGVycy5t
ayAgICB8ICAyICstCiBwYWNrYWdlL21lc2EzZC8wMDA2LWZpeC1jcHAtZGV0ZWN0aW9uLnBhdGNo
IHwgMjMgKysrKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL21lc2EzZC9Db25maWcuaW4gICAg
ICAgICAgICAgICAgICAgIHwgIDcgKysrKysrKwogcGFja2FnZS9tZXNhM2QvbWVzYTNkLmhhc2gg
ICAgICAgICAgICAgICAgICB8ICA2ICsrKy0tLQogcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rICAg
ICAgICAgICAgICAgICAgICB8ICAzICsrLQogNSBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbWVzYTNkLzAw
MDYtZml4LWNwcC1kZXRlY3Rpb24ucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC1o
ZWFkZXJzL21lc2EzZC1oZWFkZXJzLm1rIGIvcGFja2FnZS9tZXNhM2QtaGVhZGVycy9tZXNhM2Qt
aGVhZGVycy5tawppbmRleCAyMzMyOTJhYjBhLi4yMDQ4ZDJjYTAzIDEwMDY0NAotLS0gYS9wYWNr
YWdlL21lc2EzZC1oZWFkZXJzL21lc2EzZC1oZWFkZXJzLm1rCisrKyBiL3BhY2thZ2UvbWVzYTNk
LWhlYWRlcnMvbWVzYTNkLWhlYWRlcnMubWsKQEAgLTEyLDcgKzEyLDcgQEAgZW5kaWYKIAogIyBO
b3QgcG9zc2libGUgdG8gZGlyZWN0bHkgcmVmZXIgdG8gbWVzYTNkIHZhcmlhYmxlcywgYmVjYXVz
ZSBvZgogIyBmaXJzdC9zZWNvbmQgZXhwYW5zaW9uIHRyaWNrZXJ5Li4uCi1NRVNBM0RfSEVBREVS
U19WRVJTSU9OID0gMjEuMS44CitNRVNBM0RfSEVBREVSU19WRVJTSU9OID0gMjEuMi40CiBNRVNB
M0RfSEVBREVSU19TT1VSQ0UgPSBtZXNhLSQoTUVTQTNEX0hFQURFUlNfVkVSU0lPTikudGFyLnh6
CiBNRVNBM0RfSEVBREVSU19TSVRFID0gaHR0cHM6Ly9hcmNoaXZlLm1lc2EzZC5vcmcKIE1FU0Ez
RF9IRUFERVJTX0RMX1NVQkRJUiA9IG1lc2EzZApkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNhM2Qv
MDAwNi1maXgtY3BwLWRldGVjdGlvbi5wYXRjaCBiL3BhY2thZ2UvbWVzYTNkLzAwMDYtZml4LWNw
cC1kZXRlY3Rpb24ucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4u
N2U3OGVlZjFkZAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbWVzYTNkLzAwMDYtZml4LWNw
cC1kZXRlY3Rpb24ucGF0Y2gKQEAgLTAsMCArMSwyMyBAQAorRml4IGMrKyBkZXRlY3Rpb24KKwor
Rml4ZXMgYnVpbGQgZXJyb3I6CisKKy4uL3NyYy9lZ2wvbWFpbi9lZ2xkaXNwbGF5LmM6IEluIGZ1
bmN0aW9uIOKAmF9lZ2xHZXROYXRpdmVQbGF0Zm9ybUZyb21FbnbigJk6CisuLi9zcmMvZWdsL21h
aW4vZWdsZGlzcGxheS5jOjkzOjQ6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5j
dGlvbgorIOKAmHN0YXRpY19hc3NlcnTigJkgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVj
bGFyYXRpb25dCisgICA5MyB8ICAgIHN0YXRpY19hc3NlcnQoQVJSQVlfU0laRShlZ2xfcGxhdGZv
cm1zKSA9PSBfRUdMX05VTV9QTEFURk9STVMsCisKK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxz
IDxiZXJuZC5rdWhsc0B0LW9ubGluZS5kZT4KKworZGlmZiAtdU5yIG1lc2EtMjEuMi4wLXJjMS5v
cmlnL2luY2x1ZGUvYzExX2NvbXBhdC5oIG1lc2EtMjEuMi4wLXJjMS9pbmNsdWRlL2MxMV9jb21w
YXQuaAorLS0tIG1lc2EtMjEuMi4wLXJjMS5vcmlnL2luY2x1ZGUvYzExX2NvbXBhdC5oCTIwMjEt
MDctMTQgMjA6Mjk6MDcuMzE3ODg5NzAwICswMjAwCisrKysgbWVzYS0yMS4yLjAtcmMxL2luY2x1
ZGUvYzExX2NvbXBhdC5oCTIwMjEtMDctMTggMTY6MzM6NDYuNjYzNzIzNjIxICswMjAwCitAQCAt
OCw4ICs4LDYgQEAKKyAKKyAjaWYgZGVmaW5lZChfX2NwbHVzcGx1cykKKyAgICAvKiBUaGlzIGlz
IEMrKyBjb2RlLCBub3QgQyAqLworLSNlbGlmIChfX1NURENfVkVSU0lPTl9fID49IDIwMTExMkwp
CistICAgLyogQWxyZWFkeSBDMTEgKi8KKyAjZWxzZQorIAorIApkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9tZXNhM2QvQ29uZmlnLmluIGIvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCmluZGV4IDgyYTQw
NTExZjEuLjE3NDNiODVmNzAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgor
KysgYi9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KQEAgLTk3LDYgKzk3LDEzIEBAIGNvbmZpZyBC
UjJfUEFDS0FHRV9NRVNBM0RfTkVFRFNfWDExCiAKIGNvbW1lbnQgIkdhbGxpdW0gZHJpdmVycyIK
IAorY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9DUk9DVVMKKwlib29s
ICJHYWxsaXVtIGNyb2N1cyBkcml2ZXIiCisJZGVwZW5kcyBvbiBCUjJfaTM4NiB8fCBCUjJfeDg2
XzY0CisJc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUgorCWhlbHAKKwkg
IE1lc2EgZHJpdmVyIGZvciBnZW40LTcgSW50ZWwgR1BVcy4KKwogY29uZmlnIEJSMl9QQUNLQUdF
X01FU0EzRF9HQUxMSVVNX0RSSVZFUl9FVE5BVklWCiAJYm9vbCAiR2FsbGl1bSBFdG5hdml2IGRy
aXZlciIKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QuaGFzaCBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5o
YXNoCmluZGV4IDI2MTc2Yjg1YjcuLjA1ZmI5OWNiYmUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWVz
YTNkL21lc2EzZC5oYXNoCisrKyBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5oYXNoCkBAIC0xLDYg
KzEsNiBAQAotIyBGcm9tIGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL21l
c2EtYW5ub3VuY2UvMjAyMS1TZXB0ZW1iZXIvMDAwNjQ0Lmh0bWwKLXNoYTI1NiAgNWNkMzJmNWQw
ODlkY2E3NTMwMDU3OGEzZDc3MWE2NTZlYWVkNjUyMDkwNTczYTI2NTVmZTRlNzAyMmQ1NmJmYyAg
bWVzYS0yMS4xLjgudGFyLnh6Ci1zaGE1MTIgIDgwZmNmMmIxZDU5YjQ5ZTM4NGU5YWExYWU2M2Ez
Y2U3MDk4MzMwNTlhZjFmZmQ4ZWI4MjEwNTRjMTk3NjcwOTEzNDA5OGNmYzc5ZmFjMTU3OGEyZjA4
YTAwMzIyM2YxYzk2YjM4ZTJlNjUwYzViZTQ5ODIxYzZmMmZlMTA0N2FmICBtZXNhLTIxLjEuOC50
YXIueHoKKyMgRnJvbSBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9tZXNh
LWFubm91bmNlLzIwMjEtT2N0b2Jlci8wMDA2NDguaHRtbAorc2hhMjU2ICBmZTZlZGU4MmQxYWMw
MjMzOWRhM2MyZWMxODIwYTM3OTY0MTkwMmZkMzUxYTUyY2MwMTE1M2Y3NmVmZjg1YjQ0ICBtZXNh
LTIxLjIuNC50YXIueHoKK3NoYTUxMiAgMjQ1OTE1MjYwYjEzNjZiZWVkMTVkNDc5MGUwOWQwNTAz
NTI2MTRkYWFlYTJlZDA1MjEyOGQ1NGYyNmRkYTIwMmQ3YWJmMTI1YjlmYTUwOThlZjc3NjA0YjE4
OTc3YjBjZTQyMDlkZjUxNzQ2ZDEyMzg3MWViZjg3MDhmNzQyNWQgIG1lc2EtMjEuMi40LnRhci54
egogCiAjIExpY2Vuc2UKIHNoYTI1NiAgOTk4NDM3ZjNmNzVmMGM1NDIwNDZmODNjMWNiMzQ5NDA4
MTIyMjY4MTY4ZmIxM2ViNGFlNjk2N2FhMThiN2Q5OCAgZG9jcy9saWNlbnNlLnJzdApkaWZmIC0t
Z2l0IGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rIGIvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1r
CmluZGV4IGRjNjNkOGM5ZjQuLjIxNzI2NTcwNDAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWVzYTNk
L21lc2EzZC5taworKysgYi9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKQEAgLTUsNyArNSw3IEBA
CiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCiAjIFdoZW4gdXBkYXRpbmcgdGhlIHZlcnNpb24s
IHBsZWFzZSBhbHNvIHVwZGF0ZSBtZXNhM2QtaGVhZGVycwotTUVTQTNEX1ZFUlNJT04gPSAyMS4x
LjgKK01FU0EzRF9WRVJTSU9OID0gMjEuMi40CiBNRVNBM0RfU09VUkNFID0gbWVzYS0kKE1FU0Ez
RF9WRVJTSU9OKS50YXIueHoKIE1FU0EzRF9TSVRFID0gaHR0cHM6Ly9hcmNoaXZlLm1lc2EzZC5v
cmcKIE1FU0EzRF9MSUNFTlNFID0gTUlULCBTR0ksIEtocm9ub3MKQEAgLTg1LDYgKzg1LDcgQEAg
ZW5kaWYKICMgRHJpdmVycwogCiAjR2FsbGl1bSBEcml2ZXJzCitNRVNBM0RfR0FMTElVTV9EUklW
RVJTLSQoQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX0NST0NVUykgICArPSBjcm9j
dXMKIE1FU0EzRF9HQUxMSVVNX0RSSVZFUlMtJChCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9E
UklWRVJfRVROQVZJVikgICs9IGV0bmF2aXYKIE1FU0EzRF9HQUxMSVVNX0RSSVZFUlMtJChCUjJf
UEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfRlJFRURSRU5PKSArPSBmcmVlZHJlbm8KIE1F
U0EzRF9HQUxMSVVNX0RSSVZFUlMtJChCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJf
STkxNSkgICAgICs9IGk5MTUKLS0gCjIuMzAuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
