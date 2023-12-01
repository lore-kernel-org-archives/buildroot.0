Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63559C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 20:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 140BD43753;
	Fri,  1 Dec 2023 20:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 140BD43753
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pGOsjtFWktVV; Fri,  1 Dec 2023 20:10:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17D7340492;
	Fri,  1 Dec 2023 20:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17D7340492
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 171501BF2BF
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E254B40370
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E254B40370
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qxEg2yndQ__7 for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 20:10:51 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5974F40492
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 20:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5974F40492
Received: by mail.gandi.net (Postfix) with ESMTPSA id E963040007;
 Fri,  1 Dec 2023 20:10:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r99qZ-004T1K-0V;
 Fri, 01 Dec 2023 21:10:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231201073304.1599298-2-salvador.joseluis@gmail.com>
 <20231201103258.GO3177259@scaer>
Date: Fri, 01 Dec 2023 21:10:47 +0100
In-Reply-To: <20231201103258.GO3177259@scaer> (Yann E. MORIN's message of
 "Fri, 1 Dec 2023 11:32:58 +0100")
Message-ID: <871qc565vc.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/zfs: bump version to 2.2.2
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
Cc: =?utf-8?Q?Jos=C3=A9?= Luis Salvador Rufo <salvador.joseluis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
aXRlczoKCiA+IEpvc8OpLCBBbGwsCiA+IE9uIDIwMjMtMTItMDEgMDg6MzMgKzAxMDAsIEpvc8Op
IEx1aXMgU2FsdmFkb3IgUnVmbyBzcGFrZSB0aHVzbHk6CiA+PiBUaGlzIHJlbGVhc2UgY29udGFp
bnMgYW4gaW1wb3J0YW50IGZpeCBmb3IgYSBkYXRhIGNvcnJ1cHRpb24KID4+IGJ1Zy4gRnVsbCBk
ZXRhaWxzIGFyZSBpbiB0aGUgaXNzdWUgWzFdIGFuZCBidWcgZml4IFsyXS4KID4+IAogPj4gMS4g
aHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL2lzc3Vlcy8xNTUyNgogPj4gMi4gaHR0cHM6
Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3B1bGwvMTU1NzEKID4+IAogPj4gU2lnbmVkLW9mZi1i
eTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+
CgogPiBTaW5jZSB0aGlzIGlzIGEgZGF0YS1jb3JydXB0aW9uIGZpeCwgSSd2ZSBhcHBsaWVkIHRv
IG1hc3RlciwgYWZ0ZXIKID4gYmFja3BvcnRpbmcgdGhlIDIuMi4wIGJ1bXAgZnJvbSB0aGUgbmV4
dCBicmFuY2guIFRoYW5rcyEKCkNvbW1pdHRlZCB0byAyMDIzLjAyLnggYW5kIDIwMjMuMDgueCwg
dGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
