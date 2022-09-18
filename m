Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88510C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 08:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1014F41A17;
	Sun, 18 Sep 2022 08:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1014F41A17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o42Pwc_J9DT0; Sun, 18 Sep 2022 08:55:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A53B741911;
	Sun, 18 Sep 2022 08:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A53B741911
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C7931BF282
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CC7F41911
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CC7F41911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DyTf2V_kG0uu for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 08:55:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC946418D0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC946418D0
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 08:55:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A64C420004;
 Sun, 18 Sep 2022 08:55:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZq5E-00BTVI-R6; Sun, 18 Sep 2022 10:55:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220904092629.16495-1-fontaine.fabrice@gmail.com>
Date: Sun, 18 Sep 2022 10:55:24 +0200
In-Reply-To: <20220904092629.16495-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 4 Sep 2022 11:26:29 +0200")
Message-ID: <87czbtjc3n.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to
 version 5.5.0
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBGaXggdGhlIGZvbGxvd2luZyBzZWN1cml0eSB2dWxuZXJhYmls
aXRpZXM6CiA+ICAtIFtMb3ddIEZhdWx0IGluamVjdGlvbiBhdHRhY2sgb24gUkFNIHZpYSBSb3do
YW1tZXIgbGVhZHMgdG8gRUNEU0Ega2V5CiA+ICAgIGRpc2Nsb3N1cmUuIFVzZXJzIGRvaW5nIG9w
ZXJhdGlvbnMgd2l0aCBwcml2YXRlIEVDQyBrZXlzIHN1Y2ggYXMKID4gICAgc2VydmVyIHNpZGUg
VExTIGNvbm5lY3Rpb25zIGFuZCBjcmVhdGluZyBFQ0Mgc2lnbmF0dXJlcywgd2hvIGFsc28KID4g
ICAgaGF2ZSBoYXJkd2FyZSB0aGF0IGNvdWxkIGJlIHRhcmdldGVkIHdpdGggYSBzb3BoaXN0aWNh
dGVkIFJvd2hhbW1lcgogPiAgICBhdHRhY2sgc2hvdWxkIHVwZGF0ZSB0aGUgdmVyc2lvbiBvZiB3
b2xmU1NMIGFuZCBjb21waWxlIHVzaW5nIHRoZQogPiAgICBtYWNybyBXT0xGU1NMX0NIRUNLX1NJ
R19GQVVMVFMuCiA+ICAtIFtMb3ddIEluIHdvbGZTU0wgdmVyc2lvbiA1LjMuMCBpZiBjb21waWxl
ZCB3aXRoCiA+ICAgIC0tZW5hYmxlLXNlc3Npb24tdGlja2V0IGFuZCB0aGUgY2xpZW50IGhhcyBu
b24tZW1wdHkgc2Vzc2lvbiBjYWNoZSwKID4gICAgd2l0aCBUTFMgMS4yIHRoZXJlIGlzIHRoZSBw
b3NzaWJpbGl0eSBvw6BmIGEgbWFuIGluIHRoZSBtaWRkbGUgcGFzc2luZwogPiAgICBhIGxhcmdl
IHNlc3Npb24gdGlja2V0IHRvIHRoZSBjbGllbnQgYW5kIGNhdXNpbmcgYSBjcmFzaCBkdWUgdG8g
YW4KID4gICAgaW52YWxpZCBmcmVlLiBUaGVyZSBpcyBhbHNvIHRoZSBwb3RlbnRpYWwgZm9yIGEg
bWFsaWNpb3VzIFRMUyAxLjMKID4gICAgc2VydmVyIHRvIGNyYXNoIGEgY2xpZW50IGluIGEgc2lt
aWxhciBtYW5uZXIgZXhjZXB0IGluIFRMUyAxLjMgaXQgaXMKID4gICAgbm90IHN1c2NlcHRpYmxl
IHRvIGEgbWFuIGluIHRoZSBtaWRkbGUgYXR0YWNrLiBVc2VycyBvbiB0aGUgY2xpZW50CiA+ICAg
IHNpZGUgd2l0aCDigJNlbmFibGUtc2Vzc2lvbi10aWNrZXQgY29tcGlsZWQgaW4gYW5kIHVzaW5n
IHdvbGZTU0wKID4gICAgdmVyc2lvbiA1LjMuMCBzaG91bGQgdXBkYXRlIHRoZWlyIHZlcnNpb24g
b2Ygd29sZlNTTC4KID4gIC0gW0xvd10gSWYgdXNpbmcgd29sZlNTTF9jbGVhciB0byByZXNldCBh
IFdPTEZTU0wgb2JqZWN0ICh2cyB0aGUgbm9ybWFsCiA+ICAgIHdvbGZTU0xfZnJlZS93b2xmU1NM
X25ldykgaXQgY2FuIHJlc3VsdCBpbiBydW50aW1lIGlzc3Vlcy4gVGhpcwogPiAgICBleGlzdHMg
d2l0aCBidWlsZHMgdXNpbmcgdGhlIHdvbGZTU0wgY29tcGF0aWJpbGl0eSBsYXllcgogPiAgICAo
LS1lbmFibGUtb3BuZXNzbGV4dHJhKSBhbmQgb25seSB3aGVuIHRoZSBhcHBsaWNhdGlvbiBpcyBt
YWtpbmcgdXNlCiA+ICAgIG9mIHdvbGZTU0xfY2xlYXIgaW5zdGVhZCBvZiBTU0xfZnJlZS9TU0xf
bmV3LiBJbiB0aGUgY2FzZSBvZiBhIFRMUwogPiAgICAxLjMgcmVzdW1wdGlvbiwgYWZ0ZXIgY29u
dGludWluZyB0byB1c2UgdGhlIFdPTEZTU0ggb2JqZWN0IGFmdGVyCiA+ICAgIGhhdmluZyBjYWxs
ZWQgd29sZlNTTF9jbGVhciwgYW4gYXBwbGljYXRpb24gY291bGQgY3Jhc2guIEl0IGlzCiA+ICAg
IHN1Z2dlc3RlZCB0aGF0IHVzZXJzIGNhbGxpbmcgd29sZlNTTF9jbGVhciB1cGRhdGUgdGhlIHZl
cnNpb24gb2YKID4gICAgd29sZlNTTCB1c2VkLgogPiAgLSBQb3RlbnRpYWwgRG9TIGF0dGFjayBv
biBEVExTIDEuMi4gSW4gdGhlIGNhc2Ugb2YgcmVjZWl2aW5nIGEKID4gICAgbWFsaWNpb3VzIHBs
YWludGV4dCBoYW5kc2hha2UgbWVzc2FnZSBhdCBlcG9jaCAwIHRoZSBjb25uZWN0aW9uIHdpbGwK
ID4gICAgZW50ZXIgYW4gZXJyb3Igc3RhdGUgcmVwb3J0aW5nIGEgZHVwbGljYXRlIG1lc3NhZ2Uu
IFRoaXMgYWZmZWN0cyBib3RoCiA+ICAgIHNlcnZlciBhbmQgY2xpZW50IHNpZGUuIFVzZXJzIHRo
YXQgaGF2ZSBEVExTIGVuYWJsZWQgYW5kIGluIHVzZQogPiAgICBzaG91bGQgdXBkYXRlIHRoZWly
IHZlcnNpb24gb2Ygd29sZlNTTCB0byBtaXRpZ2F0ZSB0aGUgcG90ZW50aWFsIGZvcgogPiAgICBh
IERvUyBhdHRhY2suCgogPiBodHRwczovL2dpdGh1Yi5jb20vd29sZlNTTC93b2xmc3NsL3JlbGVh
c2VzL3RhZy92NS41LjAtc3RhYmxlCgogPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5l
IDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KCkNvbW1pdHRlZCB0byAyMDIyLjA1LnggYW5k
IDIwMjIuMDIueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
