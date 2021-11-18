Return-Path: <SRS0=a43l=QF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB9EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 09:23:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A41E161B97
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 09:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A41E161B97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36B2B4025C;
	Thu, 18 Nov 2021 09:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VMiV0loP9kMv; Thu, 18 Nov 2021 09:23:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DDF04025E;
	Thu, 18 Nov 2021 09:23:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D2431BF484
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 09:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 298AD60A72
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 09:23:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CMqkCng_6Ox4 for <buildroot@lists.busybox.net>;
 Thu, 18 Nov 2021 09:23:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8BDC760809
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 09:23:02 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DE2FCE000E;
 Thu, 18 Nov 2021 09:22:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mnddC-0000BQ-4N; Thu, 18 Nov 2021 10:22:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20211117213348.231529-1-romain.naour@gmail.com>
Date: Thu, 18 Nov 2021 10:22:58 +0100
In-Reply-To: <20211117213348.231529-1-romain.naour@gmail.com> (Romain Naour's
 message of "Wed, 17 Nov 2021 22:33:48 +0100")
Message-ID: <87ee7drf65.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for-2021.08.x] support/docker: remove
 expired mozilla/DST_Root_CA_X3.crt
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPiB3
cml0ZXM6CgogPiBTaW5jZSB0aGUgMzB0aCBTZXAgMjAyMSB0aGUgZG9ja2VyIGltYWdlIHVzZWQg
dGhlIGdpdGxhYi1jaSBpcyBub3QgYWJsZQogPiB0byBkb3dubG9hZCB0aGUgdG9vbGNoYWluIGFy
Y2hpdmUgZnJvbSBodHRwczovL3Rvb2xjaGFpbnMuYm9vdGxpbi5jb20gZHVlCiA+IHRvIGFuIGV4
cGlyZWQgY2VydGlmaWNhdGUuCgogPiB3Z2V0IGh0dHBzOi8vdG9vbGNoYWlucy5ib290bGluLmNv
bS9kb3dubG9hZHMvcmVsZWFzZXMvdG9vbGNoYWlucy9hYXJjaDY0L3RhcmJhbGxzL2FhcmNoNjQt
LWdsaWJjLS1ibGVlZGluZy1lZGdlLTIwMjAuMDgtMS50YXIuYnoyCiA+IENvbm5lY3RpbmcgdG8g
dG9vbGNoYWlucy5ib290bGluLmNvbSAodG9vbGNoYWlucy5ib290bGluLmNvbSl8NTEuMjU0LjE0
OS4xOTl8OjQ0My4uLiBjb25uZWN0ZWQuCiA+IEVSUk9SOiBUaGUgY2VydGlmaWNhdGUgb2Yg4oCY
dG9vbGNoYWlucy5ib290bGluLmNvbeKAmSBpcyBub3QgdHJ1c3RlZC4KID4gRVJST1I6IFRoZSBj
ZXJ0aWZpY2F0ZSBvZiDigJh0b29sY2hhaW5zLmJvb3RsaW4uY29t4oCZIGhhcyBleHBpcmVkLgoK
ID4gUmVtb3ZlIGV4cGlyZWQgbW96aWxsYS9EU1RfUm9vdF9DQV9YMy5jcnQgWzFdLgoKID4gWzFd
IGh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vcXVlc3Rpb25zLzY5NDA4Nzc2L2hvdy10by1mb3Jj
ZS1vbGRlci1kZWJpYW4tdG8tZm9yZ2V0LWFib3V0LWRzdC1yb290LWNhLXgzLWV4cGlyYXRpb24t
YW5kLXVzZS1pc3JnCgogPiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBnbWFpbC5jb20+CiA+IENjOiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5m
cj4KID4gLS0tCiA+IEJhY2twb3J0IHRoaXMgcGF0Y2ggZm9yIDIwMjEuMDgueCBhbmQgMjAyMS4w
Mi54IHVzaW5nIGJ1aWxkcm9vdC9iYXNlOjIwMjAwODE0LjIyMjgKCkhvdyBkb2VzIHRoaXMgYWN0
dWFsbHkgd29yaz8gV2hvIGJ1aWxkcyB0aGF0IGNvbnRhaW5lcj8gRG8gd2Ugbm90IG5lZWQKYSBj
b3JyZXNwb25kaW5nIHVwZGF0ZSBvZiAuZ2l0bGFiLWNpLnltbCB0aGVuPwoKCiA+IC0tLQogPiAg
c3VwcG9ydC9kb2NrZXIvRG9ja2VyZmlsZSB8IDIgKysKID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKCiA+IGRpZmYgLS1naXQgYS9zdXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxlIGIv
c3VwcG9ydC9kb2NrZXIvRG9ja2VyZmlsZQogPiBpbmRleCBhOWJhY2NhM2EwLi5lNjVmODQwZGE4
IDEwMDY0NAogPiAtLS0gYS9zdXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxlCiA+ICsrKyBiL3N1cHBv
cnQvZG9ja2VyL0RvY2tlcmZpbGUKID4gQEAgLTQ3LDYgKzQ3LDggQEAgUlVOIGFwdC1nZXQgaW5z
dGFsbCAteSAtLW5vLWluc3RhbGwtcmVjb21tZW5kcyBcCiA+ICAgICAgICAgIHVuemlwIFwKID4g
ICAgICAgICAgd2dldCBcCiA+ICAgICAgICAgICYmIFwKID4gKyAgICBzZWQgLWkgJy9ebW96aWxs
YVwvRFNUX1Jvb3RfQ0FfWDMuY3J0JC8gcy9eLyEvJyAvZXRjL2NhLWNlcnRpZmljYXRlcy5jb25m
ICYmIFwKID4gKyAgICB1cGRhdGUtY2EtY2VydGlmaWNhdGVzICYmIFwKCkFsdGVybmF0aXZlbHkg
d2UgY291bGQganVzdCB1cGRhdGUgdG8gdGhlIGxhdGVzdCBzdHJldGNoIHJlbGVhc2UgaW5zdGVh
ZApvZiB0aGlzIHNuYXBzaG90IGZyb20gMjAxNzoKCmRvY2tlciBydW4gLS1ybSAtaXQgZGViaWFu
OjkuMTMKcm9vdEA0MmVjNWNhNzVmMGE6LyMgYXB0LWdldCB1cGRhdGUgJiYgXAogIGFwdC1nZXQg
aW5zdGFsbCAteSAtLW5vLWluc3RhbGwtcmVjb21tZW5kcyBjYS1jZXJ0aWZpY2F0ZXMgd2dldAoK
cm9vdEA0MmVjNWNhNzVmMGE6LyMgd2dldCBodHRwczovL3Rvb2xjaGFpbnMuYm9vdGxpbi5jb20v
ZG93bmxvYWRzL3JlbGVhc2VzL3Rvb2xjaGFpbnMvYWFyY2g2NC90YXJiYWxscy9hYXJjaDY0LS1n
bGliYy0tYmxlZWRpbmctZWRnZS0yMDIwLjA4LTEudGFyLmJ6MgotLTIwMjEtMTEtMTggMDk6MjA6
MDMtLSAgaHR0cHM6Ly90b29sY2hhaW5zLmJvb3RsaW4uY29tL2Rvd25sb2Fkcy9yZWxlYXNlcy90
b29sY2hhaW5zL2FhcmNoNjQvdGFyYmFsbHMvYWFyY2g2NC0tZ2xpYmMtLWJsZWVkaW5nLWVkZ2Ut
MjAyMC4wOC0xLnRhci5iejIKUmVzb2x2aW5nIHRvb2xjaGFpbnMuYm9vdGxpbi5jb20gKHRvb2xj
aGFpbnMuYm9vdGxpbi5jb20pLi4uIDUxLjI1NC4xNDkuMTk5CkNvbm5lY3RpbmcgdG8gdG9vbGNo
YWlucy5ib290bGluLmNvbSAodG9vbGNoYWlucy5ib290bGluLmNvbSl8NTEuMjU0LjE0OS4xOTl8
OjQ0My4uLiBjb25uZWN0ZWQuCkhUVFAgcmVxdWVzdCBzZW50LCBhd2FpdGluZyByZXNwb25zZS4u
LiAyMDAgT0sKTGVuZ3RoOiAxMjc0NTY1NjMgKDEyMk0pIFthcHBsaWNhdGlvbi94LWJ6aXAyXQpT
YXZpbmcgdG86ICdhYXJjaDY0LS1nbGliYy0tYmxlZWRpbmctZWRnZS0yMDIwLjA4LTEudGFyLmJ6
MicKCmluZy1lZGdlLTIwMjAuMDgtMS50ICA4NSVbPT09PT09PT09PT09PT09PT09PiAgICBdIDEw
My41MU0gIDE2LjlNQi9zICAgIGV0YSAxcyAgICAgRgphYXJjaDY0LS1nbGliYy0tYmxlZSAxMDAl
Wz09PT09PT09PT09PT09PT09PT09PT0+XSAxMjEuNTVNICAxNi42TUIvcyAgICBpbiA3LjRzCgoy
MDIxLTExLTE4IDA5OjIwOjEwICgxNi41IE1CL3MpIC0gJ2FhcmNoNjQtLWdsaWJjLS1ibGVlZGlu
Zy1lZGdlLTIwMjAuMDgtMS50YXIuYnoyJyBzYXZlZCBbMTI3NDU2NTYzLzEyNzQ1NjU2M10KCi0t
IApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
