Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0672C25B74
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 06:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEC31611CD;
	Tue,  4 Jun 2024 06:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtuAGoU8nkOv; Tue,  4 Jun 2024 06:19:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D98C360685
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D98C360685;
	Tue,  4 Jun 2024 06:19:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 669181BF2FF
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 06:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5131081A24
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 06:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vUpeLoZeXBa for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 06:19:33 +0000 (UTC)
X-Greylist: delayed 129130 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 04 Jun 2024 06:19:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 755FE81E36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 755FE81E36
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 755FE81E36
 for <buildroot@busybox.net>; Tue,  4 Jun 2024 06:19:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A1A81BF206;
 Tue,  4 Jun 2024 06:19:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sENW5-005JxE-2n;
 Tue, 04 Jun 2024 08:19:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <francois.perrad@gadz.org>
References: <20240603185750.1082857-1-francois.perrad@gadz.org>
Date: Tue, 04 Jun 2024 08:19:29 +0200
In-Reply-To: <20240603185750.1082857-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Mon, 3 Jun 2024 20:57:50 +0200")
Message-ID: <87jzj5fcwe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/open62541: bump to version 1.3.11
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Francois" == Francois Perrad <francois.perrad@gadz.org> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
