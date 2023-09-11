Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22984EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C883941523;
	Mon, 11 Sep 2023 19:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C883941523
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GQ9CRBc98Ews; Mon, 11 Sep 2023 19:20:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2316041517;
	Mon, 11 Sep 2023 19:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2316041517
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9AF521BF2BB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8244A414D8
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8244A414D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cKu4Amtj4OuN for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:20:19 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A6D14150A
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A6D14150A
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF653240002;
 Mon, 11 Sep 2023 19:19:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfmRq-00Fjwh-W1; Mon, 11 Sep 2023 21:19:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Cl=C3=A9ment?= Ramirez via buildroot <buildroot@buildroot.org>
References: <20230809074916.305728-1-clement.ramirez@bootlin.com>
Date: Mon, 11 Sep 2023 21:19:50 +0200
In-Reply-To: <20230809074916.305728-1-clement.ramirez@bootlin.com>
 (=?utf-8?Q?=22Cl=C3=A9ment?=
 Ramirez via buildroot"'s message of "Wed, 9 Aug 2023 09:49:16 +0200")
Message-ID: <87bke8a561.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/dav1d: add DAV1D_CPE_ID_VENDOR
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 =?utf-8?Q?Cl=C3=A9ment?= Ramirez <clement.ramirez@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkNsw6ltZW50IiA9PSBDbMOpbWVudCBSYW1pcmV6IHZpYSBidWlsZHJvb3QgPGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6CgogPiBjcGU6Mi4zOmE6dmlkZW9sYW46ZGF2MWQg
aXMgYSB2YWxpZCBpZGVudGlmaWVyIGZvcgogPiB0aGlzIHBhY2thZ2U6CiA+IGh0dHBzOi8vbnZk
Lm5pc3QuZ292L3Byb2R1Y3RzL2NwZS9zZWFyY2gvcmVzdWx0cz9uYW1pbmdGb3JtYXQ9Mi4zJmtl
eXdvcmQ9ZGF2MWQKCiA+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFJhbWlyZXogPGNsZW1lbnQu
cmFtaXJlekBib290bGluLmNvbT4KCkNvbW1pdHRlZCB0byAyMDIzLjAyLnggYW5kIDIwMjMuMDUu
eCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
