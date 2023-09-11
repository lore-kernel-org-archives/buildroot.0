Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E60C71153
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53BFC414FD;
	Mon, 11 Sep 2023 19:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53BFC414FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HTXYvzttUjZA; Mon, 11 Sep 2023 19:20:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1973414E7;
	Mon, 11 Sep 2023 19:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1973414E7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D51D91BF2BB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6A004188B
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6A004188B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CaRujU20GfyT for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:20:06 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77E1341829
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77E1341829
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6335FF80D;
 Mon, 11 Sep 2023 19:19:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfmRl-00Fjwd-TG; Mon, 11 Sep 2023 21:19:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Cl=C3=A9ment?= Ramirez via buildroot <buildroot@buildroot.org>
References: <20230809061501.300165-1-clement.ramirez@bootlin.com>
Date: Mon, 11 Sep 2023 21:19:45 +0200
In-Reply-To: <20230809061501.300165-1-clement.ramirez@bootlin.com>
 (=?utf-8?Q?=22Cl=C3=A9ment?=
 Ramirez via buildroot"'s message of "Wed, 9 Aug 2023 08:15:01 +0200")
Message-ID: <87fs3ka566.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/diffutils: add
 DIFFUTILS_CPE_ID_VENDOR
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
Cc: =?utf-8?Q?Cl=C3=A9ment?= Ramirez <clement.ramirez@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkNsw6ltZW50IiA9PSBDbMOpbWVudCBSYW1pcmV6IHZpYSBidWlsZHJvb3QgPGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6CgogPiBjcGU6Mi4zOmE6Z251OmRpZmZ1dGlscyBp
cyBhIHZhbGlkIGlkZW50aWZpZXIgZm9yCiA+IHRoaXMgcGFja2FnZToKID4gaHR0cHM6Ly9udmQu
bmlzdC5nb3YvcHJvZHVjdHMvY3BlL3NlYXJjaC9yZXN1bHRzP25hbWluZ0Zvcm1hdD0yLjMma2V5
d29yZD1kaWZmdXRpbHMKCiA+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFJhbWlyZXogPGNsZW1l
bnQucmFtaXJlekBib290bGluLmNvbT4KCkNvbW1pdHRlZCB0byAyMDIzLjAyLnggYW5kIDIwMjMu
MDUueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
