Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B74C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 21:38:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DB2F60F46
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 21:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DB2F60F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F09F241585;
	Fri, 30 Jul 2021 21:38:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W8jQgMxjdqhk; Fri, 30 Jul 2021 21:38:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63F9441583;
	Fri, 30 Jul 2021 21:38:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0C51BF488
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 21:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F40F40568
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 21:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S1pffBx7nd5I for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 21:37:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1549F4026A
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 21:37:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 06DC620002;
 Fri, 30 Jul 2021 21:37:14 +0000 (UTC)
Date: Fri, 30 Jul 2021 23:37:13 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian Stewart <christian@paral.in>
Message-ID: <20210730233713.5bb1a5f7@windsurf>
In-Reply-To: <20210729224949.394669-1-christian@paral.in>
References: <20210729224949.394669-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump version to
 1.16.6
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

T24gVGh1LCAyOSBKdWwgMjAyMSAxNTo0OTo0OSAtMDcwMApDaHJpc3RpYW4gU3Rld2FydCA8Y2hy
aXN0aWFuQHBhcmFsLmluPiB3cm90ZToKCj4gVGhlc2UgbWlub3IgcmVsZWFzZXMgaW5jbHVkZSBh
IHNlY3VyaXR5IGZpeCBhY2NvcmRpbmcgdG8gdGhlIG5ldyBzZWN1cml0eSBwb2xpY3kgKCM0NDkx
OCkuCj4gCj4gY3J5cHRvL3RscyBjbGllbnRzIGNhbiBwYW5pYyB3aGVuIHByb3ZpZGVkIGEgY2Vy
dGlmaWNhdGUgb2YgdGhlIHdyb25nIHR5cGUgZm9yIHRoZSBuZWdvdGlhdGVkIHBhcmFtZXRlcnMu
Cj4gbmV0L2h0dHAgY2xpZW50cyBwZXJmb3JtaW5nIEhUVFBTIHJlcXVlc3RzIGFyZSBhbHNvIGFm
ZmVjdGVkLiBUaGUgcGFuaWMgY2FuIGJlIHRyaWdnZXJlZCBieSBhbiBhdHRhY2tlcgo+IGluIGEg
cHJpdmlsZWdlZCBuZXR3b3JrIHBvc2l0aW9uIHdpdGhvdXQgYWNjZXNzIHRvIHRoZSBzZXJ2ZXIg
Y2VydGlmaWNhdGUncyBwcml2YXRlIGtleSwgYXMgbG9uZyBhcyBhIHRydXN0ZWQKPiBFQ0RTQSBv
ciBFZDI1NTE5IGNlcnRpZmljYXRlIGZvciB0aGUgc2VydmVyIGV4aXN0cyAob3IgY2FuIGJlIGlz
c3VlZCksIG9yIHRoZSBjbGllbnQgaXMgY29uZmlndXJlZCB3aXRoCj4gQ29uZmlnLkluc2VjdXJl
U2tpcFZlcmlmeS4gQ2xpZW50cyB0aGF0IGRpc2FibGUgYWxsIFRMU19SU0EgY2lwaGVyIHN1aXRl
cyAodGhhdCBpcywgVExTIDEuMOKAkzEuMiBjaXBoZXIKPiBzdWl0ZXMgd2l0aG91dCBFQ0RIRSks
IGFzIHdlbGwgYXMgVExTIDEuMy1vbmx5IGNsaWVudHMsIGFyZSB1bmFmZmVjdGVkLgo+IAo+IFRo
aXMgaXMgQ1ZFLTIwMjEtMzQ1NTguCj4gCj4gVmlldyB0aGUgcmVsZWFzZSBub3RlcyBmb3IgbW9y
ZSBpbmZvcm1hdGlvbjoKPiAKPiBodHRwczovL2dvbGFuZy5vcmcvZG9jL2RldmVsL3JlbGVhc2Uu
aHRtbCNnbzEuMTYubWlub3IKPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3Rld2FydCA8
Y2hyaXN0aWFuQHBhcmFsLmluPgo+IC0tLQo+ICBwYWNrYWdlL2dvL2dvLmhhc2ggfCAyICstCj4g
IHBhY2thZ2UvZ28vZ28ubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKVGhvbWFz
Ci0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
