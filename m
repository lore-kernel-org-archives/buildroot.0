Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D52D637A4
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 17:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F9BA80B13;
	Wed, 13 Nov 2024 17:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vLk_Vub1SGI; Wed, 13 Nov 2024 17:55:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EC3881460
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EC3881460;
	Wed, 13 Nov 2024 17:55:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3BA36C
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 17:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94738404BC
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 17:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SwKjzX0Y7iWe for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 17:55:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 85DB6400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85DB6400F6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85DB6400F6
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 17:55:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A3AFE0004;
 Wed, 13 Nov 2024 17:55:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tBHaR-00H1jx-2l;
 Wed, 13 Nov 2024 18:55:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <AS1P250MB0608A6F40DB013B7B6024202A95A2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Date: Wed, 13 Nov 2024 18:55:27 +0100
In-Reply-To: <AS1P250MB0608A6F40DB013B7B6024202A95A2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
 (Michel Alex's message of "Wed, 13 Nov 2024 09:48:16 +0000")
Message-ID: <87ldxnxblc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/libzenoh-c: bump to version
 1.0.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Michel" == Michel Alex <Alex.Michel@wiedemann-group.com> writes:

 > https://github.com/eclipse-zenoh/zenoh-c/releases/tag/1.0.2
 > Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
