Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C96C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 10:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F8C88140F;
	Sun, 18 Dec 2022 10:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F8C88140F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1LkhAYbjZC1E; Sun, 18 Dec 2022 10:30:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C76248140B;
	Sun, 18 Dec 2022 10:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C76248140B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D87D1BF5A9
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 10:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35F0A8140B
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 10:30:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35F0A8140B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b8BDhzExmVAO for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 10:30:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DBC68140A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DBC68140A
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 10:30:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E425240004;
 Sun, 18 Dec 2022 10:30:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p6qwR-003XqA-VZ; Sun, 18 Dec 2022 11:30:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?K=C3=B6ry?= Maincent via buildroot <buildroot@buildroot.org>
References: <20221212085411.2405538-1-kory.maincent@bootlin.com>
Date: Sun, 18 Dec 2022 11:30:47 +0100
In-Reply-To: <20221212085411.2405538-1-kory.maincent@bootlin.com>
 (=?utf-8?Q?=22K=C3=B6ry?=
 Maincent via buildroot"'s message of "Mon, 12 Dec 2022 09:54:10
 +0100")
Message-ID: <87y1r5ovfs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/gcnano-binaries: bump version to
 6.4.9
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
Cc: =?utf-8?Q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>,
 Jens Kleintje <scooby22@web.de>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkvDtnJ5IiA9PSBLw7ZyeSBNYWluY2VudCB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RA
YnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gRnJvbTogS29yeSBNYWluY2VudCA8a29yeS5tYWlu
Y2VudEBib290bGluLmNvbT4KID4gVXBkYXRlIHRvIHRoZSBsYXRlc3QgdmVyc2lvbiBvZiB0aGUg
Z2NuYW5vLWJpbmFyaWVzIGJsb2JzLCB3aGljaCBhcmUKID4gY29tcGF0aWJsZSB3aXRoIHRoZSBs
YXN0IHY1LjE1LXN0bTMybXAtcjIga2VybmVsIGZyb20gdGhlCiA+IFNUTWljcm9lbGVjdHJvbmlj
cyBCU1AuCgogPiBTaWduZWQtb2ZmLWJ5OiBLb3J5IE1haW5jZW50IDxrb3J5Lm1haW5jZW50QGJv
b3RsaW4uY29tPgogPiAtLS0KID4gIHBhY2thZ2UvZ2NuYW5vLWJpbmFyaWVzL2djbmFuby1iaW5h
cmllcy5oYXNoIHwgIDIgKy0KID4gIHBhY2thZ2UvZ2NuYW5vLWJpbmFyaWVzL2djbmFuby1iaW5h
cmllcy5tayAgIHwgMzAgKysrKysrKystLS0tLS0tLS0tLS0KID4gIDIgZmlsZXMgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCgogPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9nY25hbm8tYmluYXJpZXMvZ2NuYW5vLWJpbmFyaWVzLmhhc2ggYi9wYWNrYWdlL2djbmFuby1i
aW5hcmllcy9nY25hbm8tYmluYXJpZXMuaGFzaAogPiBpbmRleCAxZWQ2NmUzNzUzLi43YmI5NDJl
NmRhIDEwMDY0NAogPiAtLS0gYS9wYWNrYWdlL2djbmFuby1iaW5hcmllcy9nY25hbm8tYmluYXJp
ZXMuaGFzaAogPiArKysgYi9wYWNrYWdlL2djbmFuby1iaW5hcmllcy9nY25hbm8tYmluYXJpZXMu
aGFzaAogPiBAQCAtMSwzICsxLDMgQEAKID4gICMgTG9jYWxseSBjYWxjdWxhdGVkCiA+IC1zaGEy
NTYgIGQzYWViYmM4N2NhMjdlNzQzZmRkMjFkNzEwMjVjZGYwNzYxYWY3NDg5MDdiYmRkN2IxOTMy
NjJlYjQ4YWIzYzcgIGdjbmFuby1iaW5hcmllcy1hMjA2MTE0MzRlZjA0OGQzZDBjMDRmNTViNmNk
N2Q3NWEyMTU2ZDQzLnRhci5negogPiArc2hhMjU2ICBiMTIyYTBjZDdhMWJkMmNlZThjNjExN2Iy
NTllZjk3N2E3NjVkMjRlNDg2NTVmNjM5Njk0Y2JlZjQ3MWRhOTliICBnY25hbm8tYmluYXJpZXMt
MGFjMWE4OWQ3YTU5ZDA0MGE2OTc0NWE4NWYwZGE3ZTk4NjQ0Y2M0Yi50YXIuZ3oKID4gIHNoYTI1
NiAgN2QyMDk3MTg0NzNkMThmNjlmNzVhZGI3Y2FmOWNiNWQ0YjBhMzFkYTA2ODc1NmFhMDExYmVh
NjE3ZGUzZGM1NyAgRVVMQQogPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nY25hbm8tYmluYXJpZXMv
Z2NuYW5vLWJpbmFyaWVzLm1rIGIvcGFja2FnZS9nY25hbm8tYmluYXJpZXMvZ2NuYW5vLWJpbmFy
aWVzLm1rCiA+IGluZGV4IGQ5YzQ3YmY2NGUuLjgzMjYxZjNiN2MgMTAwNjQ0CiA+IC0tLSBhL3Bh
Y2thZ2UvZ2NuYW5vLWJpbmFyaWVzL2djbmFuby1iaW5hcmllcy5tawogPiArKysgYi9wYWNrYWdl
L2djbmFuby1iaW5hcmllcy9nY25hbm8tYmluYXJpZXMubWsKID4gQEAgLTQsMTAgKzQsMTAgQEAK
ID4gICMKID4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKID4gLUdDTkFOT19CSU5BUklFU19M
SUJfVkVSU0lPTiA9IDYuNC43CiA+ICtHQ05BTk9fQklOQVJJRVNfTElCX1ZFUlNJT04gPSA2LjQu
OQogPiAgR0NOQU5PX0JJTkFSSUVTX0RSSVZFUl9WRVJTSU9OID0gJChHQ05BTk9fQklOQVJJRVNf
TElCX1ZFUlNJT04pCiA+IC1HQ05BTk9fQklOQVJJRVNfVVNFUkxBTkRfVkVSU0lPTiA9ICQoR0NO
QU5PX0JJTkFSSUVTX0xJQl9WRVJTSU9OKS0yMDIyMDUyNAogPiAtR0NOQU5PX0JJTkFSSUVTX1ZF
UlNJT04gPSBhMjA2MTE0MzRlZjA0OGQzZDBjMDRmNTViNmNkN2Q3NWEyMTU2ZDQzCiA+ICtHQ05B
Tk9fQklOQVJJRVNfVVNFUkxBTkRfVkVSU0lPTiA9ICQoR0NOQU5PX0JJTkFSSUVTX0xJQl9WRVJT
SU9OKS0yMDIyMTIwNgogPiArR0NOQU5PX0JJTkFSSUVTX1ZFUlNJT04gPSAwYWMxYTg5ZDdhNTlk
MDQwYTY5NzQ1YTg1ZjBkYTdlOTg2NDRjYzRiCiA+ICBHQ05BTk9fQklOQVJJRVNfU0lURSA9ICQo
Y2FsbCBnaXRodWIsU1RNaWNyb2VsZWN0cm9uaWNzLGdjbmFuby1iaW5hcmllcywkKEdDTkFOT19C
SU5BUklFU19WRVJTSU9OKSkKIAogPiAgR0NOQU5PX0JJTkFSSUVTX0xJQ0VOU0UgPSBNSVQsIFZp
dmFudGUgRW5kIFVzZXIgU29mdHdhcmUgTGljZW5zZSBUZXJtcwogPiBAQCAtMzgsMzEgKzM4LDI1
IEBAIEdDTkFOT19CSU5BUklFU19QT1NUX0VYVFJBQ1RfSE9PS1MgKz0gR0NOQU5PX0JJTkFSSUVT
X0VYVFJBQ1RfSEVMUEVSCiAKID4gIEdDTkFOT19CSU5BUklFU19NT0RVTEVfTUFLRV9PUFRTID0g
XAogPiAgCUtFUk5FTF9ESVI9JChMSU5VWF9ESVIpIFwKID4gLQlTT0NfUExBVEZPUk09c3Qtc3Qg
XAogPiArCVNPQ19QTEFURk9STT1zdC1tcDEgXAogPiAgCUFRUk9PVD0kKEBEKSBcCiA+ICAJREVC
VUc9MAogCiA+ICBHQ05BTk9fQklOQVJJRVNfVVNFUkxBTkRfU1VCRElSID0gZ2NuYW5vLXVzZXJs
YW5kLW11bHRpLSQoR0NOQU5PX0JJTkFSSUVTX1VTRVJMQU5EX1ZFUlNJT04pCiAKID4gLSMgVGhp
cyBjcmVhdGVzOgogPiAtIyAgIGxpYkdMRVN2Mi5zby4yICAgIC0+IGxpYkdMRVN2Mi5zbwogPiAt
IyAgIGxpYkdMRVN2MV9DTS5zby4xIC0+IGxpYkdMRVN2MV9DTS5zbwogPiAtIyBzeW1saW5rcywg
YXMgbW9zdCBPcGVuR0wgaW1wbGVtZW50YXRpb25zIGhhdmUgdGhlbSwgYW5kIHRoZXkgYXJlCiA+
IC0jIGV4cGVjdGVkIGJ5IHNvbWUgdXNlcnMgc3VjaCBhcyBsaWJlcG94eS4KID4gIGRlZmluZSBH
Q05BTk9fQklOQVJJRVNfSU5TVEFMTAogPiAgCWNkICQoQEQpLyQoR0NOQU5PX0JJTkFSSUVTX1VT
RVJMQU5EX1NVQkRJUikvcmVsZWFzZS9kcml2ZXJzLyA7IFwKID4gIAlmaW5kIC4gLXR5cGUgZiAt
ZXhlYyAkKElOU1RBTEwpIC1EIC1tIDA3NTUge30gJCgxKS91c3IvbGliL3t9IFw7IDsgXAogPiAt
CWZpbmQgLiAtdHlwZSBsIC1leGVjIGNwIC1hIHt9ICQoMSkvdXNyL2xpYiBcOwogPiAtCWxuIC1z
ZiBsaWJHTEVTdjIuc28gJCgxKS91c3IvbGliL2xpYkdMRVN2Mi5zby4yCiA+IC0JbG4gLXNmIGxp
YkdMRVN2MV9DTS5zbyAkKDEpL3Vzci9saWIvbGliR0xFU3YxX0NNLnNvLjEKCldoeSBhcmUgeW91
IHJlbW92aW5nIHRoaXM/IERvZXMgdXBzdHJlYW0gbm93IGhhdmUgdGhlc2Ugc3ltbGlua3M/IEEg
bW9yZQpkZXRhaWxlZCBjb21taXQgbWVzc2FnZSB3b3VsZCBiZSBnb29kIHNvIEkgZG9uJ3QgbmVl
ZCB0byByZXZlcnNlCmVuZ2luZWVyIGl0LgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
