Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357A8C54E60
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 18:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50F52410C6;
	Thu, 14 Mar 2024 18:30:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sShT6O6Qhukl; Thu, 14 Mar 2024 18:30:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F58B41477
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F58B41477;
	Thu, 14 Mar 2024 18:30:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F7F01BF422
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 18:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D5B680BD6
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 18:30:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mkwaaZZKxQ6O for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 18:30:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D460980BB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D460980BB8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D460980BB8
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 18:29:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFC8560004;
 Thu, 14 Mar 2024 18:29:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rkppz-00Ahse-0u;
 Thu, 14 Mar 2024 19:29:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
References: <20240314161620.5779-1-sebastien.szymanski@armadeus.com>
Date: Thu, 14 Mar 2024 19:29:55 +0100
In-Reply-To: <20240314161620.5779-1-sebastien.szymanski@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Thu, 14 Mar 2024
 17:16:20 +0100")
Message-ID: <87cyrwpsyk.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump to version
 2.6.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlPDqWJhc3RpZW4iID09IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5
bWFuc2tpQGFybWFkZXVzLmNvbT4gd3JpdGVzOgoKID4gU2VjdXJpdHkgZml4ZXM6CiA+IAktIENW
RS0yMDI0LTI4NzU3IC0tIFByZXZlbnQgYmlsbGlvbiBsYXVnaHMgYXR0YWNrcyB3aXRoIGlzb2xh
dGVkCiA+IAkgIHVzZSBvZiBleHRlcm5hbCBwYXJzZXJzLiAgUGxlYXNlIHNlZSB0aGUgY29tbWl0
IG1lc3NhZ2Ugb2YKID4gCSAgY29tbWl0IDFkNTBiODBjZjMxZGU4Nzc1MDEwMzY1NmY2ZWI2OTM3
NDY4NTRhYTggZm9yIGRldGFpbHMuCgogPiBodHRwczovL2Jsb2cuaGFydHdvcmsub3JnL3Bvc3Rz
L2V4cGF0LTItNi0yLXJlbGVhc2VkLwogPiBodHRwczovL2dpdGh1Yi5jb20vbGliZXhwYXQvbGli
ZXhwYXQvYmxvYi9SXzJfNl8yL2V4cGF0L0NoYW5nZXMKCiA+IFNpZ25lZC1vZmYtYnk6IFPDqWJh
c3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KCkNvbW1p
dHRlZCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
