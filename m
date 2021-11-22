Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C132C433FE
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 21:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CD894038D;
	Mon, 22 Nov 2021 21:33:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mxv17k9ryEQ2; Mon, 22 Nov 2021 21:33:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95F1A4035D;
	Mon, 22 Nov 2021 21:33:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D60B01BF82C
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 21:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE4A460646
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 21:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9w_8s_LBPnE3 for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 21:33:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A82D60629
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 21:33:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2024EFF805;
 Mon, 22 Nov 2021 21:33:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mpGvw-0007yR-C3; Mon, 22 Nov 2021 22:33:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
References: <20211121170534.3807972-1-ricardo.martincoski@gmail.com>
Date: Mon, 22 Nov 2021 22:33:04 +0100
In-Reply-To: <20211121170534.3807972-1-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 21 Nov 2021 14:05:34 -0300")
Message-ID: <87lf1fooz3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH-2021.08.x] package/stress-ng: fix broken URL
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJpY2FyZG8iID09IFJpY2FyZG8gTWFydGluY29za2kgPHJpY2FyZG8ubWFydGluY29z
a2lAZ21haWwuY29tPiB3cml0ZXM6CgogPiBGcm9tOiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2Vi
YXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+CiA+IERvIHRoZSBzYW1lIGFzIGNvbW1pdCAi
MTJjMDEwNzliZCBwYWNrYWdlL3N0cmVzcy1uZzogYnVtcCB0byB2ZXJzaW9uCiA+IDAuMTMuMDUi
IGRpZCBmb3IgMjAyMi4wMiBidXQgd2l0aG91dCB0aGUgdmVyc2lvbiBidW1wLgoKID4gVGhlIHBy
b2plY3QgVVJMIHJldHVybnMgNDA0IGVycm9yIGJlY2F1c2U6CgogPiBRdW90aW5nIENvbGluZyBL
aW5nOgogPiAiVW5mb3J0dW5hdGVseSB3aGVuIEkgbGVmdCBDYW5vbmljYWwgbGFzdCB3ZWVrIHRo
ZXkgcmVtb3ZlZCBteSB0YXJiYWxscyIKCiA+IFNvIHVzZSBnaXRodWIgYW5kIHVwZGF0ZSBoYXNo
LgoKID4gU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenlt
YW5za2lAYXJtYWRldXMuY29tPgogPiBDYzogQXJub3V0IFZhbmRlY2FwcGVsbGUgKEVzc2Vuc2l1
bS9NaW5kKSA8YXJub3V0QG1pbmQuYmU+CiA+IFtSaWNhcmRvOiBkbyBub3QgYnVtcCB0aGUgdmVy
c2lvbi4KID4gIFRoZXJlIHdpbGwgYmUgbm8gdmVyc2lvbiBjbGFzaCBhdCBzb3VyY2VzLmJ1aWxk
cm9vdC5uZXQgc2luY2UgdGhlIGZpbGUKID4gIGZvcm1hdCBjaGFuZ2VkXQogPiBTaWduZWQtb2Zm
LWJ5OiBSaWNhcmRvIE1hcnRpbmNvc2tpIDxyaWNhcmRvLm1hcnRpbmNvc2tpQGRhdGFjb20uY29t
LmJyPgogPiBDYzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgoKQ29tbWl0
dGVkIHRvIDIwMjEuMDIueCBhbmQgMjAyMS4wOC54LCB0aGFua3MuCgpXaGF0IGFib3V0IGEgcGF0
Y2ggZm9yIG1hc3Rlcj8KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
