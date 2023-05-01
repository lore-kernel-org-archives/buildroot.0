Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E914C77B73
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 11:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0391E40A21;
	Mon,  1 May 2023 11:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0391E40A21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L-GCqcR8rn4v; Mon,  1 May 2023 11:39:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D806409AD;
	Mon,  1 May 2023 11:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D806409AD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E05AF1BF336
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 11:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA8D881F4B
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 11:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA8D881F4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t1QzlQvZ0B82 for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 11:39:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8833181F1D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8833181F1D
 for <buildroot@buildroot.org>; Mon,  1 May 2023 11:39:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D2581BF203;
 Mon,  1 May 2023 11:39:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ptRse-006kQS-3A; Mon, 01 May 2023 13:39:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
References: <20230428071618.805982-1-xiangyu.chen@eng.windriver.com>
Date: Mon, 01 May 2023 13:39:44 +0200
In-Reply-To: <20230428071618.805982-1-xiangyu.chen@eng.windriver.com> (Xiangyu
 Chen's message of "Fri, 28 Apr 2023 15:16:18 +0800")
Message-ID: <87mt2oe0vz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/crun: bump to version 1.8.4
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Xiangyu" == Xiangyu Chen <xiangyu.chen@eng.windriver.com> writes:

 > From: Xiangyu Chen <xiangyu.chen@windriver.com>
 > Changes:
 > https://github.com/containers/crun/releases/tag/1.8.4

 > Also emoved 0001-src-crun.c-fix-build-without-dlfcn.h.patch, this
 > commit has already existed in the latest version release.

 > Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
