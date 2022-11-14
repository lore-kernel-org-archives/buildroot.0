Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B29CC43219
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 15:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13B8C40A13;
	Mon, 14 Nov 2022 15:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13B8C40A13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gvToq8X6nQFL; Mon, 14 Nov 2022 15:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DD16408B8;
	Mon, 14 Nov 2022 15:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DD16408B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FBB61BF2C5
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 15:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8889E60BE7
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 15:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8889E60BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tSGDxvsqPYUT for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 15:47:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6048D6074C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6048D6074C
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 15:47:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 338C740009;
 Mon, 14 Nov 2022 15:47:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oubg5-006zOf-CY; Mon, 14 Nov 2022 16:47:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221103225224.6375-1-fontaine.fabrice@gmail.com>
Date: Mon, 14 Nov 2022 16:47:17 +0100
In-Reply-To: <20221103225224.6375-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 3 Nov 2022 23:52:24 +0100")
Message-ID: <87mt8tk06y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wolfssl: bump to version 5.5.3
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
aWwuY29tPiB3cml0ZXM6CgogPiBGaXggZm9yIHBvc3NpYmxlIGJ1ZmZlciB6ZXJvaXphdGlvbiBv
dmVycnVuIGludHJvZHVjZWQgYXQgdGhlIGVuZCBvZgogPiB2NS41LjIgcmVsZWFzZSBjeWNsZSBp
biBHaXRIdWIgcHVsbCByZXF1ZXN0IDU3NDMgKCM1NzQzKSBhbmQgZml4ZWQgaW4KID4gcHVsbCBy
ZXF1ZXN0IDU3NTcgKCM1NzU3KS4gSW4gdGhlIGNhc2Ugd2hlcmUgYSBzcGVjaWZpYyBtZW1vcnkK
ID4gYWxsb2NhdGlvbiBmYWlsZWQgb3IgYSBoYXJkd2FyZSBmYXVsdCBoYXBwZW5lZCB0aGVyZSB3
YXMgdGhlIHBvdGVudGlhbAogPiBmb3IgYW4gb3ZlcnJ1biBvZiAw4oCZcyB3aGVuIG1hc2tpbmcg
dGhlIGJ1ZmZlciB1c2VkIGZvciAoRClUTFMgMS4yIGFuZAogPiBsb3dlciBvcGVyYXRpb25zLiAo
RClUTFMgMS4zIG9ubHkgYW5kIGNyeXB0byBvbmx5IHVzZXJzIGFyZSBub3QgYWZmZWN0ZWQKID4g
YnkgdGhlIGlzc3VlLiBUaGlzIGlzIG5vdCByZWxhdGVkIGluIGFueSB3YXkgdG8gcmVjZW50IGlz
c3VlcyByZXBvcnRlZAogPiBpbiBPcGVuU1NMLgoKID4gaHR0cHM6Ly9naXRodWIuY29tL3dvbGZT
U0wvd29sZnNzbC9yZWxlYXNlcy90YWcvdjUuNS4zLXN0YWJsZQoKID4gU2lnbmVkLW9mZi1ieTog
RmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CgpDb21taXR0ZWQg
dG8gMjAyMi4wOC54IGFuZCAyMDIyLjAyLngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNn
YWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
