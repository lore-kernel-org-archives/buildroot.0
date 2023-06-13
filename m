Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62E0C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 07:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F88E822B8;
	Tue, 13 Jun 2023 07:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F88E822B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q1K4SM-ruO69; Tue, 13 Jun 2023 07:28:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77205822A5;
	Tue, 13 Jun 2023 07:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77205822A5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CB4A1BF341
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 07:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3F8760BD2
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 07:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3F8760BD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bODHJpCBZyBJ for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 07:28:12 +0000 (UTC)
X-Greylist: delayed 12:01:14 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2D5260BBF
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2D5260BBF
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 07:28:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D51F60007;
 Tue, 13 Jun 2023 07:28:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1q8yRj-004C8z-3Q; Tue, 13 Jun 2023 09:28:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 09:28:05 +0200
Message-Id: <20230613072806.999946-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/cups: security bump to version 2.4.4
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBzZWN1cml0eSBpc3N1ZXM6CgotIENWRS0yMDIzLTMyMzI0OiBI
ZWFwIGJ1ZmZlciBvdmVyZmxvdyBpbiBjdXBzZAogIGh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuUHJp
bnRpbmcvY3Vwcy9zZWN1cml0eS9hZHZpc29yaWVzL0dIU0EtY3hjNi13Mmc3LTY5cDcKCkFuZCBh
IG51bWJlciBvZiBvdGhlciBmaXhlcywgc2VlIHRoZSByZWxlYXNlIG5vdGVzIGZvciBkZXRhaWxz
OgpodHRwczovL2dpdGh1Yi5jb20vT3BlblByaW50aW5nL2N1cHMvcmVsZWFzZXMvdGFnL3YyLjQu
MwoKSW4gYWRkaXRpb24sIDIuNC40IGZpeGVzIGEgc2VnZmF1bHQgcmVncmVzc2lvbiBpbiAyLjQu
MzoKaHR0cHM6Ly9naXRodWIuY29tL09wZW5QcmludGluZy9jdXBzL3JlbGVhc2VzL3RhZy92Mi40
LjQKClVwZGF0ZSBOT1RJQ0UgaGFzaCBmb3IgYSBjaGFuZ2UgaW4gY29weXJpZ2h0IHllYXJzOgot
Q29weXJpZ2h0IMKpIDIwMjAtMjAyMiBieSBPcGVuUHJpbnRpbmcKK0NvcHlyaWdodCDCqSAyMDIw
LTIwMjMgYnkgT3BlblByaW50aW5nCgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBl
dGVyQGtvcnNnYWFyZC5jb20+Ci0tLQogcGFja2FnZS9jdXBzL2N1cHMuaGFzaCB8IDQgKystLQog
cGFja2FnZS9jdXBzL2N1cHMubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvY3Vwcy9jdXBzLmhh
c2ggYi9wYWNrYWdlL2N1cHMvY3Vwcy5oYXNoCmluZGV4IGJhMjIwZTkwM2UuLmNjNmZlMjU0NDYg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvY3Vwcy9jdXBzLmhhc2gKKysrIGIvcGFja2FnZS9jdXBzL2N1
cHMuaGFzaApAQCAtMSw0ICsxLDQgQEAKICMgTG9jYWxseSBjYWxjdWxhdGVkOgotc2hhMjU2ICBm
MDNjY2I0MGIwODdkMWUzMDk0MGE0MGUwMTQxZGNiYmEyNjNmMzk5NzRjMjBlYjlmMjUyMTA2NmM5
YzZjOTA4ICBjdXBzLTIuNC4yLXNvdXJjZS50YXIuZ3oKK3NoYTI1NiAgMjA5MjU5ZThmZThkZjkx
MTJhZjQ5ZjRlNTc2NWY1MGRhZDZkYTFmODY5Mjk2ZGU0MWQ2ZWFhYjFiOTgwMDNjYiAgY3Vwcy0y
LjQuNC1zb3VyY2UudGFyLmd6CiBzaGEyNTYgIGNmYzc3NDliOTZmNjNiZDMxYzNjNDJiNWM0NzFi
Zjc1NjgxNDA1M2U4NDdjMTBmM2ViMDAzNDE3YmM1MjNkMzAgIExJQ0VOU0UKLXNoYTI1NiAgN2E3
YmQ2MzllM2E4NDU3YWU0MGIwZGNmYjc0ZWEzY2M2YTgxMzJiMDZjNzI2MTQyZTk5MzYyNWQzM2Vi
NmRlNSAgTk9USUNFCitzaGEyNTYgIDUzMjBiNmUzYzI1MjQyM2U0MTUzZWIyZGQ2M2U1N2UzYjYz
MGFmYjIxMTM5ZjQ0ZTQzYjAyZDg1ZmUzM2UyNzkgIE5PVElDRQpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9jdXBzL2N1cHMubWsgYi9wYWNrYWdlL2N1cHMvY3Vwcy5tawppbmRleCBmZWQyYWE4MDlmLi43
YmJlYTlhMjE4IDEwMDY0NAotLS0gYS9wYWNrYWdlL2N1cHMvY3Vwcy5taworKysgYi9wYWNrYWdl
L2N1cHMvY3Vwcy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
CiAKLUNVUFNfVkVSU0lPTiA9IDIuNC4yCitDVVBTX1ZFUlNJT04gPSAyLjQuNAogQ1VQU19TT1VS
Q0UgPSBjdXBzLSQoQ1VQU19WRVJTSU9OKS1zb3VyY2UudGFyLmd6CiBDVVBTX1NJVEUgPSBodHRw
czovL2dpdGh1Yi5jb20vT3BlblByaW50aW5nL2N1cHMvcmVsZWFzZXMvZG93bmxvYWQvdiQoQ1VQ
U19WRVJTSU9OKQogQ1VQU19MSUNFTlNFID0gQXBhY2hlLTIuMCB3aXRoIEdQTC0yLjAvTEdQTC0y
LjAgZXhjZXB0aW9uCi0tIAoyLjMwLjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
