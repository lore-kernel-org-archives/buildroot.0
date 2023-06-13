Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006D8EB64D7
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 21:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 717094028F;
	Tue, 13 Jun 2023 21:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 717094028F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lEbCucb0jxUw; Tue, 13 Jun 2023 21:54:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCC00403C8;
	Tue, 13 Jun 2023 21:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCC00403C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62B701BF2A6
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 21:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C0A360A9F
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 21:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C0A360A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M9uqBtM2qa6L for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 21:54:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE6F060A89
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE6F060A89
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 21:54:42 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FEEFFF803;
 Tue, 13 Jun 2023 21:54:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q9ByI-004tSc-IB; Tue, 13 Jun 2023 23:54:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230613072806.999946-1-peter@korsgaard.com>
Date: Tue, 13 Jun 2023 23:54:38 +0200
In-Reply-To: <20230613072806.999946-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 13 Jun 2023 09:28:05 +0200")
Message-ID: <87sfavt4dd.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/cups: security bump to version 2.4.4
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdy
aXRlczoKCiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgc2VjdXJpdHkgaXNzdWVzOgogPiAtIENWRS0y
MDIzLTMyMzI0OiBIZWFwIGJ1ZmZlciBvdmVyZmxvdyBpbiBjdXBzZAogPiAgIGh0dHBzOi8vZ2l0
aHViLmNvbS9PcGVuUHJpbnRpbmcvY3Vwcy9zZWN1cml0eS9hZHZpc29yaWVzL0dIU0EtY3hjNi13
Mmc3LTY5cDcKCiA+IEFuZCBhIG51bWJlciBvZiBvdGhlciBmaXhlcywgc2VlIHRoZSByZWxlYXNl
IG5vdGVzIGZvciBkZXRhaWxzOgogPiBodHRwczovL2dpdGh1Yi5jb20vT3BlblByaW50aW5nL2N1
cHMvcmVsZWFzZXMvdGFnL3YyLjQuMwoKID4gSW4gYWRkaXRpb24sIDIuNC40IGZpeGVzIGEgc2Vn
ZmF1bHQgcmVncmVzc2lvbiBpbiAyLjQuMzoKID4gaHR0cHM6Ly9naXRodWIuY29tL09wZW5Qcmlu
dGluZy9jdXBzL3JlbGVhc2VzL3RhZy92Mi40LjQKCiA+IFVwZGF0ZSBOT1RJQ0UgaGFzaCBmb3Ig
YSBjaGFuZ2UgaW4gY29weXJpZ2h0IHllYXJzOgogPiAtQ29weXJpZ2h0IMKpIDIwMjAtMjAyMiBi
eSBPcGVuUHJpbnRpbmcKID4gK0NvcHlyaWdodCDCqSAyMDIwLTIwMjMgYnkgT3BlblByaW50aW5n
CgogPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+
CgpDb21taXR0ZWQsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
