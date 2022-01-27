Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAD8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 10:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E3FF40B8C;
	Thu, 27 Jan 2022 10:53:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1N4E3nWh71BO; Thu, 27 Jan 2022 10:53:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49FCB4036A;
	Thu, 27 Jan 2022 10:52:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D98761BF421
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 10:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3D2460F3D
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 10:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PEhOva64DWD6 for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 10:52:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5677360EF4
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 10:52:55 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2FB2F60003;
 Thu, 27 Jan 2022 10:52:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nD2Oa-0004V7-3u; Thu, 27 Jan 2022 11:52:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20220109093735.4860-1-peter@korsgaard.com>
Date: Thu, 27 Jan 2022 11:52:52 +0100
In-Reply-To: <20220109093735.4860-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 9 Jan 2022 10:37:33 +0100")
Message-ID: <87wnilbgcb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/poppler: use HTTPS for upstream URL
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdy
aXRlczoKCiA+IEZpeGVzOgogPiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0
cy8xNDUvMTQ1NmY5NTEyMzcxZWNiNWEwYTM3NDk0MzE3OGU0YmQ3YjA5NjdlOC8KCiA+IFRoZSBI
VFRQIFVSTCByZXR1cm5zIGEgMzA4IHJlZGlyZWN0IHRvIEhUVFBTLCB3aGljaCBjb25mdXNlcyBv
bGQgd2dldAogPiB2ZXJzaW9ucyAoRS5HLiAgcy5iLm8pOgoKID4gd2dldCAtZCBodHRwOi8vcG9w
cGxlci5mcmVlZGVza3RvcC5vcmcvcG9wcGxlci0yMS4xMi4wLnRhci54egogPiBERUJVRyBvdXRw
dXQgY3JlYXRlZCBieSBXZ2V0IDEuMTQgb24gbGludXgtZ251LgoKID4gVVJJIGVuY29kaW5nID0g
4oCYVVRGLTjigJkKID4gQ29udmVydGVkIGZpbGUgbmFtZSAncG9wcGxlci0yMS4xMi4wLnRhci54
eicgKFVURi04KSAtPiAncG9wcGxlci0yMS4xMi4wLnRhci54eicgKFVURi04KQogPiBDb252ZXJ0
ZWQgZmlsZSBuYW1lICdwb3BwbGVyLTIxLjEyLjAudGFyLnh6JyAoVVRGLTgpIC0+ICdwb3BwbGVy
LTIxLjEyLjAudGFyLnh6JyAoVVRGLTgpCiA+IC0tMjAyMi0wMS0wOSAwOToyODowMi0tICBodHRw
Oi8vcG9wcGxlci5mcmVlZGVza3RvcC5vcmcvcG9wcGxlci0yMS4xMi4wLnRhci54egogPiBSZXNv
bHZpbmcgcG9wcGxlci5mcmVlZGVza3RvcC5vcmcgKHBvcHBsZXIuZnJlZWRlc2t0b3Aub3JnKS4u
LiAxNDcuNzUuMTk4LjE1NgogPiBDYWNoaW5nIHBvcHBsZXIuZnJlZWRlc2t0b3Aub3JnID0+IDE0
Ny43NS4xOTguMTU2CiA+IENvbm5lY3RpbmcgdG8gcG9wcGxlci5mcmVlZGVza3RvcC5vcmcgKHBv
cHBsZXIuZnJlZWRlc2t0b3Aub3JnKXwxNDcuNzUuMTk4LjE1Nnw6ODAuLi4gY29ubmVjdGVkLgog
PiBDcmVhdGVkIHNvY2tldCAzLgogPiBSZWxlYXNpbmcgMHgwMDAwMDAwMDAxY2VkYTgwIChuZXcg
cmVmY291bnQgMSkuCgogPiAtLS1yZXF1ZXN0IGJlZ2luLS0tCiA+IEdFVCAvcG9wcGxlci0yMS4x
Mi4wLnRhci54eiBIVFRQLzEuMQogPiBVc2VyLUFnZW50OiBXZ2V0LzEuMTQgKGxpbnV4LWdudSkK
ID4gQWNjZXB0OiAqLyoKID4gSG9zdDogcG9wcGxlci5mcmVlZGVza3RvcC5vcmcKID4gQ29ubmVj
dGlvbjogS2VlcC1BbGl2ZQoKID4gLS0tcmVxdWVzdCBlbmQtLS0KID4gSFRUUCByZXF1ZXN0IHNl
bnQsIGF3YWl0aW5nIHJlc3BvbnNlLi4uCiA+IC0tLXJlc3BvbnNlIGJlZ2luLS0tCiA+IEhUVFAv
MS4xIDMwOCBQZXJtYW5lbnQgUmVkaXJlY3QKID4gRGF0ZTogU3VuLCAwOSBKYW4gMjAyMiAwOToy
ODowMiBHTVQKID4gQ29udGVudC1UeXBlOiB0ZXh0L2h0bWwKID4gQ29udGVudC1MZW5ndGg6IDE2
NAogPiBDb25uZWN0aW9uOiBrZWVwLWFsaXZlCiA+IExvY2F0aW9uOiBodHRwczovL3BvcHBsZXIu
ZnJlZWRlc2t0b3Aub3JnL3BvcHBsZXItMjEuMTIuMC50YXIueHoKCiA+IC0tLXJlc3BvbnNlIGVu
ZC0tLQogPiAzMDggUGVybWFuZW50IFJlZGlyZWN0CiA+IFJlZ2lzdGVyZWQgc29ja2V0IDMgZm9y
IHBlcnNpc3RlbnQgcmV1c2UuCiA+IFNraXBwaW5nIDE2NCBieXRlcyBvZiBib2R5OiBbPGh0bWw+
CiA+IDxoZWFkPjx0aXRsZT4zMDggUGVybWFuZW50IFJlZGlyZWN0PC90aXRsZT48L2hlYWQ+CiA+
IDxib2R5PgogPiA8Y2VudGVyPjxoMT4zMDggUGVybWFuZW50IFJlZGlyZWN0PC9oMT48L2NlbnRl
cj4KID4gPGhyPjxjZW50ZXI+bmdpbng8L2NlbnRlcj4KID4gPC9ib2R5PgogPiA8L2h0bWw+CiA+
IF0gZG9uZS4KID4gMjAyMi0wMS0wOSAwOToyODowMiBFUlJPUiAzMDg6IFBlcm1hbmVudCBSZWRp
cmVjdC4KCiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJk
LmNvbT4KCkNvbW1pdHRlZCB0byAyMDIxLjAyLnggYW5kIDIwMjEuMTEueCwgdGhhbmtzLgoKLS0g
CkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
