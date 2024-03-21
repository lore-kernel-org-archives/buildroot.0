Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A56C54E58
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 20:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A2BF82273;
	Thu, 21 Mar 2024 20:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Msjg_72gT82b; Thu, 21 Mar 2024 20:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29B76822CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29B76822CA;
	Thu, 21 Mar 2024 20:27:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B6FD1BF2BD
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 20:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07E4D4152A
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 20:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gFJTNMdbMvmk for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 20:27:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C52C1414D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C52C1414D1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C52C1414D1
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 20:27:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FD44C0003;
 Thu, 21 Mar 2024 20:27:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rnP0E-005XFt-20;
 Thu, 21 Mar 2024 21:27:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
References: <20240314161620.5779-1-sebastien.szymanski@armadeus.com>
Date: Thu, 21 Mar 2024 21:27:06 +0100
In-Reply-To: <20240314161620.5779-1-sebastien.szymanski@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Thu, 14 Mar 2024
 17:16:20 +0100")
Message-ID: <871q8372lh.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
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
dHRlZCB0byAyMDI0LjAyLngsIDIwMjMuMDIueCBhbmQgMjAyMy4xMS54LCB0aGFua3MuCgotLSAK
QnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
