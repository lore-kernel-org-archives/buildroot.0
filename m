Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9EEC43334
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 18:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4961483E58;
	Sun, 12 Jun 2022 18:17:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AAEO09nFKzoK; Sun, 12 Jun 2022 18:17:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59A5F8329D;
	Sun, 12 Jun 2022 18:17:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F9041BF2B6
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 18:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D878417A7
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 18:17:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yYYCe8efPUfb for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 18:17:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE217414C3
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 18:17:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id DA4451820C3; Sun, 12 Jun 2022 20:17:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1655057857; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=/9W/qjd/Dtx1AT8mYqfakTrZiDHXseTcWMXLpddhM90=;
 b=Xp/PMep2h2sSBqNSjTNATFAq7CDbEWVH6zwEL0b3HVGbICcsozTjlncnEfMXL7Zuma6OdP
 C143wxCGktLUEgaOXmPfTRkYaqgSzJMrxhe0V67Gc9NmJXL3WuRCrRpJIq8lnAP4BZfZ/E
 S0XMvog4dX8FOiVAPTSyz2MofaY0Dz8=
Date: Sun, 12 Jun 2022 20:17:36 +0200
To: "Adrian Perez de Castro" <aperez@igalia.com>
MIME-Version: 1.0
Message-ID: <e3864-62a62e00-1-ca226d@26922715>
User-Agent: SOGoMail 5.6.0
X-Last-TLS-Session-Version: None
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/1=5D_package/wpewebkit=3A__bump?=
 =?utf-8?q?_to_version_2=2E36=2E2?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: =?utf-8?q?Andr=C3=A9_Zwing?= <nerv@dawncrow.de>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWRyaWFuLAoKT24gU2F0dXJkYXksIEp1bmUgMTEsIDIwMjIgMDI6MDYgQ0VTVCwgQWRyaWFu
IFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+IHdyb3RlOgoKPiAKPiBUaGUgcGF0
Y2ggSSBhbSB3b3JraW5nIG9uIHN0aWxsIG5lZWRzIGEgYml0IG9mIHdvcmsgWzFdLCBidXQgaW4g
aXRzCj4gY3VycmVudCBzdGF0dXMgaXQgY2FuIGFscmVhZHkgYmUgdXNlZC4gSSBhbSBhdHRhY2hp
bmcgYSB2ZXJzaW9uIG9mIGl0Cj4gdGhhdCB3aWxsIGFwcGx5IGNsZWFubHkgb24gdG9wIG9mIHRo
ZSAyLjM2LjMgcmVsZWFzZSwgd2hpY2ggeW91IGNhbgo+IGRyb3AgaW50byB0aGUgcGFja2FnZS93
cGV3ZWJraXQvIHN1YmRpcmVjdG9yeSBvZiB0aGUgQnVpbGRyb290IHRyZWUuCj4gCnRoYW5rcyBm
b3IgdGhlIHBhdGNoCgo+IEkgaG9wZSB0aGlzIGhlbHBzLAoKdGhlIG9sZCBlcnJvciBpcyBnb25l
IGJ1dCB1bmZvcnR1bmF0ZWx5IGEgbmV3IGJ1aWxkIGVycm9yIGlzIG5vdyBvY2N1cmluZzoKCklu
IGZpbGUgaW5jbHVkZWQgZnJvbSBwbGF0Zm9ybS9ncmFwaGljcy9maWx0ZXJzL3NvZnR3YXJlL0ZF
TGlnaHRpbmdTb2Z0d2FyZUFwcGxpZXIuaDoxNTUsCiAgICAgICAgICAgICAgICAgZnJvbSAuL3Bs
YXRmb3JtL2dyYXBoaWNzL2ZpbHRlcnMvRkVMaWdodGluZy5jcHA6MzEsCiAgICAgICAgICAgICAg
ICAgZnJvbSAuLi8uLi9XZWJDb3JlL0Rlcml2ZWRTb3VyY2VzL3VuaWZpZWQtc291cmNlcy9Vbmlm
aWVkU291cmNlLTNjNzJhYmJlLTM4LmNwcDozOgpwbGF0Zm9ybS9ncmFwaGljcy9jcHUvYXJtL2Zp
bHRlcnMvRkVMaWdodGluZ05FT04uaDogSW4gc3RhdGljIG1lbWJlciBmdW5jdGlvbiDigJhzdGF0
aWMgdm9pZCBXZWJDb3JlOjpGRUxpZ2h0aW5nU29mdHdhcmVBcHBsaWVyOjphcHBseVBsYXRmb3Jt
TmVvbihjb25zdCBXZWJDb3JlOjpGRUxpZ2h0aW5nU29mdHdhcmVBcHBsaWVyOjpMaWdodGluZ0Rh
dGEmLCBjb25zdCBXZWJDb3JlOjpMaWdodFNvdXJjZTo6UGFpbnRpbmdEYXRhJinigJk6CnBsYXRm
b3JtL2dyYXBoaWNzL2NwdS9hcm0vZmlsdGVycy9GRUxpZ2h0aW5nTkVPTi5oOjk5OjQ2OiB3YXJu
aW5nOiBhdHRyaWJ1dGUgaWdub3JlZCBbLVdhdHRyaWJ1dGVzXQogICA5OSB8ICAgICBXZWJDb3Jl
OjpGRUxpZ2h0aW5nRmxvYXRBcmd1bWVudHNGb3JOZW9uIGFsaWduYXMoMTYpIGZsb2F0QXJndW1l
bnRzOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn4KcGxhdGZvcm0vZ3JhcGhpY3MvY3B1L2FybS9maWx0ZXJzL0ZFTGlnaHRpbmdORU9O
Lmg6OTk6NDY6IG5vdGU6IGFuIGF0dHJpYnV0ZSB0aGF0IGFwcGVydGFpbnMgdG8gYSB0eXBlLXNw
ZWNpZmllciBpcyBpZ25vcmVkCnBsYXRmb3JtL2dyYXBoaWNzL2NwdS9hcm0vZmlsdGVycy9GRUxp
Z2h0aW5nTkVPTi5oOjEwMToyMjogZXJyb3I6IOKAmEpTQzo6VWludDhDbGFtcGVkQXJyYXnigJkg
e2FrYSDigJhjbGFzcyBKU0M6OkdlbmVyaWNUeXBlZEFycmF5VmlldzxKU0M6OlVpbnQ4Q2xhbXBl
ZEFkYXB0b3I+4oCZfSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmGJ5dGVz4oCZCiAgMTAxIHwgICAg
ICAgICBkYXRhLnBpeGVscy0+Ynl0ZXMoKSwKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICBe
fn5+fgptYWtlWzRdOiAqKiogW1NvdXJjZS9XZWJDb3JlL0NNYWtlRmlsZXMvV2ViQ29yZS5kaXIv
YnVpbGQubWFrZTo5NDU1OiBTb3VyY2UvV2ViQ29yZS9DTWFrZUZpbGVzL1dlYkNvcmUuZGlyL19f
L19fL1dlYkNvcmUvRGVyaXZlZFNvdXJjZXMvdW5pZmllZC1zb3VyY2VzL1VuaWZpZWRTb3VyY2Ut
M2M3MmFiYmUtMzguY3BwLm9dIEVycm9yIDEKbWFrZVs0XTogKioqIFdhaXRpbmcgZm9yIHVuZmlu
aXNoZWQgam9icy4uLi4KCihJIGp1c3Qgc2F3IHRoYXQgQW5kcmUgYWxyZWFkeSBtZW50aW9uZWQg
dGhhdCBvbiB0aGUgZ2l0aHViIFBSKQoKZnVydGhlciB0aGUgZXJyb3IgcmVxdWlyaW5nIHRvIHN0
YXJ0IHRoZSBidWlsZCB0d2ljZSBpcyBzdGlsbCB0aGVyZToKCm1ha2VbNF06ICoqKiBObyBydWxl
IHRvIG1ha2UgdGFyZ2V0ICdTb3VyY2UvSmF2YVNjcmlwdENvcmUvQ01ha2VGaWxlcy9Mb3dMZXZl
bEludGVycHJldGVyTGliLmRpci9sbGludC9Mb3dMZXZlbEludGVycHJldGVyLmNwcC5vJywgbmVl
ZGVkIGJ5ICdiaW4vanNjJy4gIFN0b3AuCgpUZXN0ZWQgd2l0aCBteSBsb2NhbCBjb25maWcgKHdo
aWNoIHVzZXMgdGhlIGxhdGVzdCBUSSBTR1ggZHJpdmVyIGZvciBBTTU0eHggd2hpY2ggaXMgbm90
IHBhcnQgb2YgYnVpbGRyb290KSBhcyB3ZWxsCmFzIHRoZSByYXNwYmVycnkgcGkgNCBkZWZjb25m
aWcgaSBzZW50IGJlZm9yZS4KClJlZ2FyZHMsCk1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
