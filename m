Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682DBC433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 13:00:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3885610D1
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 13:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3885610D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4886E40348;
	Fri, 15 Oct 2021 13:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KY1zLY0L3Vo7; Fri, 15 Oct 2021 13:00:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56CF2402EF;
	Fri, 15 Oct 2021 13:00:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41DF41BF20D
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 12:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CBF24021E
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 12:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P-b05jvL1EOj for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 12:59:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31594401F4
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 12:59:54 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E23641BF215;
 Fri, 15 Oct 2021 12:59:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mbMoP-0002m7-Th; Fri, 15 Oct 2021 14:59:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 14:59:43 +0200
Message-Id: <20211015125944.10587-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211015125944.10587-1-peter@korsgaard.com>
References: <20211015125944.10587-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/docker-engine: security bump to
 version 20.10.9
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBzZWN1cml0eSBpc3N1ZXM6CgotIENWRS0yMDIxLTQxMDg5OiAg
Q3JlYXRlIHBhcmVudCBkaXJlY3RvcmllcyBpbnNpZGUgYSBjaHJvb3QgZHVyaW5nIGRvY2tlcgog
IGNwIHRvIHByZXZlbnQgYSBzcGVjaWFsbHkgY3JhZnRlZCBjb250YWluZXIgZnJvbSBjaGFuZ2lu
ZyBwZXJtaXNzaW9ucyBvZgogIGV4aXN0aW5nIGZpbGVzIGluIHRoZSBob3N04oCZcyBmaWxlc3lz
dGVtLgoKLSBDVkUtMjAyMS00MTA5MTogTG9jayBkb3duIGZpbGUgcGVybWlzc2lvbnMgdG8gcHJl
dmVudCB1bnByaXZpbGVnZWQgdXNlcnMKICBmcm9tIGRpc2NvdmVyaW5nIGFuZCBleGVjdXRpbmcg
cHJvZ3JhbXMgaW4gL3Zhci9saWIvZG9ja2VyLgoKU2lnbmVkLW9mZi1ieTogUGV0ZXIgS29yc2dh
YXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgotLS0KIHBhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2Nr
ZXItZW5naW5lLmhhc2ggfCAyICstCiBwYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2VyLWVuZ2lu
ZS5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUu
aGFzaCBiL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLmhhc2gKaW5kZXggMDdh
Y2I4Nzg2NC4uNWUxNTg0Mjg1OSAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2Rv
Y2tlci1lbmdpbmUuaGFzaAorKysgYi9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2VyLWVuZ2lu
ZS5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgMjUw
NWQwMDAzMmY1ZDQwZWFkNWFjNzc5YzI4NDAzMDNkY2VhZDA0NzEzYzkzYmE5NzRiZTRjMTliM2Fi
OGQwYSAgZG9ja2VyLWVuZ2luZS0yMC4xMC44LnRhci5negorc2hhMjU2ICAzNTllODg1NGQwZDUx
YmM4ODRkNDM0ZjE4MmY2NGNhNjJmMjVmYmJlN2I5YzZhMzM2ZWIwOWYyMTJmZThjYzlhICBkb2Nr
ZXItZW5naW5lLTIwLjEwLjkudGFyLmd6CiBzaGEyNTYgIDdjODc4NzMyOTFmMjg5NzEzYWM1ZGY0
OGIxZjIwMTBlYjY5NjM3NTJiYmQ2YjUzMDQxNmFiOTlmYzM3OTE0YTggIExJQ0VOU0UKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLm1rIGIvcGFja2FnZS9k
b2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKaW5kZXggN2QzMzhhNWMwYy4uODQzNjZkOTMz
NCAxMDA2NDQKLS0tIGEvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKKysr
IGIvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsKQEAgLTQsNyArNCw3IEBA
CiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1ET0NLRVJfRU5HSU5FX1ZFUlNJT04gPSAy
MC4xMC44CitET0NLRVJfRU5HSU5FX1ZFUlNJT04gPSAyMC4xMC45CiBET0NLRVJfRU5HSU5FX1NJ
VEUgPSAkKGNhbGwgZ2l0aHViLG1vYnksbW9ieSx2JChET0NLRVJfRU5HSU5FX1ZFUlNJT04pKQog
CiBET0NLRVJfRU5HSU5FX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
