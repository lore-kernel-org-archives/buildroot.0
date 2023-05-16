Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24181C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 19:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B19EA40BAD;
	Tue, 16 May 2023 19:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B19EA40BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YcFOHzNr-GRa; Tue, 16 May 2023 19:05:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0FE240BB6;
	Tue, 16 May 2023 19:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0FE240BB6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCA251BF386
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 19:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2D3083B1D
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 19:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2D3083B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id edRmcqM3haPg for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 19:05:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 815CA83B0D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 815CA83B0D
 for <buildroot@busybox.net>; Tue, 16 May 2023 19:05:07 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E1C8FC0005;
 Tue, 16 May 2023 19:05:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pyzyo-001ZNi-St; Tue, 16 May 2023 21:05:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Fran=C3=A7ois?= Perrad <francois.perrad@gadz.org>
References: <20230429200133.152499-1-francois.perrad@gadz.org>
 <87wn1sik1p.fsf@dell.be.48ers.dk>
 <CAAE6iEVDu0uRt4OncRAs-LdgwO=oVu89h0bboxEHR=enP=eQjg@mail.gmail.com>
Date: Tue, 16 May 2023 21:05:02 +0200
In-Reply-To: <CAAE6iEVDu0uRt4OncRAs-LdgwO=oVu89h0bboxEHR=enP=eQjg@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Tue, 16 May 2023
 20:44:24 +0200")
Message-ID: <87zg64w10h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/lua: bump to version 5.4.5
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZyYW7Dp29pcyIgPT0gRnJhbsOnb2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdh
ZHoub3JnPiB3cml0ZXM6CgogPiBMZSBsdW4uIDEgbWFpIDIwMjMgw6AgMDk6MzIsIFBldGVyIEtv
cnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gYSDDqWNyaXQgOgogPj4gPj4+Pj4gIkZyYW5j
b2lzIiA9PSBGcmFuY29pcyBQZXJyYWQgPGZwZXJyYWRAZ21haWwuY29tPiB3cml0ZXM6CiA+PiAK
ID4+ID4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fk
ei5vcmc+CiA+PiAKID4+IENvbW1pdHRlZCwgdGhhbmtzLgogPj4gCiA+PiAKID4gTHVhIDUuNC41
IHdhcyBhIGZhaWx1cmUuIEFuZCBpdCB3YXMgcmV0cmFjdGVkLCBzZWUKID4gaHR0cDovL2x1YS11
c2Vycy5vcmcvbGlzdHMvbHVhLWwvMjAyMy0wNS9tc2cwMDAxNC5odG1sCgogPiBQbGVhc2UgdXBn
cmFkZSB3aXRoIEx1YSA1LjQuNiwgc2VlCiA+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMzA1MTQxNDQ1MTIuOTc5NC0xLWZyYW5jb2lzLnBl
cnJhZEBnYWR6Lm9yZy8KCkFyZ2gsIHRoYW5rcyBmb3IgdGhlIGhlYWRzIHVwIC0gV2lsbCBhcHBs
eS4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
