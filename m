Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D57C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 16:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F620408E1;
	Sat,  8 Jun 2024 16:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z236_Fr_Rew3; Sat,  8 Jun 2024 16:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBC68408FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBC68408FB;
	Sat,  8 Jun 2024 16:54:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F420C1BF414
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 16:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E13B340118
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 16:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M82C-Od1tdes for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 16:54:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF73440021
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF73440021
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF73440021
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 16:54:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FA0960003;
 Sat,  8 Jun 2024 16:54:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFzKf-0026sG-37;
 Sat, 08 Jun 2024 18:54:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Gero =?utf-8?Q?Schw=C3=A4ricke?= via buildroot <buildroot@buildroot.org>
References: <20240531203110.2395842-1-gero.schwaericke@grandcentrix.net>
Date: Sat, 08 Jun 2024 18:54:21 +0200
In-Reply-To: <20240531203110.2395842-1-gero.schwaericke@grandcentrix.net>
 ("Gero =?utf-8?Q?Schw=C3=A4ricke?= via buildroot"'s message of "Fri, 31 May
 2024 22:31:00 +0200")
Message-ID: <87tti3xtmq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.19.x, 5.4.x,
 5.10.x, 5.15.x, 6.1.x, 6.6.x, 6.8.x series
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
Cc: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkdlcm8iID09IEdlcm8gU2Nod8Okcmlja2UgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290
QGJ1aWxkcm9vdC5vcmc+IHdyaXRlczoKCiA+IFNpZ25lZC1vZmYtYnk6IEdlcm8gU2Nod8Okcmlj
a2UgPGdlcm8uc2Nod2Flcmlja2VAZ3JhbmRjZW50cml4Lm5ldD4KCkNvbW1pdHRlZCB0byAyMDI0
LjAyLnggd2l0aG91dCB0aGUgNi44LnggdXBkYXRlLCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBL
b3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
