Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CB4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:53:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05599611BF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05599611BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D04E8402D7;
	Tue, 19 Oct 2021 17:53:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id slKfWUtVo2Zc; Tue, 19 Oct 2021 17:53:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60477402A8;
	Tue, 19 Oct 2021 17:53:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 545AB1BF4D8
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4341640134
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hi9dHxFKTCno for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 17:53:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3902E400CB
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 17:53:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 95A8F1C0003;
 Tue, 19 Oct 2021 17:53:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mctIl-0005XL-0W; Tue, 19 Oct 2021 19:53:27 +0200
Resent-To: Alexander Dahl <post@lespocky.de>, buildroot@buildroot.org
Resent-From: Peter Korsgaard <peter@korsgaard.com>
Resent-Date: Tue, 19 Oct 2021 19:53:26 +0200
Resent-Message-ID: <875ytsc355.fsf@dell.be.48ers.dk>
X-From-Line: nobody Mon Oct 18 14:45:50 2021
From: Peter Korsgaard <peter@korsgaard.com>
To: Alexander Dahl <post@lespocky.de>
References: <20211006052717.7328-1-post@lespocky.de>
 <20211006052717.7328-3-post@lespocky.de>
Date: Mon, 18 Oct 2021 14:45:50 +0200
In-Reply-To: <20211006052717.7328-3-post@lespocky.de> (Alexander Dahl's
 message of "Wed, 6 Oct 2021 07:27:16 +0200")
Message-ID: <878ryqec1t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/dfu-util: Fix licenses
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Alexander" == Alexander Dahl <post@lespocky.de> writes:

 > Since v0.8 a script 'dfuse-pack.py' is part of the package, which has a
 > different license.

 > Fixes: c212a90b612a ("package/dfu-util: bump version to 0.8, add hash, fix SITE url")
 > Signed-off-by: Alexander Dahl <post@lespocky.de>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
