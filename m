Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9188DD59F74
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 20:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DDBF606EC;
	Wed,  6 Nov 2024 20:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hhw9TYv6I9w8; Wed,  6 Nov 2024 20:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EC706070B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EC706070B;
	Wed,  6 Nov 2024 20:49:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 229B43B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 104286070B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id soQPsdMwjCEh for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 20:49:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4441E606EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4441E606EC
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4441E606EC
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:49:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D76DAC0002;
 Wed,  6 Nov 2024 20:49:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1t8myK-000Y0K-2A;
 Wed, 06 Nov 2024 21:49:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Cc: Bryan Brattlof <bb@ti.com>,  Xuanhao Shi <X15000177@gmail.com>,  Anand
 Gadiyar <gadiyar@ti.com>
References: <20241010-uboot-bump-v1-0-287ffa07e49e@ti.com>
 <20241010-uboot-bump-v1-1-287ffa07e49e@ti.com>
Date: Wed, 06 Nov 2024 21:49:48 +0100
In-Reply-To: <20241010-uboot-bump-v1-1-287ffa07e49e@ti.com> (Bryan Brattlof
 via buildroot's message of "Thu, 10 Oct 2024 18:39:22 -0500")
Message-ID: <87h68kdr4j.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/3] boot/uboot: update link to the U-Boot
 docs
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

>>>>> "Bryan" == Bryan Brattlof via buildroot <buildroot@buildroot.org> writes:

 > The denx.de/wiki/U-Boot link now redirects to docs.u-boot.org/en/latest
 > Replace the link to the new location for the U-Boot documentation

 > Signed-off-by: Bryan Brattlof <bb@ti.com>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
