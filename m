Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E04AC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 14:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19E55817B3;
	Sat, 10 Dec 2022 14:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19E55817B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JF_kVeP5QJK8; Sat, 10 Dec 2022 14:43:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65AB081B9D;
	Sat, 10 Dec 2022 14:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65AB081B9D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 546301BF3C3
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 14:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CD02403B8
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 14:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CD02403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HL6GvmbLrAm3 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 14:43:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF580403A4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF580403A4
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 14:43:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CE47A40006
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 14:43:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1p414p-003dtW-Tf
 for buildroot@buildroot.org; Sat, 10 Dec 2022 15:43:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 15:43:43 +0100
Message-ID: <87r0x7z5cw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.08.3 released
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

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cDovL2J1aWxkcm9vdC5vcmcpLgoKQnVpbGRyb290IDIw
MjIuMDguMyBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjA4LjMudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIyLjA4LjMudGFyLnh6CgpPciBnZXQg
aXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290Lm9yZy9idWlsZHJvb3QKCkJ1aWxkcm9v
dCAyMDIyLjA4LjMgaXMgYSBidWdmaXggcmVsZWFzZSwgZml4aW5nIGEgbnVtYmVyIG9mIGltcG9y
dGFudCAvCnNlY3VyaXR5IHJlbGF0ZWQgaXNzdWVzIGRpc2NvdmVyZWQgc2luY2UgdGhlIDIwMjIu
MDguMiByZWxlYXNlLgoKLSBTZWN1cml0eSBmaXhlcyBmb3IgYXN0ZXJpc2ssIGRvdmVjb3QsIGV4
aW0sIGZyZWVyZHAsIGdpdCwgaGVpbWRhbCwKICBsaWJhcmNoaXZlLCBsaWJrcmI1LCBsaWJrc2Jh
LCBuZXRzbm1wLCBuZ2lueCwgbm9kZWpzLCBweXRob24zLCBzYW1iYTQsCiAgc2RsLCBzeXNzdGF0
LCBzeXN0ZW1kLCB2aW0sIHZsYywgeGVuLCB4dGVybQoKLSBGaXhlcyBmb3IgZG93bmxvYWQvY29t
cGlsYXRpb24vcnVudGltZS9saWNlbnNlIGlzc3VlcyBpbiBkYXNoLCBlZGsyLAogIGVkazItcGxh
dGZvcm1zLCBlbGYyZmx0LCBnY2MsIGdkYiwgZ251cGcyLCBpd2QsIGtvZGksIGxpYm1kYngsCiAg
bGlib3BlbnNzbCwgbWF0Y2hib3gta2V5Ym9hcmQsIG1lbWNhY2hlZCwgb3BlbnBnbSwgb3B0ZWUt
Y2xpZW50LAogIHB5dGhvbi1zY2lweSwgcnN5bmMsIHJ0bDg3MjNidSwgc2RsMiwgc3d1cGRhdGUs
IHVib290LCB3aWxjLWRyaXZlcgoKRm9yIG1vcmUgZGV0YWlscywgc2VlIHRoZSBDSEFOR0VTIGZp
bGU6CgpodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9wbGFpbi9DSEFOR0VTP2lk
PTIwMjIuMDguMwoKVXNlcnMgb2YgdGhlIGFmZmVjdGVkIHBhY2thZ2VzIGFyZSBzdHJvbmdseSBl
bmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgpNYW55IHRoYW5rcyB0byBhbGwgdGhlIHBlb3BsZSBjb250
cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zbiAyMDIyLjA4LjIuLgoK
ICAgIDE3ICBQZXRlciBLb3JzZ2FhcmQKICAgIDE0ICBGYWJyaWNlIEZvbnRhaW5lCiAgICAgMyAg
QmVybmQgS3VobHMKICAgICAzICBHaXVsaW8gQmVuZXR0aQogICAgIDMgIE1pY2hhZWwgRmlzY2hl
cgogICAgIDMgIFZpbmNlbnQgU3RlaGzDqQogICAgIDIgIEphbWVzIEhpbGxpYXJkCiAgICAgMiAg
VGhvbWFzIFBldGF6em9uaQogICAgIDIgIFlhbm4gRS4gTU9SSU4KICAgICAxICBBbGV4YW5kZXIg
THVraWNoZXYKICAgICAxICBCYXJ1Y2ggU2lhY2gKICAgICAxICBCcmFuZG9uIE1haWVyCiAgICAg
MSAgRXRpZW5uZSBDYXJyaWVyZQogICAgIDEgIE1heCBGaWxpcHBvdgogICAgIDEgIE1pY2hhZWwg
Tm9zdGhvZmYKICAgICAxICBNaXF1ZWwgUmF5bmFsCiAgICAgMSAgWWVnb3IgWWVmcmVtb3YKICAg
ICAxICBaaWt1aSBaaGFvCiAgICAgMSAg0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZ
dXJpZXYpCgpUaGlzIGlzIHRoZSBsYXN0IHVwZGF0ZSBvZiB0aGUgMjAyMi4wOC54IHNlcmllcy4g
UGxlYXNlIG1pZ3JhdGUgdG8KMjAyMi4xMS54IGluc3RlYWQuCgotLSAKQnllLCBQZXRlciBLb3Jz
Z2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
