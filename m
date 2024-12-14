Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675BFE7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 11:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27B29607C4;
	Sat, 14 Dec 2024 11:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZbi_H_Lb5_x; Sat, 14 Dec 2024 11:04:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 415EC607CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 415EC607CF;
	Sat, 14 Dec 2024 11:04:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 667FFCD
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 473EE607C4
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6oFRd4cATKQ for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 11:04:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 49DC7607CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49DC7607CF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49DC7607CF
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:04:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24773C0003;
 Sat, 14 Dec 2024 11:03:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tMPwE-00BSgZ-1B;
 Sat, 14 Dec 2024 12:03:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Jos=C3=A9?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Cc: buildroot@buildroot.org,  Alexander Mukhin <alexander.i.mukhin@gmail.com>
References: <20241212075557.1736787-2-salvador.joseluis@gmail.com>
 <87jzc5xhq9.fsf@dell.be.48ers.dk>
Date: Sat, 14 Dec 2024 12:03:58 +0100
In-Reply-To: <87jzc5xhq9.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Thu, 12 Dec 2024 12:29:02 +0100")
Message-ID: <87cyhuttk1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
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

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdy
aXRlczoKCj4+Pj4+ICJKb3PDqSIgPT0gSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRv
ci5qb3NlbHVpc0BnbWFpbC5jb20+IHdyaXRlczoKID4+IFJlbW92ZWQgYmFja3BvcnRlZCBwYXRj
aDoKID4+IC0gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL2NvbW1pdC9iZDk0OWIxMGJl
ZDNkOTllM2I0MDI0OWQ5YzhkNzRhMGI0MzA0Nzc0LnBhdGNoCgogPj4gU2lnbmVkLW9mZi1ieTog
Sm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+Cgog
PiBDb21taXR0ZWQsIHRoYW5rcy4KCkxvb2tpbmcgYXQgaHR0cHM6Ly9naXRodWIuY29tL29wZW56
ZnMvemZzL3JlbGVhc2VzL3RhZy96ZnMtMi4yLjcgSSBzZWUKdGhpcyBhZGRzIHN1cHBvcnQgZm9y
IExpbnV4IDYuMTEueCAvIDYuMTIueCwgc28gYXBwbGllZCB0byAyMDI0LjExLngsCnRoYW5rcy4K
Ci0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
