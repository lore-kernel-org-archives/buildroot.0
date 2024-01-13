Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44E2C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 13:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82E1440302;
	Sat, 13 Jan 2024 13:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82E1440302
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMGyCyRCx1VY; Sat, 13 Jan 2024 13:20:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB2D341F82;
	Sat, 13 Jan 2024 13:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB2D341F82
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BE531BF325
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0259D41F82
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0259D41F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xbK9tTRM7sGC for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 13:20:55 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 500F941F7D
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 13:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 500F941F7D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B31460003;
 Sat, 13 Jan 2024 13:20:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOdwR-00Cyc3-27;
 Sat, 13 Jan 2024 14:20:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
References: <955dd511a8904b18bce9c2ac8e27ad07c160e2b2.1704718771.git.baruch@tkos.co.il>
 <73c3bb4a908caabf868e9c966ec71081c7360d02.1704718771.git.baruch@tkos.co.il>
Date: Sat, 13 Jan 2024 14:20:51 +0100
In-Reply-To: <73c3bb4a908caabf868e9c966ec71081c7360d02.1704718771.git.baruch@tkos.co.il>
 (Baruch Siach via buildroot's message of "Mon, 8 Jan 2024 14:59:31
 +0200")
Message-ID: <87il3xv07g.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/rng-tools: normalize github
 macro package name
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

>>>>> "Baruch" == Baruch Siach via buildroot <buildroot@buildroot.org> writes:

 > This usage of <PKG>_NAME was introduced in commit f9e9c6349afe0
 > ("package/rng-tools: bump to 6.7"). No other package uses <PKG>_NAME
 > this way.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
