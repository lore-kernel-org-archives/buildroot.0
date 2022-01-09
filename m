Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9D2C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3793F81A46;
	Sun,  9 Jan 2022 15:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Ae6OZdHmp-C; Sun,  9 Jan 2022 15:17:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 676C28140B;
	Sun,  9 Jan 2022 15:17:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5A341BF4D5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FEB960760
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9lewhfBYnV5n for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:17:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 628D1606EB
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 15:17:52 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 73C7DC0003;
 Sun,  9 Jan 2022 15:17:50 +0000 (UTC)
Date: Sun, 9 Jan 2022 16:17:49 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220109161749.758edd3c@bootlin.com>
In-Reply-To: <20220101155022.GD2777@scaer>
References: <20211112131258.2671293-1-herve.codina@bootlin.com>
 <20211112131258.2671293-2-herve.codina@bootlin.com>
 <20220101155022.GD2777@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/5] package/alchemy: new host package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIFNhdCwgMSBKYW4gMjAyMiAxNjo1MDoyMiArMDEwMAoiWWFubiBFLiBNT1JJ
TiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKCj4gSGVydsOpLCBBbGwsCj4gCj4g
T24gMjAyMS0xMS0xMiAxNDoxMiArMDEwMCwgSGVydmUgQ29kaW5hIHNwYWtlIHRodXNseToKPiA+
IEFsY2hlbXkgaXMgYSBidWlsZCBzeXN0ZW0gZGV2ZWxvcGVkIGJ5IFBhcnJvdC4KPiA+IAo+ID4g
SXQgaXMgYSBuZXcgYnVpbGQgc3lzdGVtIGJhc2VkIG9uIHRoZSBvbmUgdXNlZCBpbiBBbmRyb2lk
Lgo+ID4gQSBjZW50cmFsIG1ha2VmaWxlIGluc3RhbmNlIHNjYW5zIGEgd29ya3NwYWNlIHRvIGZp
bmQgdXNlcgo+ID4gbWFrZWZpbGVzLCBpbmNsdWRlcyB0aGVtIGFuZCByZWdpc3RlciBtb2R1bGVz
IHRvIGJlIGJ1aWx0Lgo+ID4gCj4gPiBodHRwczovL2dpdGh1Yi5jb20vUGFycm90LURldmVsb3Bl
cnMvYWxjaGVteQo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNv
ZGluYUBib290bGluLmNvbT4gIAo+IAo+IEkgd2FzIGFib3V0IHRvIHB1c2ggdGhpcywgd2l0aCBh
IGZldyBjaGFuZ2VzLCBidXQgSSBoYXZlIHNvbWUgcXVlc3Rpb25zCj4gYWJvdXQgdGhlIHBhY2th
Z2VzLCBzbyBoZXJlJ3MgdGhlIHBhdGNoIG9mIHRoZSBjaGFuZ2VzIEkgZGlkOgo+IAo+ICAgICBb
eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI6Cj4gICAgICAgLSB1c2UgQUxDSEVNWV9IT01FIGV2ZXJ5
d2hlcmUgcmF0aGVyIHRoYW4gcmVwZWF0aW5nIHRoZSBsb2NhdGlvbiBpbgo+ICAgICAgICAgdGhl
IGluc3RhbGwgbWFjcm8KPiAgICAgICAtIGRvbid0IHJlbW92ZSBpbnN0YWxsIGRpciBiZWZvcmUg
aW5zdGFsbGluZwo+ICAgICAgIC0gdXNlIGEgdGVtcGxhdGUgZm9yIGF0b20ubWssIG5vdCBpbi1s
aW5lIGluIGFsY2hlbXkubWsKPiAgICAgXQo+IAo+ICAgICBkaWZmIC0tZ2l0IGEvcGFja2FnZS9h
bGNoZW15L2FsY2hlbXkubWsgYi9wYWNrYWdlL2FsY2hlbXkvYWxjaGVteS5tawo+ICAgICBpbmRl
eCA2M2Q1YTk0MWM1Li5mODAyYzYyNDI1IDEwMDY0NAo+ICAgICAtLS0gYS9wYWNrYWdlL2FsY2hl
bXkvYWxjaGVteS5tawo+ICAgICArKysgYi9wYWNrYWdlL2FsY2hlbXkvYWxjaGVteS5tawo+ICAg
ICBAQCAtMTAsMTkgKzEwLDE5IEBAIEFMQ0hFTVlfTElDRU5TRSA9IEJTRC0zLUNsYXVzZSAoQWxj
aGVteSksIEdQTC0yLjAgKGtjb25maWcpCj4gICAgICBBTENIRU1ZX0xJQ0VOU0VfRklMRVMgPSBD
T1BZSU5HIFJFQURNRQo+ICAgICAgSE9TVF9BTENIRU1ZX0RFUEVOREVOQ0lFUyA9IGhvc3QtcHl0
aG9uMwo+ICAgICAgCj4gICAgICtBTENIRU1ZX0hPTUUgPSAkKEhPU1RfRElSKS9vcHQvYWxjaGVt
eQo+ICAgICAgQUxDSEVNWV9TREtfQkFTRURJUiA9ICQoU1RBR0lOR19ESVIpL3Vzci9saWIvYWxj
aGVteS9zZGsKPiAgICAgIAo+ICAgICAgZGVmaW5lIEhPU1RfQUxDSEVNWV9JTlNUQUxMX0NNRFMK
PiAgICAgLQlybSAtcmYgJChIT1NUX0RJUikvb3B0L2FsY2hlbXkKPiAgICAgLQlta2RpciAtcCAk
KEhPU1RfRElSKS9vcHQvYWxjaGVteQo+ICAgICAtCWNwIC1yZiAkKEBEKS8qICQoSE9TVF9ESVIp
L29wdC9hbGNoZW15Lwo+ICAgICArCW1rZGlyIC1wICQoQUxDSEVNWV9IT01FKQo+ICAgICArCWNw
IC1yZiAkKEBEKS8qICQoQUxDSEVNWV9IT01FKQo+ICAgICArCWNwICQoQUxDSEVNWV9QS0dESVIp
L2F0b20ubWsuaW4gJChBTENIRU1ZX0hPTQlFKS9hdG9tLm1rLmluCj4gICAgICBlbmRlZgo+ICAg
ICAgCj4gICAgICAkKGV2YWwgJChob3N0LWdlbmVyaWMtcGFja2FnZSkpCj4gICAgICAKPiAgICAg
ICMgVmFyaWFibGVzIHVzZWQgYnkgb3RoZXIgcGFja2FnZXMKPiAgICAgIAo+ICAgICAtQUxDSEVN
WV9IT01FID0gJChIT1NUX0RJUikvb3B0L2FsY2hlbXkKPiAgICAgIEFMQ0hFTVlfTUFLRSA9ICQo
QUxDSEVNWV9IT01FKS9zY3JpcHRzL2FsY2hlbWFrZQo+ICAgICAgCj4gICAgICAjIFRBUkdFVF9B
UkNIIGlzIHNldCB0byAneHh4JyB0byBhdm9pZCBBbGNoZW15IG1hbmFnaW5nIHRoZSBhcmNoaXRl
Y3R1cmUuCj4gICAgIEBAIC01OSwxNCArNTksMTEgQEAgZW5kaWYKPiAgICAgICMgJDI6IEFsY2hl
bXkgbW9kdWxlIG5hbWUKPiAgICAgICMgJDM6IEFsY2hlbXkgbW9kdWxlIGZpbGUgbmFtZQo+ICAg
ICAgZGVmaW5lIEFMQ0hFTVlfSU5TVEFMTF9MSUJfU0RLX0ZJTEUKPiAgICAgLQlta2RpciAtcCAk
KEFMQ0hFTVlfU0RLX0JBU0VESVIpLyQoc3RyaXAgJCgxKSkKPiAgICAgLQkoIFwKPiAgICAgLQkJ
ZWNobyAnTE9DQUxfUEFUSCA6PSAkJChjYWxsIG15LWRpciknOyBcCj4gICAgIC0JCWVjaG8gJ2lu
Y2x1ZGUgJCQoQ0xFQVJfVkFSUyknOyBcCj4gICAgIC0JCWVjaG8gJ0xPQ0FMX01PRFVMRSA6PSAk
KHN0cmlwICQoMikpJzsgXAo+ICAgICAtCQllY2hvICdMT0NBTF9TREsgOj0gJChTVEFHSU5HX0RJ
UiknOyBcCj4gICAgIC0JCWVjaG8gJ0xPQ0FMX0RFU1RESVIgOj0gdXNyL2xpYic7IFwKPiAgICAg
LQkJZWNobyAnTE9DQUxfTU9EVUxFX0ZJTEVOQU1FIDo9ICQoc3RyaXAgJCgzKSknOyBcCj4gICAg
IC0JCWVjaG8gJ2luY2x1ZGUgJCQoQlVJTERfTElCUkFSWSknOyBcCj4gICAgIC0JKSA+ICQoQUxD
SEVNWV9TREtfQkFTRURJUikvJChzdHJpcCAkKDEpKS9hdG9tLm1rCj4gICAgICsJJChJTlNUQUxM
KSAtbSAwNjQ0IC1EIFwKPiAgICAgKwkJJChBTENIRU1ZX0hPTUUpL2F0b20ubWsuaW4gXAo+ICAg
ICArCQkkKEFMQ0hFTVlfU0RLX0JBU0VESVIpLyQoc3RyaXAgJCgxKSkvYXRvbS5tawo+ICAgICAr
CSQoU0VEKSAncyNAU1RBR0lOR19ESVJAIyQoU1RBR0lOR19ESVIpIycgXAo+ICAgICArCQktZSAn
cyNATU9EVUxFQCMkKHN0cmlwICQoMikpIycgXAo+ICAgICArCQktZSAncyNATU9EVUxFX0ZJTEVO
QU1FQCMkKHN0cmlwICQoMykpIycgXAo+ICAgICArCQkkKEFMQ0hFTVlfU0RLX0JBU0VESVIpLyQo
c3RyaXAgJCgxKSkvYXRvbS5tawo+ICAgICAgZW5kZWYKPiAgICAgZGlmZiAtLWdpdCBhL3BhY2th
Z2UvYWxjaGVteS9hdG9tLm1rLmluIGIvcGFja2FnZS9hbGNoZW15L2F0b20ubWsuaW4KPiAgICAg
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiAgICAgaW5kZXggMDAwMDAwMDAwMC4uMzBlYjZkNWUyMwo+
ICAgICAtLS0gL2Rldi9udWxsCj4gICAgICsrKyBiL3BhY2thZ2UvYWxjaGVteS9hdG9tLm1rLmlu
Cj4gICAgIEBAIC0wLDAgKzEsNyBAQAo+ICAgICArTE9DQUxfUEFUSCA6PSAkKGNhbGwgbXktZGly
KQo+ICAgICAraW5jbHVkZSAkKENMRUFSX1ZBUlMpCj4gICAgICtMT0NBTF9NT0RVTEUgOj0gQE1P
RFVMRUAKPiAgICAgK0xPQ0FMX1NESyA6PSBAU1RBR0lOR19ESVJACj4gICAgICtMT0NBTF9ERVNU
RElSIDo9IHVzci9saWIKPiAgICAgK0xPQ0FMX01PRFVMRV9GSUxFTkFNRSA6PSBATU9EVUxFX0ZJ
TEVOQU1FQAo+ICAgICAraW5jbHVkZSAkKEJVSUxEX0xJQlJBUlkpCj4gCgpJIHRha2UgdGhlc2Ug
bW9kaWZpY2F0aW9ucyB3aXRoIGEgZmV3IGNoYW5nZXMuClRoZXkgd2lsbCBiZSBwYXJ0IG9mIHRo
ZSB2MyBzZXJpZXMuCgpUaGFua3MsCkhlcnbDqQoKCi0tIApIZXJ2w6kgQ29kaW5hLCBCb290bGlu
CkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
