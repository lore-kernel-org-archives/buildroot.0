Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69401C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:48:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0685861354
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0685861354
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C137083DB1;
	Tue,  5 Oct 2021 14:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LuyF37q73tA6; Tue,  5 Oct 2021 14:48:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3574983DAE;
	Tue,  5 Oct 2021 14:48:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 581A71BF34A
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53AEF83DAE
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:48:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zBF56yPJWw8O for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 14:48:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EA3283DA6
 for <buildroot@busybox.net>; Tue,  5 Oct 2021 14:48:48 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 25887200005;
 Tue,  5 Oct 2021 14:48:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXlkK-0003PQ-AB; Tue, 05 Oct 2021 16:48:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@lists.buildroot.org>
References: <1b69453d90cdcf874e4545dcd60b87e9599e16d0.1632314616.git.baruch@tkos.co.il>
Date: Tue, 05 Oct 2021 16:48:44 +0200
In-Reply-To: <1b69453d90cdcf874e4545dcd60b87e9599e16d0.1632314616.git.baruch@tkos.co.il>
 (Baruch Siach via buildroot's message of "Wed, 22 Sep 2021 15:43:36
 +0300")
Message-ID: <875yubcysz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: remove Baruch Siach from
 openipmi
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

>>>>> "Baruch" == Baruch Siach via buildroot <buildroot@lists.buildroot.org> writes:

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
