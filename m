Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FCBC25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 15:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2CFB40226;
	Wed, 15 May 2024 15:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYJIjzmu7GI9; Wed, 15 May 2024 15:10:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC1E34033C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC1E34033C;
	Wed, 15 May 2024 15:10:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 075661BF841
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 15:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7C424033C
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 15:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MR9Nk4XwUXke for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 15:10:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E35F740226
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E35F740226
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E35F740226
 for <buildroot@buildroot.org>; Wed, 15 May 2024 15:10:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6F0D60003;
 Wed, 15 May 2024 15:10:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s7GGg-001XYx-02;
 Wed, 15 May 2024 17:10:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>
References: <20240403222513.1267595-1-gero.schwaericke@posteo.de>
Date: Wed, 15 May 2024 17:10:09 +0200
In-Reply-To: <20240403222513.1267595-1-gero.schwaericke@posteo.de> ("Gero
 =?utf-8?Q?Schw=C3=A4ricke=22's?= message of "Wed, 3 Apr 2024 22:24:44
 +0000")
Message-ID: <87cypnqffy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] configs/raspberrypizero2w_defconfig: fix
 typo in headers series option
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
Cc: Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkdlcm8iID09IEdlcm8gU2Nod8Okcmlja2UgPGdlcm8uc2Nod2Flcmlja2VAcG9zdGVv
LmRlPiB3cml0ZXM6CgogPiBUaGUgYnVpbGQgZm9yIHRoaXMgZGVmY29uZmlnIGZhaWxzIHdpdGg6
CiA+ICAgSW5jb3JyZWN0IHNlbGVjdGlvbiBvZiBrZXJuZWwgaGVhZGVyczogZXhwZWN0ZWQgNi44
LngsIGdvdCA2LjEueAoKID4gRm91bmQgd2l0aCB0aGUgZm9sbG93aW5nIGNvbW1hbmQgd2hpbGUg
dHJ5aW5nIHRvIGZpbmQgYm9hcmRzIHRoYXQgaGF2ZQogPiBtaXNzaW5nIGN1c3RvbSBoZWFkZXJz
IHNlcmllczoKCiA+ICAgZ3JlcCAtLW51bGwgLS1yZWN1cnNpdmUgLS1maWxlcy13aXRob3V0LW1h
dGNoICJCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkiIC4vY29uZmlncyBcCiA+ICAgICB8IHhhcmdz
IC0tbnVsbCBncmVwIC0tbnVsbCAtLWZpbGVzLXdpdGgtbWF0Y2hlcyAiQlIyX0xJTlVYX0tFUk5F
TF9DVVNUT01fLio9eSIgXAogPiAgICAgfCB4YXJncyAtLW51bGwgZ3JlcCAtLW51bGwgLS1maWxl
cy13aXRob3V0LW1hdGNoICJCUjJfS0VSTkVMX0hFQURFUlNfWzAtOV1cK19bMC05XVwrPXkiXAog
PiAgICAgfCB4YXJncyAtLW51bGwgZ3JlcCAtLWZpbGVzLXdpdGhvdXQtbWF0Y2ggIkJSMl9QQUNL
QUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fWzAtOV1cK19bMC05XVwrPXkiCiA+ICAgLi9j
b25maWdzL21hbmdvcGlfbXExcmR3Ml9kZWZjb25maWcgICMgcGF0Y2ggcGVuZGluZwogPiAgIC4v
Y29uZmlncy9yYXNwYmVycnlwaXplcm8yd19kZWZjb25maWcKID4gICAuL2NvbmZpZ3Mvc2lwZWVk
X2xpY2hlZXBpX25hbm9fZGVmY29uZmlnICAjIHBhdGNoIHBlbmRpbmcKCiA+IFNpZ25lZC1vZmYt
Ynk6IEdlcm8gU2Nod8Okcmlja2UgPGdlcm8uc2Nod2Flcmlja2VAcG9zdGVvLmRlPgoKQ29tbWl0
dGVkIHRvIDIwMjQuMDIueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
