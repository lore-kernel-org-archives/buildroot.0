Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F41C4708E
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 13:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45B4581FE1;
	Wed,  7 Dec 2022 13:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45B4581FE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dW9JTtZCxND8; Wed,  7 Dec 2022 13:36:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8644481FBB;
	Wed,  7 Dec 2022 13:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8644481FBB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD27C1BF4D8
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9968C40156
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9968C40156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xdqGMEwONWcB for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 13:36:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D753E40123
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D753E40123
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 13:36:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1C769240009;
 Wed,  7 Dec 2022 13:36:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p2ub7-00GsbN-Ax; Wed, 07 Dec 2022 14:36:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Zikui Zhao <zhaozikui@eswincomputing.com>
References: <20221202034841.1172-1-zhaozikui@eswincomputing.com>
 <20221202034841.1172-2-zhaozikui@eswincomputing.com>
Date: Wed, 07 Dec 2022 14:36:29 +0100
In-Reply-To: <20221202034841.1172-2-zhaozikui@eswincomputing.com> (Zikui
 Zhao's message of "Fri, 2 Dec 2022 11:48:41 +0800")
Message-ID: <877cz349pe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] docs/manual: fixed some spelling
 mistakes
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
Cc: jinyanjiang@eswincomputing.com, zhuwenjun@eswincomputing.com,
 buildroot@buildroot.org, zhengyu@eswincomputing.com,
 zhangdongdong@eswincomputing.com, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Zikui" == Zikui Zhao <zhaozikui@eswincomputing.com> writes:

 > Fixed some spelling mistakes of countable nouns.
 > Signed-off-by: Zikui Zhao <zhaozikui@eswincomputing.com>
 > Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
