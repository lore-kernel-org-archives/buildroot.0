Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49D0EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 16:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95A1840181;
	Sun, 16 Jul 2023 16:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95A1840181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nh1luDY5IVN3; Sun, 16 Jul 2023 16:20:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4FBE400FF;
	Sun, 16 Jul 2023 16:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4FBE400FF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BA421BF2F8
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05EDA606F9
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05EDA606F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QuY4JSlJhCWs for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 16:20:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C94EA6068B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C94EA6068B
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 16:20:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 186E820004;
 Sun, 16 Jul 2023 16:20:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qL4UD-00CykD-4W; Sun, 16 Jul 2023 18:20:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYp?=
 <leo@yuriev.ru>
References: <20230618144425.105081-1-leo@yuriev.ru>
Date: Sun, 16 Jul 2023 18:20:41 +0200
In-Reply-To: <20230618144425.105081-1-leo@yuriev.ru> (=?utf-8?B?ItCb0LU=?=
 =?utf-8?B?0L7QvdC40LQg0K7RgNGM0LXQsg==?= (Leonid
 Yuriev)"'s message of "Sun, 18 Jun 2023 17:44:24 +0300")
Message-ID: <87sf9nbzfq.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.12.7
 "Artek"
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gItCb0LXQvtC90LjQtCIgPT0g0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZ
dXJpZXYpIDxsZW9AeXVyaWV2LnJ1PiB3cml0ZXM6CgogPiBUaGlzIGlzIGJ1Z2ZpeCByZWxlYXNl
IG9mIHN0YWJsZSBsaWJtZGJ4IGJyYW5jaCwKID4gb24gdGhlIGRheSBvZiBpbnRlcm5hdGlvbmFs
IGNoaWxkcmVuJ3MgY2FtcCDCq0FydGVrwrsuCgogPiBJdCBpcyByZWFzb25hYmxlIHRvIGJhY2tw
b3J0IHRoaXMgcGF0Y2ggdG8gYWxsIGFwcGxpY2FibGUgcmVsZWFzZXMvYnJhbmNoZXMgb2YgQnVp
bGRyb290LgoKID4gVGhlIG1vc3Qgc2lnbmlmaWNhbnQgZml4ZXMgb2YgdjAuMTIuNzoKID4gIC0g
YWRkZWQgd29ya2Fyb3VuZCBmb3IgYnVpbGQgaXNzdWVzIHdpdGggbW9kZXJuIEdDQyB1c2luZyBg
LW0zMiAtYXJjaD1pNjg2IC1PZmFzdGAuCiA+ICAtIGZpeGVkIHRoZSBjYXVzZSBvZiB0aGUgZmFs
c2UtcG9zaXRpdmUgd2FybmluZyBvZiBtb2Rlcm4gR0NDIGluIHRoZSBDKysgQVBJLgogPiAgLSBy
ZWZpbmVkIERCIG9wZW5pbmcgaW4gInJlY292ZXJ5IiBtb2RlIGFuZCBzd2l0Y2hpbmcgdG8gYSBn
aXZlbiBtZXRhLXBhZ2UuCgogPiBUaGUgY29tcGxldGUgQ2hhbmdlTG9nOiBodHRwczovL2dpdGZs
aWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1kYngvYmxvYj9maWxlPUNoYW5nZUxvZy5tZAoKID4g
U2lnbmVkLW9mZi1ieTog0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYpIDxs
ZW9AeXVyaWV2LnJ1PgoKQ29tbWl0dGVkIHRvIDIwMjMuMDUueCwgdGhhbmtzLgoKLS0gCkJ5ZSwg
UGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
