Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D56C4321E
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 18:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93C4B607C1;
	Thu,  1 Dec 2022 18:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93C4B607C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVGb5kJCyLG2; Thu,  1 Dec 2022 18:34:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACBBA610F6;
	Thu,  1 Dec 2022 18:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACBBA610F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B7481BF286
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 18:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 272B9812DE
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 18:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 272B9812DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Erd9d7TmTCg for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 18:33:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7681B812DC
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7681B812DC
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 18:33:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CAF2ED1;
 Thu,  1 Dec 2022 10:33:57 -0800 (PST)
Received: from localhost.localdomain (unknown [10.57.6.188])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 408BE3F73B;
 Thu,  1 Dec 2022 10:33:50 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Thu,  1 Dec 2022 19:33:35 +0100
Message-Id: <20221201183337.1588407-2-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221201183337.1588407-1-vincent.stehle@arm.com>
References: <20221201183337.1588407-1-vincent.stehle@arm.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3 next] package/edk2-platforms: bump in sync
 with edk2-stable202208
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
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVtcCB0aGUgZWRrMi1wbGF0Zm9ybXMgY29tbWl0IHRvIHRoZSBvbmUgY29ycmVzcG9uZGluZyB0
byB2ZXJzaW9uCmVkazItc3RhYmxlMjAyMjA4IG9mIGVkazIsIGJhc2VkIG9uIHRoZSB0aW1lc3Rh
bXBzLgoKTm90ZTogdGhlIE1hcnZlbGwgQXJtYWRhIERldmljZXRyZWUgZmlsZXMgaGF2ZSBiZWVu
IG1vdmVkIG91dCBvZgplZGsyLXBsYXRmb3JtcyBieSBjb21taXQgNGI1M2RhNmIxMmE4ICgiTWFy
dmVsbC9Bcm1hZGE3azhrOiBSZW1vdmUgZGV2aWNlCnRyZWUgc291cmNlcyBmcm9tIGVkazItcGxh
dGZvcm1zIikgYW5kIHRoZXkgYXJlIG5vdyBpbiBlZGsyLW5vbi1vc2kuCgpTaWduZWQtb2ZmLWJ5
OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CkNjOiBEaWNrIE9sc3Nv
biA8aGlAc2VuemlsbGEuaW8+Ci0tLQoKVGhpcyBpcyBmb3IgdGhlIGBuZXh0JyBicmFuY2gsIHBs
ZWFzZS4KCiBwYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1zLmhhc2ggfCAyICst
CiBwYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1zLm1rICAgfCAyICstCiAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9wYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1zLmhhc2ggYi9wYWNrYWdlL2Vk
azItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1zLmhhc2gKaW5kZXggMzBhZTIzNTA3OGQuLjQwNWEw
OTI0MWNkIDEwMDY0NAotLS0gYS9wYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1z
Lmhhc2gKKysrIGIvcGFja2FnZS9lZGsyLXBsYXRmb3Jtcy9lZGsyLXBsYXRmb3Jtcy5oYXNoCkBA
IC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgZGZkYzM0ZmVhODZl
NTAzN2EzYTZjYmQyYTgzYjFmNjU1ZjE2YjRjOWFiNGY1ZmY5ZGE5MWU0NWEzNThjOWExNCAgZWRr
Mi1wbGF0Zm9ybXMtZGI5MjJlMTI1M2NiNmYxZmM0NTY4MDViYzQyZmI3ZDQwMWVlZDVjMi50YXIu
Z3oKK3NoYTI1NiAgMWVkM2YzNjlhMjc0M2NjNWE1ZmE0ODA0ZDBhZjE1NGUzN2I1NzhmNGU2OGMy
ZTdmNjk3MzQ3MDFhOWI4NzRkYiAgZWRrMi1wbGF0Zm9ybXMtM2MzYjExNjgwMTcwNzNjMmJiMmQ5
NzMzNmM1OTI5ZWJhZTgwNWJlMS50YXIuZ3oKIHNoYTI1NiAgNTBjZTIwYzljZmRiMGUxOWVlMzRm
ZTBhNTFmYzBhZmU5NjFmNzQzNjk3YjA2ODM1OWFiMmY4NjJiNDk0ZGY4MCAgTGljZW5zZS50eHQK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvZWRrMi1wbGF0Zm9ybXMvZWRrMi1wbGF0Zm9ybXMubWsgYi9w
YWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1zLm1rCmluZGV4IDdkZTU5YzFhZmNj
Li44OTg5MzdhNWFiNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9lZGsyLXBsYXRmb3Jtcy9lZGsyLXBs
YXRmb3Jtcy5taworKysgYi9wYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZvcm1zLm1r
CkBAIC01LDcgKzUsNyBAQAogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAogIyBLZWVwIGluIHN5
bmMgd2l0aCBsYXRlc3QgY29tbWl0IGFzIG9mIHRoZSByZWxlYXNlIGRhdGUgZm9yIGJvb3QvZWRr
MgotRURLMl9QTEFURk9STVNfVkVSU0lPTiA9IGRiOTIyZTEyNTNjYjZmMWZjNDU2ODA1YmM0MmZi
N2Q0MDFlZWQ1YzIKK0VESzJfUExBVEZPUk1TX1ZFUlNJT04gPSAzYzNiMTE2ODAxNzA3M2MyYmIy
ZDk3MzM2YzU5MjllYmFlODA1YmUxCiBFREsyX1BMQVRGT1JNU19TSVRFID0gJChjYWxsIGdpdGh1
Yix0aWFub2NvcmUsZWRrMi1wbGF0Zm9ybXMsJChFREsyX1BMQVRGT1JNU19WRVJTSU9OKSkKIEVE
SzJfUExBVEZPUk1TX0xJQ0VOU0UgPSBCU0QtMi1DbGF1c2UKIEVESzJfUExBVEZPUk1TX0xJQ0VO
U0VfRklMRVMgPSBMaWNlbnNlLnR4dAotLSAKMi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
