Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EF0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2FEE60F88;
	Tue, 11 Jan 2022 20:45:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7YmEMM4jh2f4; Tue, 11 Jan 2022 20:45:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01B0960F20;
	Tue, 11 Jan 2022 20:45:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9B0C1BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8ED7415FA
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EftoN9BXk_Ih for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:45:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98C03415F8
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:45:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id B5435200006;
 Tue, 11 Jan 2022 20:45:10 +0000 (UTC)
Date: Tue, 11 Jan 2022 21:45:09 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Message-ID: <20220111214509.79c5c88e@windsurf>
In-Reply-To: <20220110210235.817082-1-clg@kaod.org>
References: <20220110210235.817082-1-clg@kaod.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] configs/qemu: Add a ppc64le-powernv8
 configuration
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ8OpZHJpYywKCk9uIE1vbiwgMTAgSmFuIDIwMjIgMjI6MDI6MzMgKzAxMDAKQ8OpZHJp
YyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4gd3JvdGU6Cgo+IFBvd2VyTlYgaXMgdGhlIHBsYXRm
b3JtIHVzaW5nIHRoZSBPUEFMIFsxXSBmaXJtd2FyZSBvbiBPcGVuUE9XRVIKPiBzeXN0ZW1zLiBP
UEFMIGZpcnN0IGxvYWRzIGEga2VybmVsIGFuZCBhbiBpbml0cmFtZnMgaW1hZ2UgYmFzZWQgb24K
PiBidWlsZHJvb3QgaW5jbHVkaW5nIGEgc2Vjb25kIGJvb3QgbG9hZGVyIHBldGl0Ym9vdCBbMl0u
IFRoZSBsYXR0ZXIKPiBkb2VzIGRldmljZSBkaXNjb3ZlcnkgYW5kIGtleGVjcyBhIG5ldyBMaW51
eCBpbWFnZSBmcm9tIGRpc2sgb3IKPiBuZXR3b3JrLgo+IAo+IFFFTVUgaW1wbGVtZW50cyBQb3dl
ck5WIG1hY2hpbmVzIFszXSBmb3IgdGhlIFBPV0VSOCwgUE9XRVI5IGFuZAo+IFBvd2VyMTAgcHJv
Y2Vzc29ycyB3aGljaCBhcmUgdXNlZCBmb3IgZGV2IGFuZCB0ZXN0cy4gUE9XRVI4IGltYWdlcwo+
IGJlaW5nIGNvbXBhdGlibGUgd2l0aCBQT1dFUjkgYW5kIFBvd2VyMTAsIHNpbXBseSBhZGQgYSBz
aW5nbGUKPiBxZW11X3BwYzY0bGVfcG93ZXJudjggYm9hcmQgZm9yIGFsbC4KPiAKPiBUaGUgUUVN
VSBzY3JpcHQgYm9vdHMgZGlyZWN0bHkgZnJvbSBhIG52bWUgZGlzayBiZWNhdXNlIGl0IGlzIHNp
bXBsZQo+IGVub3VnaCBidXQgYSByZWFsIHN5c3RlbSB3b3VsZCBib290IGZyb20gYSByYW1mcyBm
aXJzdC4KPiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL29wZW4tcG93ZXIvc2tpYm9vdC9ibG9i
L21hc3Rlci9kb2Mvb3ZlcnZpZXcucnN0Cj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuLXBv
d2VyL3BldGl0Ym9vdC8KPiBbM10gaHR0cHM6Ly9xZW11LnJlYWR0aGVkb2NzLmlvL2VuL2xhdGVz
dC9zeXN0ZW0vcHBjL3Bvd2VybnYuaHRtbAo+IAo+IFNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUg
R29hdGVyIDxjbGdAa2FvZC5vcmc+Cj4gLS0tCj4gIGJvYXJkL3FlbXUvcHBjNjRsZS1wb3dlcm52
OC9yZWFkbWUudHh0ICB8ICA1ICsrKysrCj4gIGNvbmZpZ3MvcWVtdV9wcGM2NGxlX3Bvd2VybnY4
X2RlZmNvbmZpZyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFu
Z2VkLCAzNCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9xZW11L3Bw
YzY0bGUtcG93ZXJudjgvcmVhZG1lLnR4dAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9x
ZW11X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmlnCgpUaGFua3MsIGVudGlyZSBwYXRjaCBzZXJp
ZXMgYXBwbGllZC4gT25lIHNtYWxsIGNoYW5nZSB3YXMgZG9uZTogYWRkCmFwcHJvcHJpYXRlIGVu
dHJpZXMgdG8gdGhlIERFVkVMT1BFUlMgZmlsZSwgc28gdGhhdCB3ZSBrbm93IHdobyB0bwpjb250
YWN0IGZvciB0aG9zZSBkZWZjb25maWdzIDotKSBFc3BlY2lhbGx5IGlmIG91ciBHaXRsYWIgQ0kK
aW5mcmFzdHJ1Y3R1cmUgZGV0ZWN0cyBidWlsZCBpc3N1ZXMsIHlvdSB3aWxsIGJlIG5vdGlmaWVk
LgoKU2luY2UgeW91IGFyZSBhIFBvd2VyUEMgZXhwZXJ0LCBJJ2QgbGlrZSB0byB0YWtlIHRoaXMg
b3Bwb3J0dW5pdHkgdG8KYXNrIHlvdSBhYm91dCB0aGUgdG9vbGNoYWlucyB3ZSdyZSBwcm92aWRp
bmcgYXQKaHR0cHM6Ly90b29sY2hhaW5zLmJvb3RsaW4uY29tLy4gRm9yIHRoZSBtb21lbnQgZm9y
IFBvd2VyUEMsIHdlIGFyZQpwcm92aWRpbmcgdGhlIGZvbGxvd2luZyB0b29sY2hhaW5zOgoKcG93
ZXJwYy00NDBmcCwgbm90IHRlc3RlZApwb3dlcnBjNjQtZTU1MDAsIHRlc3RlZCB3aXRoIHFlbXVf
cHBjNjRfZTU1MDBfZGVmY29uZmlnCnBvd2VycGM2NC1lNjUwMCwgbm90IHRlc3RlZApwb3dlcnBj
NjRsZS1wb3dlcjgsIHRlc3RlZCB3aXRoIHFlbXVfcHBjNjRsZV9wc2VyaWVzX2RlZmNvbmZpZwpw
b3dlcnBjNjQtcG93ZXI4LCB0ZXN0ZWQgd2l0aCBxZW11X3BwYzY0X3BzZXJpZXNfZGVmY29uZmln
CnBvd2VycGMtZTMwMGMzLCBub3QgdGVzdGVkCnBvd2VycGMtZTUwMG1jLCBub3QgdGVzdGVkCgpJ
IHN1cHBvc2UgSSBjb3VsZCBub3cgdGVzdCB0aGUgcG93ZXJwYy00NDBmcCB0b29sY2hhaW4gd2l0
aCB0aGUKcWVtdV9wcGNfYmFtYm9vX2RlZmNvbmZpZyB5b3UgaGF2ZSBhZGRlZC4gSXMgdGhhdCBj
b3JyZWN0PwoKV2hhdCBhYm91dCB0aGUgb3RoZXIgdG9vbGNoYWluIGNvbmZpZ3VyYXRpb25zPyBJ
cyB0aGVyZSBzb21lIG1hdGNoaW5nClFlbXUgZW11bGF0aW9uPwoKQW5kIGdlbmVyYWxseSBzcGVh
a2luZywgZG9lcyB0aGlzIHNlbGVjdGlvbiBvZiBQb3dlclBDIGFyY2hpdGVjdHVyZQp2YXJpYW50
cyBtYWtlIHNlbnNlIHRvIG9mZmVyIHByZS1jb21waWxlZCB0b29sY2hhaW5zPyBGb3IgcXVpdGUg
YQp3aGlsZSwgd2UndmUgaGFkIHJlcXVlc3RzIGZvciBvdGhlciBQb3dlclBDIHZhcmlhbnRzOgpo
dHRwczovL2dpdGh1Yi5jb20vYm9vdGxpbi90b29sY2hhaW5zLWJ1aWxkZXIvaXNzdWVzLzIuIFlv
dXIgaW5wdXQKd291bGQgYmUgdmVyeSB3ZWxjb21lIDotKQoKVGhhbmtzIQoKVGhvbWFzCi0tIApU
aG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBl
bmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
