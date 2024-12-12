Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88C5E77180
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 11:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FCDE6066F;
	Thu, 12 Dec 2024 11:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4hIuyEWfnFK; Thu, 12 Dec 2024 11:29:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CEEE607AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CEEE607AB;
	Thu, 12 Dec 2024 11:29:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28C17113C
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 11:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18BC181D4F
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 11:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vkfHl2bTM8TV for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 11:29:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 243D081D11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 243D081D11
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 243D081D11
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 11:29:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E76F1C0003;
 Thu, 12 Dec 2024 11:29:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tLhNO-002p11-2n;
 Thu, 12 Dec 2024 12:29:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Jos=C3=A9?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Cc: buildroot@buildroot.org,  Alexander Mukhin <alexander.i.mukhin@gmail.com>
References: <20241212075557.1736787-2-salvador.joseluis@gmail.com>
Date: Thu, 12 Dec 2024 12:29:02 +0100
In-Reply-To: <20241212075557.1736787-2-salvador.joseluis@gmail.com>
 (=?utf-8?Q?=22Jos=C3=A9?=
 Luis Salvador Rufo"'s message of "Thu, 12 Dec 2024 08:55:58 +0100")
Message-ID: <87jzc5xhq9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.2.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkpvc8OpIiA9PSBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2Vs
dWlzQGdtYWlsLmNvbT4gd3JpdGVzOgoKID4gUmVtb3ZlZCBiYWNrcG9ydGVkIHBhdGNoOgogPiAt
IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9jb21taXQvYmQ5NDliMTBiZWQzZDk5ZTNi
NDAyNDlkOWM4ZDc0YTBiNDMwNDc3NC5wYXRjaAoKID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVp
cyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+CgpDb21taXR0ZWQs
IHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
