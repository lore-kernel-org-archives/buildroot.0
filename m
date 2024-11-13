Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADC3D637A4
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 17:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4075F4054D;
	Wed, 13 Nov 2024 17:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KoOhP_Pq5DoT; Wed, 13 Nov 2024 17:55:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EEAF40577
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EEAF40577;
	Wed, 13 Nov 2024 17:55:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43BB01ED6
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 17:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CFC681A24
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 17:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4uocFW7gw3AT for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 17:55:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3DA8C8149D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DA8C8149D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DA8C8149D
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 17:55:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3E1C40002;
 Wed, 13 Nov 2024 17:55:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tBHaV-00H1m9-0v;
 Wed, 13 Nov 2024 18:55:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <AS1P250MB0608D1D68E767CD11726C376A95A2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Date: Wed, 13 Nov 2024 18:55:31 +0100
In-Reply-To: <AS1P250MB0608D1D68E767CD11726C376A95A2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
 (Michel Alex's message of "Wed, 13 Nov 2024 09:48:22 +0000")
Message-ID: <87h68bxbl8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/libzenoh-pico: bump to version
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

 > https://github.com/eclipse-zenoh/zenoh-pico/releases/tag/1.0.2
 > Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
