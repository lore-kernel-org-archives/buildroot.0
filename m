Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D89C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 19:48:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DE99610C8
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 19:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DE99610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DBC24044B;
	Thu,  7 Oct 2021 19:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DJQ7GxPgDtJn; Thu,  7 Oct 2021 19:48:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76EAA40403;
	Thu,  7 Oct 2021 19:48:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 816BB1BF29A
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 19:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CCE240403
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 19:48:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id waftm0NIo6BU for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 19:48:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 549E8403F8
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 19:48:54 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id F0862E0007;
 Thu,  7 Oct 2021 19:48:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mYZNp-0001Po-OL; Thu, 07 Oct 2021 21:48:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
References: <20210928153813.1593886-1-fido_max@inbox.ru>
Date: Thu, 07 Oct 2021 21:48:49 +0200
In-Reply-To: <20210928153813.1593886-1-fido_max@inbox.ru> (Maxim Kochetkov via
 buildroot's message of "Tue, 28 Sep 2021 18:38:13 +0300")
Message-ID: <87sfxc1uqm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.1.4
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Maxim" == Maxim Kochetkov via buildroot <buildroot@buildroot.org> writes:

 > Release-notes: https://git.osgeo.org/gitea/postgis/postgis/raw/tag/3.1.4/NEWS
 > Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Committed to 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
