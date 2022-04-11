Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6186C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 19:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DBE060E5E;
	Mon, 11 Apr 2022 19:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TvR4vYZggThr; Mon, 11 Apr 2022 19:02:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F7A360D5F;
	Mon, 11 Apr 2022 19:02:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9570F1BF372
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 19:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8437E830E6
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 19:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PT6IAVS6U6qb for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 19:02:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CC288308B
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 19:02:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8AD4420009;
 Mon, 11 Apr 2022 19:02:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ndzJC-0081fA-Gj; Mon, 11 Apr 2022 21:02:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220405185320.319C18361B@busybox.osuosl.org>
 <9ca9a86e-917a-ea5a-04bf-b9cd0e15aff5@othermo.de>
 <07cb544d-bc42-d774-08aa-67cecc96c1b0@mind.be>
Date: Mon, 11 Apr 2022 21:02:42 +0200
In-Reply-To: <07cb544d-bc42-d774-08aa-67cecc96c1b0@mind.be> (Arnout
 Vandecappelle's message of "Mon, 11 Apr 2022 19:03:37 +0200")
Message-ID: <87bkx7h299.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/containerd: security bump to
 version 1.5.11
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
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFybm91dCIgPT0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiB3
cml0ZXM6CgpIaSwKCiA+IE9uIDExLzA0LzIwMjIgMTQ6MjgsIE1hcmN1cyBIb2ZmbWFubiB3cm90
ZToKID4+IEhpIFBldGVyLAogPj4gT24gMDUuMDQuMjIgMTk6MjgsIFBldGVyIEtvcnNnYWFyZCB3
cm90ZToKID4+PiBjb21taXQ6CiA+Pj4gaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJv
b3QvY29tbWl0Lz9pZD0yNjQyZWRiMGFmMDhmMDRmYjk4ZjRjYjVmODg4OTVmYWRlZDRiMzI1IAog
Pj4+IAogPj4+IGJyYW5jaDogaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29t
bWl0Lz9pZD1yZWZzL2hlYWRzL21hc3RlcgogPj4+IAogPj4+IEZpeGVzIHRoZSBmb2xsb3dpbmcg
c2VjdXJpdHkgaXNzdWVzOgogPj4+IAogPj4+IC0gQ1ZFLTIwMjItMjM2NDg6IGNvbnRhaW5lcmQg
Q1JJIHBsdWdpbjogSW5zZWN1cmUgaGFuZGxpbmcgb2YgaW1hZ2Ugdm9sdW1lcwogPj4+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9jb250YWluZXJkL2NvbnRhaW5lcmQvc2VjdXJpdHkvYWR2aXNvcmllcy9H
SFNBLWNycDItcXJyNS04cHE3CiA+Pj4gCiA+Pj4gLSBDVkUtMjAyMi0yNDc2OTogRGVmYXVsdCBp
bmhlcml0YWJsZSBjYXBhYmlsaXRpZXMgZm9yIGxpbnV4IGNvbnRhaW5lcgogPj4+IMKgwqAgc2hv
dWxkIGJlIGVtcHR5CiA+Pj4gaHR0cHM6Ly9naXRodWIuY29tL2NvbnRhaW5lcmQvY29udGFpbmVy
ZC9zZWN1cml0eS9hZHZpc29yaWVzL0dIU0EtYzljcC05Yzc1LTl2OGMKID4+PiAKID4+PiBTaWdu
ZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+CiA+Pj4gLS0t
CiA+Pj4gwqAgcGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQuaGFzaCB8IDIgKy0KID4+PiDC
oCBwYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5ta8KgwqAgfCAyICstCiA+Pj4gwqAgMiBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiA+Pj4gCiA+Pj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLmhhc2gKID4+PiBiL3Bh
Y2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLmhhc2gKID4+PiBpbmRleCBkNWFhZmUyZTcwLi4y
M2RhY2RlZDg4IDEwMDY0NAogPj4+IC0tLSBhL3BhY2thZ2UvY29udGFpbmVyZC9jb250YWluZXJk
Lmhhc2gKID4+PiArKysgYi9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5oYXNoCiA+Pj4g
QEAgLTEsMyArMSwzIEBACiA+Pj4gwqAgIyBDb21wdXRlZCBsb2NhbGx5CiA+Pj4gLXNoYTI1NsKg
CiA+Pj4gNDBjOTc2N2FmM2U4N2YyYzM2YWRmMmY1NjNmMGE4Mzc0ZTgwYjMwYmQyYjdhYTgwMDU4
Yzg1OTEyNDA2Y2VmNAogPj4+IGNvbnRhaW5lcmQtMS41LjkudGFyLmd6CiA+Pj4gK3NoYTI1NsKg
CiA+Pj4gNmEyODk0MDZjMWMwNTgzNzYzZTVhOTc1NGUzMWExZWNlZDU1Y2Q1ZjE2MmE3YmMyYTNh
MzE1ZDVlYjA1YzdhMQogPj4+IGNvbnRhaW5lcmQtMS41LjExLnRhci5negogPj4gSSBnZXQgYSBk
aWZmZXJlbnQgaGFzaCBmb3IgdGhpcyBkb3dubG9hZCwgYm90aCB3aXRoaW4gYnVpbGRyb290IGFz
CiA+PiB3ZWxsIGFzIGRvd25sb2FkaW5nIHRoZSBmaWxlIG1hbnVhbGx5IGZyb20gZ2l0aHViOgog
Pj4gRVJST1I6IGNvbnRhaW5lcmQtMS41LjExLnRhci5neiBoYXMgd3Jvbmcgc2hhMjU2IGhhc2g6
CiA+PiBFUlJPUjogZXhwZWN0ZWQ6IDZhMjg5NDA2YzFjMDU4Mzc2M2U1YTk3NTRlMzFhMWVjZWQ1
NWNkNWYxNjJhN2JjMmEzYTMxNWQ1ZWIwNWM3YTEKID4+IEVSUk9SOiBnb3TCoMKgwqDCoCA6IDAy
Yjc5ZDVlMmIwN2I1ZTY0Y2QyOGYxZmU4NDM5NWVlMTFlZWY5NWZjNDlmZDkyM2E5YWI5MzAyMmIx
NDhiZTYKID4+IEVSUk9SOiBJbmNvbXBsZXRlIGRvd25sb2FkLCBvciBtYW4taW4tdGhlLW1pZGRs
ZSAoTUlUTSkgYXR0YWNrCiA+PiAKID4+IERpZCB0aGUgZmlsZSBjaGFuZ2UgaW4gdGhlIG1lYW50
aW1lIG9yIGRpZCBzb21ldGhpbmcgZWxzZSBnbyB3cm9uZyBoZXJlPwoKID4gIEl0IGFsc28gZ29l
cyB3cm9uZyBpbiB0aGUgYXV0b2J1aWxkZXJzICh0aGlzIG9uZSBvbiBtYXN0ZXIsIGJlZm9yZSBJ
CiA+ICBtZXJnZWQgdGhlIGJ1bXAgdG8gMS42LjIpIFsxXQoKID4+IFNob3VsZCBzZW5kIGEgcGF0
Y2ggY2hhbmdpbmcgdGhlIGhhc2ggdG8KID4+IDAyYjc5ZDVlMmIwN2I1ZTY0Y2QyOGYxZmU4NDM5
NWVlMTFlZWY5NWZjNDlmZDkyM2E5YWI5MzAyMmIxNDhiZTY/CgogPiAgTGV0J3MgZmlyc3QgYWxs
b3cgUGV0ZXIgdG8gY2hlY2sgd2hhdCBleGFjdGx5IHdlbnQgd3JvbmcuIEhlIHNob3VsZAogPiAg
aGF2ZSBhIGxvY2FsIGRvd25sb2FkIHdpdGggdGhlIGhhc2ggaGUgcHVzaGVkIHNvIGhlIGNhbiBj
b21wYXJlIHdoYXQKID4gY2hhbmdlZC4KCiA+ICBJIGxvb2tlZCBhdCB0aGUgZ2l0aHViIHJlcG8s
IGFuZCBpdCBzYXlzIHRoYXQgaXQgd2FzIHRhZ2dlZCBvbiBNYXJjaAogPiAgMjQsIGkuZS4gYmVm
b3JlIFBldGVyIGRpZCB0aGUgYnVtcCB0byAxLjUuMTEuIFNvIGl0IGRvZXNuJ3QgbG9vayBsaWtl
CiA+IHRoZXkgdXBkYXRlZCB0aGUgdGFnLgoKRnVua3ksIEkgZG8gaW5kZWVkIGhhdmUgdGhlIG9s
ZCBoYXNoIGhlcmU6CgpzaGEyNTZzdW0gfmRvd25sb2FkL2NvbnRhaW5lcmQvY29udGFpbmVyZC0x
LjUuMTEudGFyLmd6IGNvbnRhaW5lcmQtMS41LjExLnRhci5nego2YTI4OTQwNmMxYzA1ODM3NjNl
NWE5NzU0ZTMxYTFlY2VkNTVjZDVmMTYyYTdiYzJhM2EzMTVkNWViMDVjN2ExICAvdmFyL2xpYi9k
b3dubG9hZHMvY29udGFpbmVyZC9jb250YWluZXJkLTEuNS4xMS50YXIuZ3oKMDJiNzlkNWUyYjA3
YjVlNjRjZDI4ZjFmZTg0Mzk1ZWUxMWVlZjk1ZmM0OWZkOTIzYTlhYjkzMDIyYjE0OGJlNiAgY29u
dGFpbmVyZC0xLjUuMTEudGFyLmd6CgpFeHRyYWN0aW5nIHRoZSB0YXJiYWxscywgSSBzZWUgdGhl
IGZvbGxvd2luZyBkaWZmOgoKZGlmZiAtdXJwTiBhL2NvbnRhaW5lcmQtMS41LjExL3ZlbmRvci9r
OHMuaW8vY2xpZW50LWdvL3BrZy92ZXJzaW9uL2Jhc2UuZ28gYi9jb250YWluZXJkLTEuNS4xMS92
ZW5kb3IvazhzLmlvL2NsaWVudC1nby9wa2cvdmVyc2lvbi9iYXNlLmdvCi0tLSBhL2NvbnRhaW5l
cmQtMS41LjExL3ZlbmRvci9rOHMuaW8vY2xpZW50LWdvL3BrZy92ZXJzaW9uL2Jhc2UuZ28gICAg
IDIwMjItMDMtMjQgMDE6MDk6NDIuMDAwMDAwMDAwICswMTAwCisrKyBiL2NvbnRhaW5lcmQtMS41
LjExL3ZlbmRvci9rOHMuaW8vY2xpZW50LWdvL3BrZy92ZXJzaW9uL2Jhc2UuZ28gICAgIDIwMjIt
MDMtMjQgMDE6MDk6NDIuMDAwMDAwMDAwICswMTAwCkBAIC01NSw3ICs1NSw3IEBAIHZhciAoCiAg
ICAgICAgLy8gTk9URTogVGhlICRGb3JtYXQgc3RyaW5ncyBhcmUgcmVwbGFjZWQgZHVyaW5nICdn
aXQgYXJjaGl2ZScgdGhhbmtzIHRvIHRoZQogICAgICAgIC8vIGNvbXBhbmlvbiAuZ2l0YXR0cmli
dXRlcyBmaWxlIGNvbnRhaW5pbmcgJ2V4cG9ydC1zdWJzdCcgaW4gdGhpcyBzYW1lCiAgICAgICAg
Ly8gZGlyZWN0b3J5LiAgU2VlIGFsc28gaHR0cHM6Ly9naXQtc2NtLmNvbS9kb2NzL2dpdGF0dHJp
YnV0ZXMKLSAgICAgICBnaXRWZXJzaW9uICAgc3RyaW5nID0gInYwLjAuMC1tYXN0ZXIrM2RmNTRh
ODUyMzQiCisgICAgICAgZ2l0VmVyc2lvbiAgIHN0cmluZyA9ICJ2MC4wLjAtbWFzdGVyKzNkZjU0
YTg1MjMiCiAgICAgICAgZ2l0Q29tbWl0ICAgIHN0cmluZyA9ICIzZGY1NGE4NTIzNDVhZTEyN2Qx
ZmEzMDkyYjk1MTY4ZTRhODhlMmY4IiAvLyBzaGExIGZyb20gZ2l0LCBvdXRwdXQgb2YgJChnaXQg
cmV2LXBhcnNlIEhFQUQpCiAgICAgICAgZ2l0VHJlZVN0YXRlIHN0cmluZyA9ICIiICAgICAgICAg
ICAgLy8gc3RhdGUgb2YgZ2l0IHRyZWUsIGVpdGhlciAiY2xlYW4iIG9yICJkaXJ0eSIKClNvIHRo
ZSBnaXRWZXJzaW9uIGZpZWxkIGxvc3QgYSBkaWdpdC4gTm8gaWRlYSBob3cgdGhpcyBjb3VsZApo
YXBwZW4uIExvb2tpbmcgYXQgdGhlIGZpbGUgaW4gdGhlIGdpdCByZXBvIEkgc2VlIHRoYXQgdGhp
cyBpcyBsaXN0ZWQKYXM6CgoJZ2l0VmVyc2lvbiAgIHN0cmluZyA9ICJ2MC4wLjAtbWFzdGVyKyRG
b3JtYXQ6JUgkIgoJZ2l0Q29tbWl0ICAgIHN0cmluZyA9ICIkRm9ybWF0OiVIJCIgLy8gc2hhMSBm
cm9tIGdpdCwgb3V0cHV0IG9mICQoZ2l0IHJldi1wYXJzZSBIRUFEKQoKaHR0cHM6Ly9naXRodWIu
Y29tL2NvbnRhaW5lcmQvY29udGFpbmVyZC9ibG9iL21haW4vdmVuZG9yL2s4cy5pby9jbGllbnQt
Z28vcGtnL3ZlcnNpb24vYmFzZS5nbwoKU28gSSBndWVzcyBzb21ldGhpbmcgaW4gZ2l0aHViIGlz
IHdyb25nbHkgZXhwYW5kaW5nIHRoaXMgJEZvcm1hdD8KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFy
ZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
