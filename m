Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C98C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E91E4056F;
	Wed, 21 Sep 2022 20:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E91E4056F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B4_-J9jRr-uE; Wed, 21 Sep 2022 20:38:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07B90404B1;
	Wed, 21 Sep 2022 20:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07B90404B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 786471BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5240941729
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5240941729
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XdAdFv3JVYMr for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:37:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DF52416B6
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DF52416B6
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:37:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 96A82240004;
 Wed, 21 Sep 2022 20:37:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ob6Tj-002NhK-KU; Wed, 21 Sep 2022 22:37:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <86e49bd780aa5abaf88bff19572a0847dff79cb8.1663079879.git.yann.morin@orange.com>
 <7149_1663079883_632095CB_7149_153_1_84f14454278c823f23654b20e44af7dc646b6fdd.1663079879.git.yann.morin@orange.com>
Date: Wed, 21 Sep 2022 22:37:55 +0200
In-Reply-To: <7149_1663079883_632095CB_7149_153_1_84f14454278c823f23654b20e44af7dc646b6fdd.1663079879.git.yann.morin@orange.com>
 (yann morin's message of "Tue, 13 Sep 2022 16:37:59 +0200")
Message-ID: <87r104cvks.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: Add Yann (at work) for gpsd
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

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Committed to 2022.02.x, 2022.05.x and 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
