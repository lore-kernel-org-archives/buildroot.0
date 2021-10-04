Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28DBC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 15:26:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA636139E
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 15:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BA636139E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 250AD40898;
	Mon,  4 Oct 2021 15:26:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gvmuKI4fm8Ow; Mon,  4 Oct 2021 15:26:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18DA640895;
	Mon,  4 Oct 2021 15:26:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB9691BF2FE
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 15:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB16C427E2
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 15:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xcJSZ5ze3FU6 for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 15:26:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C96A427E1
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 15:26:26 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 7CCB160010;
 Mon,  4 Oct 2021 15:26:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXPrB-0003ST-Od; Mon, 04 Oct 2021 17:26:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210919100842.2071860-1-fontaine.fabrice@gmail.com>
 <874k9xj8iy.fsf@dell.be.48ers.dk>
 <CAPi7W83=ocwDu6LUCx9A16R2Q8zm1+SPbL1kb_PQySbOrU+Giw@mail.gmail.com>
Date: Mon, 04 Oct 2021 17:26:21 +0200
In-Reply-To: <CAPi7W83=ocwDu6LUCx9A16R2Q8zm1+SPbL1kb_PQySbOrU+Giw@mail.gmail.com>
 (Fabrice Fontaine's message of "Mon, 4 Oct 2021 14:14:17 +0200")
Message-ID: <871r50izfm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptopp: bump to version 8.5.0
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
Cc: Julian Scheel <julian@jusst.de>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBMZSBsdW4uIDQgb2N0LiAyMDIxIMOgIDE0OjA5LCBQZXRlciBL
b3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IGEgw6ljcml0IDoKID4+IAogPj4gPj4+Pj4g
IkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29t
PiB3cml0ZXM6CiA+PiAKID4+ID4gaHR0cHM6Ly93d3cuY3J5cHRvcHAuY29tL3JlbGVhc2U4NTAu
aHRtbAogPj4gPiBodHRwczovL3d3dy5jcnlwdG9wcC5jb20vcmVsZWFzZTg0MC5odG1sCiA+PiAK
ID4+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBn
bWFpbC5jb20+CiA+PiAKID4+IEhtbSwgc28gOC40LjAgcmV2ZXJ0ZWQgdGhlIHNlY3VyaXR5IGZp
eCBpbiA4LjMuMD8gV2hhdCBkbyB3ZSB0aGVuIGRvPwogPj4gQnVtcCB0byA4LjUuMCBpbiBhbGwg
c3RhYmxlIGJyYW5jaGVzPwogPiBJIHdvdWxkIGFkdmlzZSB0byBidW1wIHRvIDguNi4wIGluIGFs
bCBzdGFibGUgYnJhbmNoZXMgYXMgOC42LjAgaXMgYQogPiBzZWN1cml0eSByZWxlYXNlIHRoYXQg
Y2xlYXJzIENWRS0yMDIxLTQwNTMwLgoKQWhoLCBJIGhhZG4ndCBub3RpY2VkIHRoZSA4LjYuMCBy
ZWxlYXNlLCBJJ2xsIGNoZXJyeSBwaWNrIHRoYXQgd2hlbiBJCmdldCB0aGF0IGZhciAtIFRoYW5r
cy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
