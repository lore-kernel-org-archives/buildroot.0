Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48509C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 20:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0345402EF;
	Fri,  2 Aug 2024 20:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1YbrpHRoiTbA; Fri,  2 Aug 2024 20:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F10840309
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F10840309;
	Fri,  2 Aug 2024 20:30:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B5771BF37F
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 20:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1915C40309
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 20:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3Ah3EbDKkDw for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 20:30:44 +0000 (UTC)
X-Greylist: delayed 331 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 02 Aug 2024 20:30:43 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 98C0B402EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98C0B402EF
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.16.199.2;
 helo=susu.bendor.com.au; envelope-from=zoltan@bendor.com.au;
 receiver=<UNKNOWN> 
Received: from susu.bendor.com.au (susu.bendor.com.au [203.16.199.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98C0B402EF
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 20:30:43 +0000 (UTC)
Received: from mazsola (mazsola.bendor.com.au [203.16.199.5])
 by susu.bendor.com.au (Postfix) with ESMTPSA id 6772B56004D
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 06:24:32 +1000 (EST)
Date: Sat, 3 Aug 2024 06:25:08 +1000
From: =?UTF-8?B?Wm9sdMOhbiBLw7Njc2k=?= <zoltan@bendor.com.au>
To: buildroot@buildroot.org
Message-ID: <20240803062508.312de54e@mazsola>
Organization: Bendor Research Pty. Ltd.
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=bendor.com.au
Subject: [Buildroot] User mailing list?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This mailing list seems to be for Buildroot developers and maintainers.

Is there a list for the less illuminated, where stupid questions like
"my build fails and I don't know why" and "I have no idea what I'm
doing, anyone could guide me a bit" type questions can be asked?

Thanks,

Zoltan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
