Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8EBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 16:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7D8784762;
	Thu, 17 Mar 2022 16:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2yuj1CTdtcoR; Thu, 17 Mar 2022 16:56:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7CC884756;
	Thu, 17 Mar 2022 16:56:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D1391BF350
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 16:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28AB34011B
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 16:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UUyKZdy4Ou_4 for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 16:55:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA99640017
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 16:55:47 +0000 (UTC)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 2DDBBC2497
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 16:38:50 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 56BD1240007;
 Thu, 17 Mar 2022 16:38:44 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 17:38:22 +0100
Message-Id: <20220317163823.2913753-2-foss+buildroot@0leil.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220317163823.2913753-1-foss+buildroot@0leil.net>
References: <20220317163823.2913753-1-foss+buildroot@0leil.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/qt5/qt5base: remove leftover patch
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
Cc: Quentin Schulz <foss+buildroot@0leil.net>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogUXVlbnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QHRoZW9icm9tYS1zeXN0ZW1zLmNv
bT4KCkNWRS0yMDIxLTM4NTkzIGZpeGVzIG9yaWdpbmFsbHkgbWlzc2VkIGEgdXNlY2FzZSB0aGF0
IHdhcyBjb3ZlcmVkIGJ5IHRoZQp0by1iZS1yZW1vdmVkIHBhdGNoLiBIb3dldmVyLCB0aGlzIHBh
dGNoIHdhcyBpbmNvcnJlY3QgYW5kIGFkZGVkIHNvbWUKaXNzdWVzIG9uIGl0cyBvd24sIHdoaWNo
IHdhcyB0aGVuIGZpeGVkIGJ5IG5vdy1yZW1vdmVkCjAwMTItUmVmaXgtZm9yLWF2b2lkaW5nLWh1
Z2UtbnVtYmVyLW9mLXRpbnktZGFzaGVzLnBhdGNoLgoKVW5mb3J0dW5hdGVseSBmb3IgdXMsIHRo
ZSB0by1iZS1yZW1vdmVkIHBhdGNoIChmaXhlZCBieQowMDEyLVJlZml4LWZvci1hdm9pZGluZy1o
dWdlLW51bWJlci1vZi10aW55LWRhc2hlcy5wYXRjaCkgY2FuIGFjdHVhbGx5CmJlIGFwcGxpZWQg
KHdpdGggZnV6ejsgYnkgYHBhdGNoYCBvbmx5KSBvbiB0b3Agb2YgdGhlIG5vdy1yZW1vdmVkIHBh
dGNoLgpXaGVuIHRoZSBtb3ZlIHRvIEtERSBRdCBmb3JrIHdhcyBtYWRlLCBzb21lIHBhdGNoZXMg
d2VyZSByZW1vdmVkIGFzIHRoZXkKd2VyZSBhbHJlYWR5IHBhcnQgb2YgdGhlIG5ldyBnaXQgZm9y
ay4gSG93ZXZlciwgdGhlIHRvLWJlLXJlbW92ZWQgcGF0Y2gKd2FzIG5vdC4gVGhpcyBtZWFucyB0
aGUKMDAxMi1SZWZpeC1mb3ItYXZvaWRpbmctaHVnZS1udW1iZXItb2YtdGlueS1kYXNoZXMucGF0
Y2ggd2FzIGFjdHVhbGx5CnVuZG9uZSB3aGVuIEJ1aWxkcm9vdCBwYXRjaGVkIHF0NWJhc2UuCgpM
ZXQncyByZW1vdmUgdGhpcyBwYXRjaCB0byBmaXggdGhpcyBvdmVyc2lnaHQuCgpBcyBhIHJlZmVy
ZW5jZToKZTdlYTJlZDI3YyBJbXByb3ZlIGZpeCBmb3IgYXZvaWRpbmcgaHVnZSBudW1iZXIgb2Yg
dGlueSBkYXNoZXMKZml4ZWQgYnkKNjViM2FhNmExYyBSZWZpeCBmb3IgYXZvaWRpbmcgaHVnZSBu
dW1iZXIgb2YgdGlueSBkYXNoZXMKaW4gdGhlIGdpdCByZXBvLgoKRml4ZXM6IDU3NzBhNjQ1YTNh
NDkgInBhY2thZ2UvcXQ1OiBidW1wIHBhY2thZ2VzIHRvIGxhdGVzdCBrZGUgc3VibW9kdWxlIHZl
cnNpb25zIgpDYzogUXVlbnRpbiBTY2h1bHogPGZvc3MrYnVpbGRyb290QDBsZWlsLm5ldD4KU2ln
bmVkLW9mZi1ieTogUXVlbnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QHRoZW9icm9tYS1zeXN0
ZW1zLmNvbT4KLS0tCiAuLi4tYXZvaWRpbmctaHVnZS1udW1iZXItb2YtdGlueS1kYXNoZXMucGF0
Y2ggfCAzNyAtLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzcgZGVsZXRpb25z
KC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9xdDUvcXQ1YmFzZS8wMDA2LUltcHJvdmUt
Zml4LWZvci1hdm9pZGluZy1odWdlLW51bWJlci1vZi10aW55LWRhc2hlcy5wYXRjaAoKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcXQ1L3F0NWJhc2UvMDAwNi1JbXByb3ZlLWZpeC1mb3ItYXZvaWRpbmct
aHVnZS1udW1iZXItb2YtdGlueS1kYXNoZXMucGF0Y2ggYi9wYWNrYWdlL3F0NS9xdDViYXNlLzAw
MDYtSW1wcm92ZS1maXgtZm9yLWF2b2lkaW5nLWh1Z2UtbnVtYmVyLW9mLXRpbnktZGFzaGVzLnBh
dGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAxNmUwZjIwMjAwLi4wMDAwMDAwMDAw
Ci0tLSBhL3BhY2thZ2UvcXQ1L3F0NWJhc2UvMDAwNi1JbXByb3ZlLWZpeC1mb3ItYXZvaWRpbmct
aHVnZS1udW1iZXItb2YtdGlueS1kYXNoZXMucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNyAr
MCwwIEBACi1Gcm9tIDg1NmQxMWY2OTVmYjZlZmZlMjZhMzU5ZjlhZDBlZmRmMjQwNjcwODUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBFaXJpayBBYXZpdHNsYW5kIDxlaXJpay5hYXZp
dHNsYW5kQHF0LmlvPgotRGF0ZTogRnJpLCAyMyBKdWwgMjAyMSAxNTo1Mzo1NiArMDIwMAotU3Vi
amVjdDogW1BBVENIXSBJbXByb3ZlIGZpeCBmb3IgYXZvaWRpbmcgaHVnZSBudW1iZXIgb2YgdGlu
eSBkYXNoZXMKLU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNo
YXJzZXQ9VVRGLTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKLQotU29tZSBwYXRo
b2xvZ2ljYWwgY2FzZXMgd2VyZSBub3QgY2F1Z2h0IGJ5IHRoZSBwcmV2aW91cyBmaXguCi0KLUZp
eGVzOiBRVEJVRy05NTIzOQotUGljay10bzogNi4yIDYuMSA1LjE1Ci1DaGFuZ2UtSWQ6IEkwMzM3
ZWUzOTIzZmY5M2NjYjM2YzRkN2I4MTBhOWMwNjY3MzU0Y2M1Ci1SZXZpZXdlZC1ieTogUm9iZXJ0
IEzDtmhuaW5nIDxyb2JlcnQubG9laG5pbmdAcXQuaW8+Ci0oY2hlcnJ5IHBpY2tlZCBmcm9tIGNv
bW1pdCA2YjQwMGUzMTQ3ZGNmZDhjYzNhMzkzYWNlMWJkMTE4YzkzNzYyZTBjKQotW1JldHJpZXZl
ZCBmcm9tOiBodHRwczovL2ludmVudC5rZGUub3JnL3F0L3F0L3F0YmFzZS8tL2NvbW1pdC9mZWQ1
NzEzZWViYTViZjhlMGVlNDEzY2I0ZTc3MTA5YmZhN2MyYmNlXQotU2lnbmVkLW9mZi1ieTogUXVl
bnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QHRoZW9icm9tYS1zeXN0ZW1zLmNvbT4KLS0tLQot
IHNyYy9ndWkvcGFpbnRpbmcvcXBhaW50ZW5naW5lZXguY3BwIHwgMiArLQotIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvc3JjL2d1
aS9wYWludGluZy9xcGFpbnRlbmdpbmVleC5jcHAgYi9zcmMvZ3VpL3BhaW50aW5nL3FwYWludGVu
Z2luZWV4LmNwcAotaW5kZXggNTVmZGIwYzJhMC4uMTllNGIyMzQyMyAxMDA2NDQKLS0tLSBhL3Ny
Yy9ndWkvcGFpbnRpbmcvcXBhaW50ZW5naW5lZXguY3BwCi0rKysgYi9zcmMvZ3VpL3BhaW50aW5n
L3FwYWludGVuZ2luZWV4LmNwcAotQEAgLTQyNiw3ICs0MjYsNyBAQCB2b2lkIFFQYWludEVuZ2lu
ZUV4OjpzdHJva2UoY29uc3QgUVZlY3RvclBhdGggJnBhdGgsIGNvbnN0IFFQZW4gJmluUGVuKQot
ICAgICAgICAgICAgIHBhdHRlcm5MZW5ndGggKj0gcGVuLndpZHRoRigpOwotICAgICAgICAgaWYg
KHFGdXp6eUlzTnVsbChwYXR0ZXJuTGVuZ3RoKSkgewotICAgICAgICAgICAgIHBlbi5zZXRTdHls
ZShRdDo6Tm9QZW4pOwotLSAgICAgICAgfSBlbHNlIGlmIChleHRlbnQgLyBwYXR0ZXJuTGVuZ3Ro
ID4gMTAwMDApIHsKLSsgICAgICAgIH0gZWxzZSBpZiAocUZ1enp5SXNOdWxsKGV4dGVudCkgfHwg
ZXh0ZW50IC8gcGF0dGVybkxlbmd0aCA+IDEwMDAwKSB7Ci0gICAgICAgICAgICAgLy8gYXBwcm94
aW1hdGUgc3RyZWFtIG9mIHRpbnkgZGFzaGVzIHdpdGggc2VtaS10cmFuc3BhcmVudCBzb2xpZCBs
aW5lCi0gICAgICAgICAgICAgcGVuLnNldFN0eWxlKFF0OjpTb2xpZExpbmUpOwotICAgICAgICAg
ICAgIFFDb2xvciBjb2xvcihwZW4uY29sb3IoKSk7Ci0tLSAKLTIuMzQuMQotCi0tIAoyLjM1LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
