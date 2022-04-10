Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BC3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 21:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87D1B60BA4;
	Sun, 10 Apr 2022 21:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1AUuLSwqeBpx; Sun, 10 Apr 2022 21:00:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC22960BBF;
	Sun, 10 Apr 2022 21:00:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 785B61BF3E1
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66A7060B32
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:00:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xmk5C3R6eLKa for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 21:00:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DAFB60746
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 21:00:25 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 358F41C0006;
 Sun, 10 Apr 2022 21:00:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ndefW-005c9d-Bk; Sun, 10 Apr 2022 23:00:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Fran=C3=A7ois?= Perrad <francois.perrad@gadz.org>
References: <20220406194148.39490-1-fontaine.fabrice@gmail.com>
 <CAB0FRss=Wd+6OL6yAh541_z7ZtCj_unuTBe5OVsd_oMZ2v+fTw@mail.gmail.com>
Date: Sun, 10 Apr 2022 23:00:22 +0200
In-Reply-To: <CAB0FRss=Wd+6OL6yAh541_z7ZtCj_unuTBe5OVsd_oMZ2v+fTw@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Thu, 7 Apr 2022
 07:43:48 +0200")
Message-ID: <8735ikmz6h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libressl: bump to version 3.5.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZyYW7Dp29pcyIgPT0gRnJhbsOnb2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdh
ZHoub3JnPiB3cml0ZXM6CgogPiBUaGlzIHZlcnNpb24gMy41LjEgKGxpa2UgMy41LjAsIDMuNC4w
KSBpcyBhIGRldmVsb3BtZW50IHJlbGVhc2UsIG5vdCBhCiA+IHN0YWJsZSByZWxlYXNlLgoKQ29y
cmVjdC4gTWF5YmUgd2Ugc2hvdWxkIGluc3RlYWQgbGV0IHB1cmUtZnRwZCBzZWxlY3QKQlIyX1BB
Q0tBR0VfT1BFTlNTTF9GT1JDRV9MSUJPUEVOU1NMPwoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJk
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
