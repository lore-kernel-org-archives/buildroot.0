Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8639EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 18:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D42040A78;
	Mon, 11 Sep 2023 18:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D42040A78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RiWyJT7CzhF3; Mon, 11 Sep 2023 18:51:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC785403FF;
	Mon, 11 Sep 2023 18:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC785403FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D05771BF20B
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 18:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5B53410D8
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 18:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5B53410D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DqDEs_cxDFu9 for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 18:51:48 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E7A5410D4
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 18:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E7A5410D4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58ABF40008;
 Mon, 11 Sep 2023 18:51:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfm0H-00FinA-Es; Mon, 11 Sep 2023 20:51:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Cl=C3=A9ment?= Ramirez via buildroot <buildroot@buildroot.org>
References: <20230808142427.290337-1-clement.ramirez@bootlin.com>
Date: Mon, 11 Sep 2023 20:51:21 +0200
In-Reply-To: <20230808142427.290337-1-clement.ramirez@bootlin.com>
 (=?utf-8?Q?=22Cl=C3=A9ment?=
 Ramirez via buildroot"'s message of "Tue, 8 Aug 2023 16:24:27 +0200")
Message-ID: <87msxsbl1y.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/aubio: add AUBIO_CPE_ID_VENDOR
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
 =?utf-8?Q?Cl=C3=A9ment?= Ramirez <clement.ramirez@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkNsw6ltZW50IiA9PSBDbMOpbWVudCBSYW1pcmV6IHZpYSBidWlsZHJvb3QgPGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6CgogPiBjcGU6Mi4zOmE6YXViaW86YXViaW8gaXMg
YSB2YWxpZCBpZGVudGlmaWVyIGZvcgogPiB0aGlzIHBhY2thZ2U6CiA+IGh0dHBzOi8vbnZkLm5p
c3QuZ292L3Byb2R1Y3RzL2NwZS9zZWFyY2gvcmVzdWx0cz9uYW1pbmdGb3JtYXQ9Mi4zJmtleXdv
cmQ9YXViaW8KCiA+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFJhbWlyZXogPGNsZW1lbnQucmFt
aXJlekBib290bGluLmNvbT4KCkNvbW1pdHRlZCB0byAyMDIzLjAyLnggYW5kIDIwMjMuMDUueCwg
dGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
